<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%!String greeting = "ShoesShoppingMall";%>
	
	<div class = "jumbotron bg-dark text-white mb-0">
		<div class = "container text-center">
			<h1 class = display-3>
				<%= greeting %>
			</h1>
		</div>
	</div>
	<div class = "jumbotron bg-secondary text-white ">
		<div class = "container text-center">
			<h4 class = display-3>로그인</h4>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해주세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID"
					name="j_username" required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password"
					name="j_password" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block"
				type="submit">로그인</button>
			</form>
		</div>
	</div>
</body>
</html>