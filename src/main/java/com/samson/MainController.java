package com.samson;
  
  
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;  
import org.springframework.web.bind.annotation.*; 
import org.springframework.web.servlet.ModelAndView;

import com.samson.model.User;
import com.samson.service.UserService;

 
 
 
@Controller 
@SessionAttributes("sessionUser")
public class MainController { 
	
	private UserService userService;  
	
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService us){
		this.userService = us;
	}
	
	   @RequestMapping("/{page}")
	    public ModelAndView loadPages(@PathVariable("page") String page , Model model){ 
	      //  return page;
		   return new ModelAndView(page,"info","page loaded");
	    }  
       @RequestMapping(value = "/login/{page}") 
       public ModelAndView  login(@RequestParam("email") String email,@RequestParam("password") String password, @PathVariable("page") String page , Model model){
         
    	    try { 
    	    	  User u = (User) userService.registerUser(email,password); 
    	    	  if(u != null){
    	    	  model.addAttribute("sessionUser", u); 
    	    	   return new ModelAndView(page,"loginResult","Success");
    	    	  }
    	    	  else{ 
    	    		   return new ModelAndView("index","loginResult","Wrong username or password");
    	    	   } 
    	    	}
    	    catch(Exception e){
    	    	return new ModelAndView("index","loginResult","Wrong Email or try again Later"); 
    	  }  
	    }
       
	   @RequestMapping("/session/expired")
	    public ModelAndView sessionExpired(Model model){ 
		   return new ModelAndView("index","loginResult","Your Session Expired, Please Login again");
	    }  
}
