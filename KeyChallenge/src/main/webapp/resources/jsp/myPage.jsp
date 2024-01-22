<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="model.Member"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css?after" type="text/css" > 
     <%
    // 선택한 이미지의 정보를 가져오기
    Member user = (Member) session.getAttribute("USER_SESSION_KEY");
    %>
  </head>
  <body>
    <div class="screen">
      <div class="div">
        <a href="main.jsp"><img class="logo" src="${pageContext.request.contextPath}/resources/img/logo.png"/></a><!-- 로고이미지 -->
        <div class="text-wrapper">마이페이지</div>
        <%
		// 가져온 정보를 기반으로 이미지 표시
		if ("character1".equals(user.getCharacter())) {
		%>
		<img class="element"
			src="${pageContext.request.contextPath}/resources/img/8388251-1.png" />
		<%
		} else if ("character2".equals(user.getCharacter())) {
		%>
		<img class="element"
			src="${pageContext.request.contextPath}/resources/img/8388431-1.png" />
		<%
		} else if ("character3".equals(user.getCharacter())) {
		%>
		<img class="element"
			src="${pageContext.request.contextPath}/resources/img/8388400-1.png" />
		<%
		}
		%>
        <div class="group">
          <div class="group-2"><!-- 프로필수정 -->
                <a href="editProfile.jsp"><img class="imgbtn" src="${pageContext.request.contextPath}/resources/img/profile-change-btn.png"/></a>
          </div>
          <div class="group-3"><!-- 고객센터 -->
                <a href="service.jsp"><img class="imgbtn" src="${pageContext.request.contextPath}/resources/img/developer-btn.png"/></a>
          </div>
          <div class="group-4"><!-- 로그아웃 -->
                <a href="start.jsp"><img class="imgbtn" src="${pageContext.request.contextPath}/resources/img/logout-btn.png"/></a>
          </div>
          <div></div>
        </div>
        <a href="${pageContext.request.contextPath}/resources/jsp/main.jsp"><img class="clost-btn" src="${pageContext.request.contextPath}/resources/img/close-btn.png" /></a>
        </div>
    </div>
  </body>
</html>