<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/header.jsp" />

<div class="container">

<h1>Create New Task</h1>
<style>
    .error 
    {
        color: #ff0000;
        font-weight: bold;
    }
</style>
<script type="text/javascript">
	
</script>
	<br />
	<c:if test="${not empty status}">
		<div class="alert alert-info">
			${status}
		</div>	
	</c:if>
	<form:form class="form-horizontal" method="post" modelAttribute="taskForm" action="createTaskResult">

		<form:hidden path="taskId" />

		<spring:bind path="taskName">
			<div class="form-group">
				<label class="col-sm-2 control-label">Name</label>
				<div class="col-sm-5">
					<form:input path="taskName" type="text" class="form-control " id="name" placeholder="Name" />
				</div>
				<form:errors path="taskName" cssClass="error" />
			</div>
		</spring:bind>
		
		<spring:bind path="taskDescription">
			<div class="form-group">
				<label class="col-sm-2 control-label">Description</label>
				<div class="col-sm-5">
					<form:input path="taskDescription" type="text" class="form-control " id="description" placeholder="description" />
					
				</div>
				<form:errors path="taskDescription" cssClass="error" />
			</div>
		</spring:bind>
		
		<form:hidden path="taskCurrentStatus" />		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-5">
					<button type="submit" class="btn-lg btn-primary pull-right">Submit</button>
			</div>
		</div>
	</form:form>

</div>

<jsp:include page="../fragments/footer.jsp" />

</body>
</html>