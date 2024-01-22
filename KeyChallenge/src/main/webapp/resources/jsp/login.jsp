<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../css/login.css" type="text/css">
</head>
<body>
<div class="element">
    <div class="div">
        <div class="overlap">
            <div class="overlap-group">
                <form name="LoginForm" action="${pageContext.request.contextPath}/user/login" method="post">
                    <div class="form">
                        <div class="pwd">
                            <div class="overlap-group-2">
                                <div class="id">
                                    <input type="password" name="pwd" class="rectangle">
                                </div>
                                <div class="text-wrapper">PWD</div>
                            </div>
                        </div>
                        <div class="overlap-wrapper">
                            <div class="overlap-group-2">
                                <div class="id">
                                    <input type="text" name="id" class="rectangle">
                                </div>
                                <div class="text-wrapper">ID</div>
                            </div>
                        </div>
                        <input type="image" class="login-btn" src="../img/login-btn.png" alt="Login">
                    </div>
                </form>
                <a href="start.jsp"><img class="logo" src="../img/logo.png"/></a>
            </div>
        </div>
    </div>
</div>
</body>
</html>