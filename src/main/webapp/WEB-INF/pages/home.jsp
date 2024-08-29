<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- uri for jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- uri for form library -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:out value="${page}"></c:out></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>

	<div class="container mt-3">
		<h1 class="text-center">Welcome ToDo Manager</h1>

		<c:if test="${not empty message}">
			<div class="alert alert-success">
				<b><c:out value="${message }"></c:out></b>
			</div>
		</c:if>

		<div class="row mt-5">
			<div class="col-md-2">
				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item-action active"
						aria-current="true">Menu</button>
					<a href='<c:url value='/add'></c:url>'
						class="list-group-item list-group-item-action">Add</a> <a
						href='<c:url value='/home'></c:url>'
						class="list-group-item list-group-item-action">View</a>
				</div>
			</div>
			<div class="col-md-10">
				<c:if test="${page== 'Home'}">
					<h3 class="text-center">Content</h3>
					<h1 class="text-center">All ToDos</h1>
					<c:forEach items="${todos }" var="t">
						<div class="card  p-3">
							<div class="card-body">
								<h3><c:out value="${t.todoTitle }"></c:out></h3>
							</div>
							<p><c:out value="${t.todoContent }"></c:out></p>
						</div>
					</c:forEach>
					
					
				</c:if>
				<c:if test="${page== 'Add'}">
					<h1 class="text-center">Add ToDo</h1>
					<br>
					<form:form action="saveTodo" method="post" modelAttribute="todo">
						<div class="form-group">
							<form:input path="todoTitle" cssClass="form-control"
								placeholder="Enter ToDo Title" />
						</div>
						<br>
						<div class="form-group">
							<form:textarea path="todoContent" cssClass="form-control"
								placeholder="Enter ToDo content" cssStyle="height:300px" />
						</div>
						<br>
						<div class="container text-center">
							<button class="btn btn-outline-primary">Add ToDO</button>
						</div>

					</form:form>
				</c:if>
			</div>
		</div>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>
</body>
</html>