<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%-- <%@ page import="dao.ProductRepository" %> --%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href = "./resources/css/bootstrap.min.css" />
<title>상품 상세 정보</title>
<script type="text/javascript">
/* function addToCart() {
    if (confirm("상품 주문시 회원가입을 해주세요. 회원가입 페이지로 이동합니다.")) {
        // 확인을 눌렀을 때 회원가입 페이지로 이동
        goToRegisterPage();
    } else {
        // 취소를 눌렀을 때 아무 동작 없음
        document.addForm.reset();
    }
}

function goToRegisterPage() {
    // 회원가입 페이지로 이동합니다.
    window.location.href = "/ShoesMarket/member/addMember.jsp";
} */
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}
		else{
			document.addForm.reset();
		}
	}

function changeImage(imageFileName) {
    var imageDiv = document.getElementById("productImage");
    var imageSrc = "./upload2/" + imageFileName;
    imageDiv.innerHTML = '<img src="' + imageSrc + '" style="width: 100%">';
}

	
</script>
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
			<h4 class = display-3>상품정보</h4>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
	/*ProductRepository dao = ProductRepository.getInstance();
	Product product = dao.getProductById(id); */
		String id = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 // Product1 테이블과 Model_Image 테이블을 조인하여 필요한 정보를 가져옴
		String sql = "SELECT MI.p_id, MI.p_color, MI.p_image, P1.p_name, P1.p_unitprice, P1.p_manufacturer, P1.p_releasedate " +
	             "FROM model_image MI " +
	             "INNER JOIN product1 P1 ON MI.p_id = P1.p_id AND MI.p_color = P1.p_color " +
	             "WHERE P1.p_id=?";


		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		
		if (rs.next()){
	%>
	<div class="container">
		<div class="row">
				<div class="col-md-5">
				<div id="productImage">
				<!-- 초기 이미지 설정 -->
				<img src="./upload2/<%=rs.getString("p_image") %>" style="width: 100%"> 
			</div>
			<div class="mt-3">
                    <%
                        // 해당 제품의 모든 색상 이미지를 가져와서 표시
                        String productID = rs.getString("p_id");
                        String colorQuery = "SELECT DISTINCT p_color, p_image FROM model_image WHERE p_id=?";
                        PreparedStatement colorStmt = conn.prepareStatement(colorQuery);
                        colorStmt.setString(1, productID);
                        ResultSet colorRs = colorStmt.executeQuery();

                        while (colorRs.next()) {
                            String color = colorRs.getString("p_color");
                            String image = colorRs.getString("p_image");
                    %>
                    <img src="./upload2/<%=image %>" style="width: 80px; cursor: pointer;" onclick="changeImage('<%=image %>')">
                    <%
                        }
                        
                        // 리소스 해제
                        if (colorRs != null) colorRs.close();
                        if (colorStmt != null) colorStmt.close();
                    %>
            </div>
			</div>
			<div class="col-md-6">
				<b>구매가</b>
				<h4><%=rs.getInt("p_UnitPrice")%>원</h4>
				<h4><%=rs.getString("p_manufacturer")%></h4>
				<h3><%=rs.getString("p_name")%></h3>
				<p> <b> 모델 번호 :</b><span class="badge badge-danger">
				<%=rs.getString("p_id") %></span>
				<p> <b> 대표 색상</b> :<%=rs.getString("p_color")%>
				<%-- <p> <b>재고 수</b> : <%=rs.getLong("p_unitsInStock")%> --%>

				<%
				java.util.Date date1 = new java.util.Date(rs.getDate("p_releaseDate").getTime());		
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String strDate = dateFormat.format(date1);
				%>
				<p> <b>출시일</b> : <%=strDate%>
				</p>				
        			<%
				    // 이미 가져온 상품 정보
				    String productColor = rs.getString("p_color"); // 추가된 부분
				
				    // 사이즈 및 재고 정보 가져오기
				    PreparedStatement stockStmt = null;
				    ResultSet stockRs = null;
				    String stockSql = "SELECT p_size, p_count " +
				                      "FROM model_count " +
				                      "WHERE p_color=?";
				    stockStmt = conn.prepareStatement(stockSql);
				    stockStmt.setString(1, productColor); // 추가된 부분
				    stockRs = stockStmt.executeQuery();
				%>
				
				<p><label for="sizeSelect"><b>사이즈 선택</b>:</label>
				<select id="sizeSelect" name="selectedSize">
				    <%
				        while (stockRs.next()) {
				            String size = stockRs.getString("p_size");
				            int stockCount = stockRs.getInt("p_count");
				    %>
				    <option value="<%=size%>"><%=size%> (재고: <%=stockCount%>)</option>
				    <%
				        }
				
				        // 리소스 해제
				        if (stockRs != null) stockRs.close();
				        if (stockStmt != null) stockStmt.close();
				    %>
				</select>
				</p>
				

				<p> <form name="addForm" action="./addCart1.jsp?id=<%=rs.getString("p_id")%>" method="post">
				<!-- 상품 주문/목록 버튼 만들기  -->
				<p><a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<a href="./main.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
					</form>
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
	<jsp:include page="footer.jsp"/>
</body>
</html>