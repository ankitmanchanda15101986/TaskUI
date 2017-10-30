package com.task.service;

import java.util.Date;

import com.task.common.dto.TaskDTO;
import com.task.common.response.Response;

public interface TaskService {
	
	public Response createNewTask(TaskDTO dto);
	
	public Response updateTask(TaskDTO dto);
	
	public Response deleteTask(Integer id);
	
	public Response getTask(String status);
	
	public Response markComplete(Integer id);

}
