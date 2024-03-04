<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>Login</title>
<style>
    .custom-btn {
        width: 100%;
    }
</style>
<script>
    function submitLoginForm() {
        // 필요한 입력을 확인하고, 유효성 검사 등을 수행할 수 있습니다.
        var id = document.getElementById("id").value;
        var password = document.getElementById("password").value;

        if (id.trim() === "" || password.trim() === "") {
            alert("아이디와 비밀번호를 모두 입력하세요.");
            return false; // 폼 제출을 막습니다.
        }

        // 로그인 폼을 제출합니다.
        document.getElementById("loginForm").submit();
    }

    function goToRegisterPage() {
        // 회원가입 페이지로 이동합니다.
        window.location.href = "/ShoesMarket/member/addMember.jsp";
    }
</script>
</head>
<body>
    <jsp:include page="/menu.jsp" />
    <div class="jumbotron bg-dark text-white mb-0">
        <div class="container text-center">
            <h1 class="display-3">ShoesShoppingMall</h1>
        </div>
    </div>
    <div class="jumbotron bg-secondary text-white">
        <div class="container text-center">
            <h4 class="display-3">로그인</h4>
        </div>
    </div>
    <div class="container" align="center">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <form class="form-signin" action="processLoginMember.jsp" method="post" id="loginForm">
                    <h3 class="form-signin-heading">Please sign in</h3>
                    <div class="form-group">
                        <label for="id" class="sr-only">User Name</label>
                        <input type="text" class="form-control" placeholder="ID" name="id" id="id" required autofocus>
                    </div>
                    <div class="form-group">
                        <label for="password" class="sr-only">Password</label>
                        <input type="password" class="form-control" placeholder="Password" name="password" id="password" required>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <button class="btn btn-lg btn-success custom-btn" type="button" onclick="goToRegisterPage()">회원가입</button>
                        </div>
                        <div class="col-md-6">
                            <button class="btn btn-lg btn-success custom-btn" type="button" onclick="submitLoginForm()">로그인</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
