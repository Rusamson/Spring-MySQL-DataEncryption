package com.samson;

import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.samson.model.Booking;   
import com.samson.service.BookingService; 

@Controller 
@RequestMapping("/booking")
public class BookingController {
	private BookingService bookingService; 
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired(required=true)
	@Qualifier(value="bookingService")
	public void setBookingService(BookingService bs){
		this.bookingService = bs;
	}
	
	@RequestMapping(value= "/add", method = RequestMethod.POST)
	public String addBooking(@ModelAttribute("booking") Booking b){  
		b.setRemember(0);
		b.setStatus(0);
		logger.info("add user method called"); 
		if(b.getId() == 0){
			logger.info("new Booking created");
			 this.bookingService.add(b); 
		}else{
			logger.info("Booking updated");
			this.bookingService.update(b);
		}
		return "redirect:/booking/user/"+b.getUserID();
	}
 
	@RequestMapping("/remove/{userID}/{id}")
    public String removeBooking(@PathVariable("userID") int userID, @PathVariable("id") int id){
        this.bookingService.remove(id);
        return "redirect:/booking/user/"+userID;
    } 
	
    @RequestMapping("/all")
    public String getAllBookings( Model model){ 
         model.addAttribute("bookings", this.bookingService.getAll()); 
        return "bookings";
    } 
    
    @RequestMapping(value = "/user/{userID}") 
    public ModelAndView  listOfBookingsByUser( @PathVariable("userID") int userID , Model model){ 
           List<Booking> list = this.bookingService.getAllByUserId(userID);
 	    	   return new ModelAndView("mybookings","mybookingsList",list); 
	    }
    
    @RequestMapping(value = "/country/{country}") 
    public ModelAndView  listOfBookingsByCountry( @PathVariable("country") String country , Model model){ 
           List<?> list = this.bookingService.getAllByUserCountry(country); 
          /* List<Booking> usersList = new ArrayList<Booking>();
           for(int i=0; i<list.size(); i++) {
        	    Object[] row = (Object[]) list.get(i); 
        	    User user= (User )row[0]; 
        	    Booking book = (Booking)row[1];
        	    usersList.add(book);
        	}*/   
 	    	   return new ModelAndView("book_list","myList",list); 
	    } 
      //AJAX JSON methods start
  	 @RequestMapping(value = "/user/ajax/{userID}", method = RequestMethod.GET)
  	public @ResponseBody String listOfBookingsByUserAJAX(@PathVariable("userID") int userID ) {
  		 ArrayList<Booking> bookings =  (ArrayList<Booking>) this.bookingService.getAllByUserId(userID);
  		 String json = new Gson().toJson(bookings);
  		 return json; 
  	 } 
  	 @RequestMapping(value = "/status/{bookingID}", method = RequestMethod.GET)
  	public @ResponseBody String getStatus(@PathVariable("bookingID") int bookingID ) {
  		Booking b = this.bookingService.getById(bookingID);
  		 return ""+b.getStatus(); 
  	 } 
}