<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>페이지 오류</title>
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
	<div class="jumbotron bg-secondary text-white">
		<div class="container">
			<h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURL()%></p>
		<p> <a href="main.jsp" class="btn btn-secondary">상품 목록
		&raquo;</a>
	</div>
</body>
</html>