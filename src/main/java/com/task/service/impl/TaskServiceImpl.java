package com.task.service.impl;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import com.task.common.dto.TaskDTO;
import com.task.common.response.Response;
import com.task.service.TaskService;

public class TaskServiceImpl implements TaskService {

	@Autowired
	private RestTemplate template;

	/**
	 * This method will call create service.
	 */
	public Response createNewTask(TaskDTO dto) {
		final String uri = "http://localhost:9003/mytask/api/createTask";
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String currentDate = format.format(date);
		dto.setTaskCreationDate(currentDate);
		Response result = template.postForObject( uri, dto, Response.class);
		return result;
	}

	/**
	 * This method will call update service.
	 */
	public Response updateTask(TaskDTO dto) {
		final String uri = "http://localhost:9003/mytask/api/updateTask";
		Response result = template.postForObject( uri, dto, Response.class);
		return result;	}

	/**
	 * This method will call delete service.
	 */
	public Response deleteTask(Integer id) {
		final String uri = "http://localhost:9003/mytask/api/deleteTask?id="+id;
		Response result = template.getForObject(uri, Response.class, "");
		return result;
	}

	/**
	 * This method will call retrieve service.
	 */
	public Response getTask(String status) {
		final String uri = "http://localhost:9003/mytask/api/retrieveTask?status="+status;
		Response result = template.getForObject(uri, Response.class, "");
		return result;
	}
	
	/**
	 * This method will call mark complete webservice.
	 */
	public Response markComplete(Integer id) {
		final String uri = "http://localhost:9003/mytask/api/markComplete?id="+id;
		Response result = template.getForObject(uri, Response.class, "");
		return result;
	}
	
	public HttpHeaders getHeader() {
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return headers;
	}
	
	public HttpEntity<String> getHttpEntity() {
		HttpEntity<String> entity = new HttpEntity<String>("parameters", getHeader());
		return entity;
	}

	

}
