package com.socialnetwork.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.socialnetwork.model.entity.Profile;
import com.socialnetwork.model.entity.SiteUser;
import com.socialnetwork.model.entity.StatusUpdate;
import com.socialnetwork.service.ProfileService;
import com.socialnetwork.service.StatusUpdateService;
import com.socialnetwork.service.UserService;

@Controller
public class PageController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	

	@Autowired
	private StatusUpdateService statusUpdateService;
	
	@Autowired
	private UserService userService;

	@Autowired
	private ProfileService profileService;
	
	@Value("${message.error.forbidden}")
	private String accessDeniedMessage;
	
	/*
	 * private SiteUser getUser() {
	 * 
	 * Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	 * String email = auth.getName(); return userService.get(email); }
	 */

	@RequestMapping("/")
	ModelAndView home(ModelAndView modelAndView) {
		StatusUpdate statusUpdate = statusUpdateService.getLatest();
		modelAndView.getModel().put("statusUpdate", statusUpdate);
		
		/*
		 * if(user==null){ modelAndView.setViewName("redirect:/"); }
		 * 
		 * Profile profile = profileService.getUserProfile(user);
		 * 
		 * if (profile == null) { profile = new Profile(); profile.setUser(user);
		 * profileService.save(profile); }
		 * 
		 * Profile webProfile = new Profile(); webProfile.safeCopyFrom(profile);
		 */

		
		/*
		 * modelAndView.getModel().put("userId", user.getId());
		 * modelAndView.getModel().put("profile", webProfile);
		 */
		List<Profile> profile = profileService.getAllProfile();
		for(int i=0;i<profile.size();i++){
		    System.out.println("......................"+profile.get(i).getAbout());
		    System.out.println("......................"+profile.get(i).getUser().getFirstname());
		} 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		logger.info("Login info language: - Id: {}, Name: {}", auth.getName(), auth.getDetails());
		
		// System.out.println("......................"+auth.getName()+"......."+auth.getDetails());
		modelAndView.getModel().put("profile", profile);
		
		modelAndView.setViewName("app.homepage");
		
		
		return modelAndView;
	}
	
	@RequestMapping("/403")
	ModelAndView accessDenied(ModelAndView modelAndView) {
		modelAndView.getModel().put("message", accessDeniedMessage);
		modelAndView.setViewName("app.message");
		return modelAndView;
	}
	
	@RequestMapping("/404")
	ModelAndView error404(ModelAndView modelAndView) {
		modelAndView.getModel().put("message", "error 404");
		modelAndView.setViewName("app.message");
		return modelAndView;
	}

	@RequestMapping("/about")
	String about() {
		return "app.about";
	}

}
