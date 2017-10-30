<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<head>
<title>TASK MANAGEMENT</title>

<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>

<spring:url value="/" var="urlHome" />
<spring:url value="/createTask" var="urlAdTask" />
<spring:url value="/retrieveTaskResult?status=All" var="urlRetrieveTask" />

<nav class="navbar">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="${urlHome}">Home</a>
		</div>
		<div id="navbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${urlAdTask}">Create New Task</a></li>
				<li><a href="${urlRetrieveTask}">Search Task</a></li>
			</ul>
		</div>
	</div>
</nav>