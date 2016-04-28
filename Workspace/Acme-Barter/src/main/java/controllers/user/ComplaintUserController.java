package controllers.user;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.BarterService;
import services.ComplaintService;
import services.MatchService;
import controllers.AbstractController;
import domain.Barter;
import domain.Complaint;
import domain.Match;

@Controller
@RequestMapping("/complaint/user")
public class ComplaintUserController extends AbstractController {
	
	// Services ---------------------------------------------------------------

	@Autowired
	private ComplaintService complaintService;

	@Autowired
	private MatchService matchService;
	
	@Autowired
	private BarterService barterService;

	// Constructors -----------------------------------------------------------

	public ComplaintUserController() {
		super();
	}

	// Listing ----------------------------------------------------------------
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam int barterOrMatchId) {
		ModelAndView result;
		Collection<Complaint> complaints;
		String barterOrMatchName;

		complaints = complaintService.findAllByBarterOrMatch(barterOrMatchId);
		
		barterOrMatchName = null;
		
		try{
			
			Barter barter;
			
			barter = barterService.findOne(barterOrMatchId);
			
			barterOrMatchName = barter.getTitle();
			
		}catch(Exception barterException){
			
			try{
				
				Match match;
				
				match = matchService.findOne(barterOrMatchId);
				
				barterOrMatchName = match.getCreatorBarter().getTitle() + " - " + match.getReceiverBarter().getTitle();
				
			}catch(Exception matchAndBarterException){
				
				Assert.isTrue(false, "You have to choose a Barter or a Match to see the Complaints asociated.");
				
			}
			
		}
		
		Assert.notNull(barterOrMatchName, "You have to choose a Barter or a Match to see the Complaints asociated.");
		
		result = new ModelAndView("complaint/list");
		result.addObject("requestURI", "complaint/user/list.do");
		result.addObject("complaints", complaints);
		result.addObject("barterOrMatchId", barterOrMatchId);
		result.addObject("barterOrMatchName", barterOrMatchName);

		return result;
	}
	
	// Creation ---------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam int barterOrMatchId) {
		ModelAndView result;
		Complaint complaint;

		complaint = complaintService.create(barterOrMatchId);
		
		result = createEditModelAndView(complaint);

		return result;
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid Complaint complaint, BindingResult binding) {
		ModelAndView result;
		int barterOrMatchId;
		
		if(complaint.getMatch() != null){
			barterOrMatchId = complaint.getMatch().getId();
		}else{
			barterOrMatchId = complaint.getBarter().getId();
		}

		if (binding.hasErrors()) {
			result = createEditModelAndView(complaint);
		} else {
			try {
				complaintService.save(complaint);
				result = new ModelAndView("redirect:list.do?barterOrMatchId=" + barterOrMatchId);
			} catch (Throwable oops) {
				result = createEditModelAndView(complaint, "complaint.commit.error");
			}
		}

		return result;
	}
	
	// Ancillary methods ------------------------------------------------------
	
	protected ModelAndView createEditModelAndView(Complaint complaint) {
		ModelAndView result;

		result = createEditModelAndView(complaint, null);
		
		return result;
	}
	
	protected ModelAndView createEditModelAndView(Complaint complaint, String message) {
		ModelAndView result;
		
		result = new ModelAndView("complaint/create");
		result.addObject("complaint", complaint);
		result.addObject("message", message);

		return result;
	}

}
