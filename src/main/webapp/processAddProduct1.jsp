<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@page import="java.text.SimpleDateFormat"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String filename = "";
		/* String realFolder = "C:\\upload"; // 웹 애플리케이션상의 절대 경로 */
		
		String realFolder = getServletContext().getRealPath("/") + "upload2";
		System.out.println("경로확인---->"+realFolder);
		
		int maxSize = 5 * 1024 * 1024; // 최대 업로드될 파일의 크기 5MB
		String encType = "utf-8"; //인코딩 유형
		
		MultipartRequest multi = new MultipartRequest(request, realFolder,
				maxSize, encType, new DefaultFileRenamePolicy());
		
		
		String productId = multi.getParameter("productId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String color = multi.getParameter("color");
		String manufacturer = multi.getParameter("manufacturer");
		String releaseDate = multi.getParameter("releaseDate");
		
		// Convert String to java.sql.Date
		java.sql.Date sqlReleaseDate = null;
		if (releaseDate != null && !releaseDate.isEmpty()) {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    java.util.Date parsedDate = dateFormat.parse(releaseDate);
		    sqlReleaseDate = new java.sql.Date(parsedDate.getTime());
		}
		Integer price;
		
		if(unitPrice.isEmpty())
			price = 0;
		else
			price = Integer.valueOf(unitPrice);
		
		long stock;
		
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		PreparedStatement pstmt = null;
		
		String sql = "insert into product1 values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.setString(2, name);
		pstmt.setInt(3, price);
		pstmt.setString(4, color);
		pstmt.setDate(5, sqlReleaseDate); // 변경된 부분
		pstmt.setString(6, manufacturer);
		pstmt.setString(7, fileName);
		pstmt.executeUpdate();
		
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
		
		response.sendRedirect("main.jsp");
	%>
</body>
</html>
