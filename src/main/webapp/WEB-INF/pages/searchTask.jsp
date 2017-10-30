<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/header.jsp" />

<div class="container">
<script type="text/javascript">
	
	function markAsComplete(id,oldStatus) {
		$.ajax(
				   {
				      type:'GET',
				      url:'markAsComplete',
					  data:"id="+id,
					  success: function(response){
						alert(response);
						window.location = 'retrieveTaskResult?status='+oldStatus;
					  },
					   error: function(response) {
						alert(response);
					   }
					});
	}
	
	function deleteTask(id,oldStatus) {
		$.ajax(
				   {
				      type:'GET',
				      url:'deleteTask',
					  data:"id="+id,
				      success: function(response){
						alert(response);
						window.location = 'retrieveTaskResult?status='+oldStatus;
					  },
					   error: function(response) {
						alert(response);
					   }
					});
		}
</script>

<h2>Search Task</h2>
<c:if test="${not empty statusMessage}">
<div class="alert alert-info">
  ${statusMessage}
</div>
</c:if>

	<br />
	<form:form class="form-horizontal" method="get" modelAttribute="taskForm" action="retrieveTaskResult">
		<div class="row" id="search">
		    <div class="col-sm-12 col-md-4 col-lg-4">
				<div class="row">
					<div class="col-sm-2">
						<label class="control-label">Status</label>
					</div>
					<div class="col-sm-6">
						<select id="status" class="form-control" name="status">
						  <option value="All">ALL</option>
						  <option value="Pending">PENDING</option>
						  <option value="Complete">COMPLETED</option>
						</select>
					</div>
					<div class="col-sm-4">
						<button class="btn btn-primary" type="submit">Submit</button>
					</div>
				</div>
			</div>
		</div>	
	 </form:form><br>
	 <!--Booking details >> Table start here-->
	 <c:if test="${not empty response}">
		<div class="row" id="searchResult">
		    <div class="col-sm-12 col-md-12 col-lg-12">
		    	<table class="table table-bordered table-hover" id="resultTable">
		        	<thead>
		            	<tr class="bg-info">
							<th>Id</th>
							<th>Name</th>
		                	<th>Description</th>
		                	<th>Creation Date</th>
		                    <th>Status</th>
		                    <th>Update</th>
		                    <th>Delete</th>
		                </tr>
		                 </thead>
		             <tbody>
		               <c:forEach var="task" items="${response}">
			               <tr>
								<td>${task.taskId}</td>
								<td>${task.taskName}</td>
								<td>${task.taskDescription}</td>
								<td>${task.taskCreationDate}</td>
								<td>${task.taskCurrentStatus}</td>
								<td>
								<c:if test="${task.taskCurrentStatus == 'Complete'}">
									<button class="btn btn-error" onclick="markAsComplete(${task.taskId},'${status}')" disabled>Mark as complete</button>
								</c:if>	
								<c:if test="${task.taskCurrentStatus == 'Pending'}">
									<button class="btn btn-success" onclick="markAsComplete(${task.taskId},'${status}')" >Mark as complete</button>
								</c:if>
								</td>
								<td>
								<button class="btn btn-danger" onclick="deleteTask(${task.taskId},'${status}')">Delete</button>
								</td>
							</tr>	
		               </c:forEach>
		            </tbody>
		        </table>
		    </div>
		</div>
		</c:if>
</div>

<jsp:include page="../fragments/footer.jsp" />
<script type="text/javascript">

	$(document).ready(function() {
		var getStatus = '${status}';
		$('#status').val(getStatus);
	});
</script>

</body>
</html>