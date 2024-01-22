<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/start.css" />
  </head>
  <body>
    <div class="screen">
      <div class="div">
        <div class="overlap-group">
		  <img class="key" src="${pageContext.request.contextPath}/resources/img/key.png" />
          <p class="p">
            <span class="text-wrapper">: 매주 </span>
            <span class="span">도전</span>
            <span class="text-wrapper">하는 캘린더</span>
          </p>
          <div class="button-signin">
          	<a href="signIn1.jsp">
          		<img src="${pageContext.request.contextPath}/resources/img/signin-btn.png" />
          	</a>
          </div>
          <div class="button-login">
          	<a href="login.jsp">
          		<img src="${pageContext.request.contextPath}/resources/img/login-btn.png" />
          	</a>
          </div>
          <img class="logo" src="${pageContext.request.contextPath}/resources/img/logo.png" />
        </div>
      </div>
    </div>
  </body>
</html>