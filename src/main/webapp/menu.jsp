<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String sessionId = (String) session.getAttribute("sessionId");
%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메뉴</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand navbar-dark bg-dark">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/ShoesMarket/main.jsp">Home</a>
            </div>
        </div>
        <div>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link text-white" href="<c:url value="/BoardListAction.do?pageNum=1"/>">cs게시판</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="<c:url value="./cart.jsp"/>">장바구니</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="<c:url value="/member/updateMember.jsp"/>">마이페이지</a></li>                
                 <li class="nav-item"><a class="nav-link text-white" href="<c:url value="/addProduct1.jsp"/>">상품 관리</a></li>
                 <%--
                <li class="nav-item"><a class="nav-link text-white" href="<c:url value="/editProduct.jsp?edit=update"/>">상품 수정</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="<c:url value="/editProduct.jsp?edit=delete"/>">상품 삭제</a></li> --%>
                
                
                <c:choose>
                    <c:when test="${empty sessionId}">
                        <li class="nav-item"><a class="nav-link text-white" href="<c:url value="/member/loginMember.jsp"/>">로그인</a></li>
                        <%-- <li class="nav-item"><a class="nav-link text-white" href="<c:url value="/member/addMember.jsp"/>">회원 가입</a></li> --%>
                    </c:when>
                    <c:otherwise>
                        <li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>
                        <li class="nav-item"><a class="nav-link text-white" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </nav>
</body>
</html>
