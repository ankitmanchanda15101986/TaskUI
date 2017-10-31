package com.task.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.task.common.dto.TaskDTO;
import com.task.common.response.Response;
import com.task.service.impl.TaskServiceImpl;

@Controller
public class TaskController {

	@Autowired
	private TaskServiceImpl service;
	
	private final Logger logger = LoggerFactory.getLogger(TaskController.class);
	
	@RequestMapping(value="/", method=RequestMethod.GET) 
	private String welcome(Model model) {
		return "welcome";
	}
	
	@RequestMapping(value="/createTask", method=RequestMethod.GET) 
	private String createTask(@ModelAttribute("taskForm") TaskDTO dto, Model model) {
		return "createTask";
	}
	
	
	@RequestMapping(value="/createTaskResult",  produces = MediaType.APPLICATION_JSON_VALUE ,method=RequestMethod.POST)
	private String createTaskResult(@ModelAttribute("taskForm") TaskDTO dto, Model model, BindingResult result) {
		boolean error = false;
		if(dto.getTaskName().isEmpty()){
	        result.rejectValue("taskName", "error.name");
	        error = true;
	    }
		if(dto.getTaskDescription().isEmpty()){
	        result.rejectValue("taskDescription", "error.description");
	        error = true;
	    }
		if(!error) {
			Response response = service.createNewTask(dto);
			model.addAttribute("status", response.getStatus_msg());
			model.addAttribute("response", response.getTaskList().get(0));
			if(response.getStatus_codes().equalsIgnoreCase("200")) {
				model.addAttribute("taskForm", new TaskDTO());
			}
		} 
		return "createTask";
	}
	
	
	@RequestMapping(value="/deleteTask",  method=RequestMethod.GET)
	@ResponseBody
	private String deleteTaskResult(@RequestParam("id") String id, Model model) {
		try {
			Response response = service.deleteTask(Integer.parseInt(id));
			return response.getStatus_msg();
		} catch(Exception ex) {
			System.out.println("Caught exception "+ex);
			return "Caught some error while performing task, Please contact system administrator";
		}
		
		
	}
	
	@RequestMapping(value="/markAsComplete", method=RequestMethod.GET)
	@ResponseBody
	private String markAsComplete(@RequestParam("id")  String id, Model model) {
		try {
			Response response = service.markComplete(Integer.parseInt(id));
			return response.getStatus_msg();
		} catch (Exception ex) {
			System.out.println("Caught exception " + ex);
			return "Caught some error while performing task, Please contact system administrator";
		}
		
	}
	
	@RequestMapping(value="/retrieveTask", method=RequestMethod.GET) 
	private String retrieveTask(Model model) {
		return "searchTask";
	}
	
	@RequestMapping(value="/retrieveTaskResult" ,method=RequestMethod.GET)
	private String retrieveTaskResult(@RequestParam(value="status", required=true, defaultValue="All") String status, Model model) {
		model.addAttribute("status", status);
		if(status.equalsIgnoreCase("All")) {
			status = "";
		}
		Response response = service.getTask(status);
		model.addAttribute("statusMessage", response.getStatus_msg());
		model.addAttribute("response", response.getTaskList());
		return "searchTask";
		
	}

}
