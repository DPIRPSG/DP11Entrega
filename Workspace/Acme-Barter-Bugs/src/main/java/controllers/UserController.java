package controllers;

import java.util.Collection;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import domain.User;
import domain.form.ActorForm;

import services.ActorService;
import services.UserService;
import services.form.ActorFormService;

@Controller
@RequestMapping(value = "/user")
public class UserController extends AbstractController{

	//Services ----------------------------------------------------------
	
	@Autowired
	private ActorFormService actorFormService;
	
	@Autowired
	private Validator actorFormValidator;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ActorService actorService;
	
	//Constructors ----------------------------------------------------------
	
	public UserController(){
		super();
	}

	//Listing ----------------------------------------------------------

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(){
		ModelAndView result;
		Collection<User> users;
		
		users = userService.findAll();
				
		result = new ModelAndView("user/list");
		result.addObject("users", users);
		result.addObject("requestURI", "user/list.do");
		
		if(actorService.checkAuthority("USER")){
			result.addObject("IfollowTo", userService.getFollowed());
			result.addObject("userId", String.valueOf(userService.findByPrincipal().getId()));
		}
		
		return result;
	}
	//Creation ----------------------------------------------------------
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(){
		ModelAndView result;
		ActorForm consu;
		
		consu = actorFormService.createForm();
		result = createEditModelAndView(consu);
		
		return result;
	}
	
	//Edition ----------------------------------------------------------
	
	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid ActorForm consu,
			BindingResult binding
			, HttpServletResponse response
			){
		actorFormValidator.validate(consu, binding);
		
		ModelAndView result;
		
		if(binding.hasErrors()){
			result = createEditModelAndView(consu);
		} else {
			try {
				Cookie cook2;
				int idConsu;
				
				idConsu = actorFormService.saveForm(consu);

				result = new ModelAndView("redirect:../security/login.do");
				result.addObject("messageStatus", "user.commit.ok");
				
				cook2 = new Cookie("createSocialIdentity", String.valueOf(idConsu) + consu.getCreateSocialIdentity().toString());
				
				cook2.setPath("/");
				
				response.addCookie(cook2);
			
			} catch (Throwable oops){
				result = createEditModelAndView(consu, "user.commit.error");
			}
		}
		
		return result;
	}
	//Ancillary Methods ----------------------------------------------------------


	protected ModelAndView createEditModelAndView(ActorForm customer){
		ModelAndView result;
		
		result = createEditModelAndView(customer, null);
		
		return result;
	}
	
	protected ModelAndView createEditModelAndView(ActorForm customer, String message){
		ModelAndView result;
		
		result = new ModelAndView("actorForm/create");
		result.addObject("actorForm", customer);
		result.addObject("message", message);
		result.addObject("urlAction", "user/create.do");
		
		return result;
	}
}
