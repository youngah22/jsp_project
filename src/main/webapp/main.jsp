<%@ page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>main</title>
</head>
<style>
	.cololr-1{
		background-color: black;
		color: white;
	}
</style>
<body>
	<%@ include file = "menu.jsp" %>

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
			<h4 class = display-3>상품목록</h4>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT MI.p_id, MI.p_image, P1.p_name, P1.p_color, P1.p_unitprice, " +
			             "P1.p_manufacturer, P1.p_releasedate " +
			             "FROM model_image MI " +
			             "INNER JOIN product1 P1 ON MI.p_id = P1.p_id AND P1.p_color = MI.p_color";


				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()){
			%>
			<div class="col-md-4">
				<!-- 이미지 클릭시 상세정보 페이지 이동  -->
				<p><a href="./product1.jsp?id=<%=rs.getString("p_id")%>">
                <img src="./upload2/<%=rs.getString("p_image") %>" style="width: 100%"> 
            	</a>
            	<h5><%=rs.getString("p_manufacturer")%></h5> 
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_UnitPrice")%>원
			</div>
			<%
				}
			
			
			if(rs !=null)
				rs.close();
			if(pstmt !=null)
				pstmt.close();
			if(conn !=null)
				conn.close();
%>
			</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>