<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <title>회원 정보</title>
</head>
<body>
    <jsp:include page="/menu.jsp" />
    <%!String greeting = "ShoesShoppingMall";%>

    <div class="jumbotron bg-dark text-white mb-0">
        <div class="container text-center">
            <h1 class="display-3">
                <%= greeting %>
            </h1>
        </div>
    </div>
    <div class="jumbotron bg-secondary text-white">
        <div class="container text-center">
            <h4 class="display-3">회원정보</h4>
        </div>
    </div>

    <div class="container" align="center">
        <%
            String msg = request.getParameter("msg");

            if (msg != null) {
                if (msg.equals("0"))
                    out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
                else if (msg.equals("1"))
                    out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
                else if (msg.equals("2")) {
                    // JavaScript를 사용하여 main.jsp로 이동
        %>
                    <script>
                        window.location.href = "../main.jsp";
                    </script>
        <%
                    return; // 이후의 코드 실행을 막기 위해 return 사용
                }                
            } else {
                out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
            }
        %>
    </div>    
</body>
</html>
