
package com.tcb.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.tcb.common.FTPLoggerThread;


@Controller
public class GreetingCommonAction {

	@RequestMapping(value = "/showPage/{name}")  
	public ModelAndView showPage(@PathVariable String name) { 
		
		String loger = "";
		loger = loger.concat(new Date().toString());
		
		Map<String, Object> model = new HashMap<String, Object>();
		name = name.replace("-", "\t");
		model.put("name", name);
		try {
			loger = loger.concat("Jai mata di"+name);
			
			FTPLoggerThread ft = new FTPLoggerThread();
			ft.str = loger;
			ft.pageid = "";
			ft.start();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("showPage", model); 
	} 
	
	@RequestMapping(value = "/greeting/{pageid}/{name}")  
	public ModelAndView showAdvPage(@PathVariable String pageid, @PathVariable String name) { 
		
		String returnpage = "showPage";
		returnpage = returnpage.concat(pageid);
		
		String loger = "";
		loger = loger.concat(new Date().toString());
		
		Map<String, Object> model = new HashMap<String, Object>();
		name = name.replace("-", "\t");
		
		System.out.println("जीवन============="+name);
		model.put("name", name);
		try {
			loger = loger.concat("Jai mata di"+name);
			
			FTPLoggerThread ft = new FTPLoggerThread();
			ft.str = loger;
			ft.pageid = pageid;
			ft.start();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView(returnpage, model); 
	} 
}
