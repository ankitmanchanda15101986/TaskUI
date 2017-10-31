package com.task.common.helper;

import com.task.common.response.Response;

public class TaskHelper {

	/**
	 * This method will return error response.
	 * @return
	 */
	public static Response errorResponse() {
		Response resp = new Response();
		resp.setStatus_codes("400");
		resp.setStatus_msg("Caught some error, Please contact system administrator");
		return resp;
	}
}
