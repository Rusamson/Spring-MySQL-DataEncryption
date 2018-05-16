package com.samson;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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

 




import org.springframework.web.servlet.ModelAndView;

import com.samson.model.Trip; 
import com.samson.service.TripService;

@Controller 
@RequestMapping("/trip")
public class TripController {
	
	private TripService tripService; 
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired(required=true)
	@Qualifier(value="tripService")
	public void setTripService(TripService ts){
		this.tripService = ts;
	}
	
	@RequestMapping(value= "/add/{id}/{userID}/{driverID}/{date}", method = RequestMethod.GET)
	public String addTrip(@ModelAttribute("trip") Trip t, 
			@PathVariable("id") int bookingID,
			@PathVariable("userID") int userID, 
			@PathVariable("driverID") int driverID,
			@PathVariable("date") String date){  
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSS");
		
		long lTime = Long.parseLong(date); 
		Date currentDate = new Date(lTime); 
		
		t.setBookingID(bookingID);
		t.setClientID(userID);
		t.setDriverID(driverID); 
		t.setAcceptedtime(dateFormat.format(currentDate));
		 
		this.tripService.add(t, bookingID); 
		return "redirect:/options";
	}
 
	@RequestMapping("/remove/{id}")
    public String removeTrip(@PathVariable("id") int id){
        this.tripService.remove(id);
        return "redirect:/trip/all";
    } 
    @RequestMapping(value = "/{userID}") 
    public ModelAndView  listOfTripsByDriver( @PathVariable("userID") int userID , Model model){ 
        List<?> list = this.tripService.getAllByDriver(userID); 
 	    	   return new ModelAndView("all_my_trips","myList",list); 
	    }
    @RequestMapping("/all")
    public String editCoordinate( Model model){ 
         model.addAttribute("bookings", this.tripService.getAll()); 
        return "trips";
    } 
 
}