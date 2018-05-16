package com.samson;
  
  
import java.io.ByteArrayOutputStream; 
import java.io.IOException;
import java.io.InputStream; 
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths; 
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;  
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod; 
 
     
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

 


import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.samson.model.User; 
import com.samson.service.UserService;
 
@Controller 
@RequestMapping("/user")
public class UserController {
	private UserService userService; 
	protected final Log logger = LogFactory.getLog(getClass());

	
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService us){
		this.userService = us;
	}
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value= "/add", method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("user") User u){   
		logger.info("add user method called");
		u.setDriver(0);
		u.setPicture(0);
		if(u.getUserID() == 0){
			logger.info("new user created");
			this.userService.add(u);
		}else{
			logger.info("user updated");
			this.userService.update(u);
		}
		return new ModelAndView("index","loginResult","Your Account has been created , You can login "); 
	}
 
	@RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id){
        this.userService.remove(id);
        return "redirect:/user/all";
    }
	@RequestMapping(value= "/register/driver", method = RequestMethod.POST)
	public ModelAndView updateUserToDriver(@ModelAttribute("user") User u, Model model){   
		    User usercopy = this.userService.getById(u.getUserID()); 
		    usercopy.setDriver(1);
		    usercopy.setPhone(u.getPhone()); 
		    usercopy.setPlate(u.getPlate()); 
		    usercopy.setAddress(u.getAddress()); 
	    	this.userService.update(usercopy); 
	    	return new ModelAndView("index","loginResult","You Registered as a driver"); 
	    } 
 
    @RequestMapping("/all")
    public String editCoordinate( Model model){ 
         model.addAttribute("users", this.userService.getAll());
    	//model.addAttribute("users", "all users will be here");
        return "users";
    } 
     
  /*  //AJAX method
	 @RequestMapping(value = "/users", method = RequestMethod.GET)
	public @ResponseBody String listUsers() {
		 ArrayList users =  (ArrayList) this.userService.getAll();
		 String json = new Gson().toJson(users);
		 return json; 
	} */
  
  	 @RequestMapping(value = "/driverToClient/{userID}", method = RequestMethod.GET)
  	public ModelAndView driverToClient(@PathVariable("userID") int userID) {
  	User usercopy = this.userService.getById(userID); 
    usercopy.setDriver(0); 
    this.userService.update(usercopy); 
	return new ModelAndView("index","loginResult","You can Login as a Client");  
  	}  
  	 @RequestMapping(value = "/clientToDriver/{userID}", method = RequestMethod.GET)
  	public ModelAndView clientToDriver(@PathVariable("userID") int userID) {
  	User usercopy = this.userService.getById(userID); 
    usercopy.setDriver(1); 
    this.userService.update(usercopy); 
	return new ModelAndView("index","loginResult","You can Login as a Driver");  
  	}  
     //AJAX METHOD
  	 @RequestMapping(value = "/{userID}", method = RequestMethod.GET)
  		public @ResponseBody String  getUserName(@PathVariable("userID") int userID){ 
  		  User user = this.userService.getById(userID); 
  		 return user.getFirstname();
  		}
  	 @RequestMapping(value = "hasPicture/{userID}", method = RequestMethod.GET)
  		public @ResponseBody String  hasPicture(@PathVariable("userID") int userID){ 
  		  User user = this.userService.getById(userID); 
  		 return ""+user.getPicture();
  		}   
  	 @RequestMapping(value = "/upload", method = RequestMethod.POST)
     // @PostMapping("/upload") // //new annotation since 4.3
     public String singleFileUpload(HttpServletRequest request, @RequestParam("userID") int userID, @RequestParam("file") MultipartFile file,
                                    RedirectAttributes redirectAttributes) {  
  		    
  		 User usercopy = this.userService.getById(userID); 
         if (((MultipartFile) file).isEmpty()) {
             redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
             return "redirect:uploadStatus";
         }

         try { 
        
			String contextPath = request.getContextPath();
        	 System.out.println(contextPath);
             // Get the file and save it somewhere
             byte[] bytes = ((MultipartFile) file).getBytes();  
              //Path path = Paths.get("C://USBWebserver_v8.6//root//uploads//images//image_"+userID+".jpg");  
             //Path path = Paths.get(contextPath+File.separator+"resources"+File.separator+"image_"+userID+".jpg");  
             //Path path = Paths.get(contextPath+File.separator+"resources"+File.separator+"image_"+userID+".jpg"); 
             Path path = Paths.get("C://Program Files//Apache Software Foundation//Tomcat 8.5//webapps//rideapp_uploads//uploads//images//image_"+userID+".jpg");  
             
             System.out.println(path);
             
             Files.write(path, bytes);
              usercopy.setPicture(1);
              this.userService.update(usercopy);
              redirectAttributes.addFlashAttribute("message",
                     "You successfully uploaded to '" + path + "'");
  
         } catch (IOException e) {
            // e.printStackTrace();
        	 System.out.print(e);
        	 redirectAttributes.addFlashAttribute("message",
                     "There was a problem !");
         }

         return "redirect:/user_profile";
     }
  	 
  	 @RequestMapping(value = "/upload2/{userID}") 
  	public @ResponseBody String singleFileUpload2(@PathVariable("userID") String userID, HttpServletRequest request,  
            RedirectAttributes redirectAttributes) throws IOException {  
  		 //String name = request.getParameter("name");
  		 String id = userID;
  		 User usercopy = this.userService.getById(Integer.parseInt(userID));
  		 
  		InputStream body = request.getInputStream(); 
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int readBytes = -1;

        while((readBytes = body.read(buffer)) > 1){
            baos.write(buffer,0,readBytes);
        }

        byte[] responseArray = baos.toByteArray();
         
         Path path = Paths.get("C://Program Files//Apache Software Foundation//Tomcat 8.5//webapps//rideapp_uploads//uploads//images//image_"+id+".jpg");  

        Files.write(path, responseArray); 
    	 
        usercopy.setPicture(1);
        this.userService.update(usercopy);
        
  		  return "Your image has been sent";
  	 }
}
