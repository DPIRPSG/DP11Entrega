/* AnnouncementAdministratorController.java
 *
 * Copyright (C) 2014 Universidad de Sevilla
 *
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 * 
 */

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

import services.AttributeDescriptionService;
import services.AttributeService;
import controllers.AbstractController;
import domain.Attribute;
import domain.AttributeDescription;

@Controller
@RequestMapping("/attribute-description/user")
public class AttributeDescriptionUserController extends AbstractController {
	
	// Services ---------------------------------------------------------------

	@Autowired
	private AttributeDescriptionService attributeDescriptionService;
	
	@Autowired
	private AttributeService attributeService;
	
	// Constructors -----------------------------------------------------------
	
	public AttributeDescriptionUserController() {
		super();
	}

	// Listing ----------------------------------------------------------------
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam int itemId) {
		ModelAndView result;
		Collection<AttributeDescription> attributesDescription;

		attributesDescription = attributeDescriptionService.findAllByItemId(itemId);
		result = new ModelAndView("attribute-description/list");
		result.addObject("requestURI", "attribute-description/user/list.do");
		result.addObject("attributesDescription", attributesDescription);

		return result;
	}

	// Creation ---------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam int itemId) {
		ModelAndView result;
		AttributeDescription attributeDescription;

		attributeDescription = attributeDescriptionService.create(itemId);
		result = createEditModelAndView(attributeDescription);

		return result;
	}

	// Edition ----------------------------------------------------------------
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam int attributeDescriptionId) {
		ModelAndView result;
		AttributeDescription attributeDescription;

		attributeDescription = attributeDescriptionService.findOne(attributeDescriptionId);		
		Assert.notNull(attributeDescription);
		result = createEditModelAndView(attributeDescription);

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid AttributeDescription attributeDescription, BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			result = createEditModelAndView(attributeDescription);
		} else {
			try {
				attributeDescriptionService.save(attributeDescription);				
				result = new ModelAndView("redirect:list.do");
			} catch (Throwable oops) {
				result = createEditModelAndView(attributeDescription, "attributeDescription.commit.error");				
			}
		}

		return result;
	}
			
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(AttributeDescription attributeDescription, BindingResult binding) {
		ModelAndView result;

		try {			
			attributeDescriptionService.delete(attributeDescription);
			result = new ModelAndView("redirect:list.do");						
		} catch (Throwable oops) {
			result = createEditModelAndView(attributeDescription, "attributeDescription.commit.error");
		}

		return result;
	}
	
	// Ancillary methods ------------------------------------------------------
	
	protected ModelAndView createEditModelAndView(AttributeDescription attributeDescription) {
		ModelAndView result;

		result = createEditModelAndView(attributeDescription, null);
		
		return result;
	}	
	
	protected ModelAndView createEditModelAndView(AttributeDescription attributeDescription, String message) {
		ModelAndView result;
		Collection<Attribute> attributes;
		
		attributes = attributeService.findAll();
		
		result = new ModelAndView("attribute-description/edit");
		result.addObject("attributeDescription", attributeDescription);
		result.addObject("attributes", attributes);
		result.addObject("message", message);

		return result;
	}

}