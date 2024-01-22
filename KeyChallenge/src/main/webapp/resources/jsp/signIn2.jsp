<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signIn2.css?after" type="text/css" >    
  </head>
  <body>
	<%
    // 선택한 이미지의 정보를 가져오기
    String selectedCharacter = request.getParameter("character");
 	%>
    <div class="element">
      <div class="div">
        <div class="overlap">
          <!-- 
          <div class="button-signin">
          	<a href="main.jsp"><img src="${pageContext.request.contextPath}/resources/img/signin-btn.png" /></a>
          </div>
          -->
          <div class="overlap-group">
            <form name="signInForm" action="${pageContext.request.contextPath}/user/register" method="post">
              <div class="birth">
                <div class="overlap-group-2">
                  <div class="id"><input type="text" name="birth" class="rectangle"></div>
                  <div class="text-wrapper">생일</div>
                </div>
              </div>
              <div class="gender">
                <div class="overlap-group-2">
                  <div class="id"><input type="text" name="gender" class="rectangle"></div>
                  <div class="text-wrapper">성별</div>
                </div>
              </div>
              <div class="nickname">
                <div class="overlap-group-2">
                  <div class="id"><input type="text" name="nickName" class="rectangle"></div>
                  <div class="text-wrapper">닉네임</div>
                </div>
              </div>
              <div class="pwd">
                <div class="overlap-group-2">
                  <div class="id"><input type="text" name="pwd" class="rectangle"></div>
                  <div class="text-wrapper">PWD</div>
                </div>
              </div>
              <div class="overlap-wrapper">
                <div class="overlap-group-2">
                  <div class="id"><input type="text" name="id" class="rectangle"></div>
                  <div class="text-wrapper">ID</div>
                </div>
              </div>
              <input type="hidden" name="character" value="<%= selectedCharacter %>">
              <input type="hidden" name="stampCount" value="0">
              <div><button type="submit">
               <img class="btn" src="${pageContext.request.contextPath}/resources/img/signin-btn.png"></button>
               </div>
            </form>

	     	<%
	        // 가져온 정보를 기반으로 이미지 표시
			    if ("character1".equals(selectedCharacter)) {
			%>
			        <img class="img" src="${pageContext.request.contextPath}/resources/img/8388251-1.png" />
			<%
			    } else if ("character2".equals(selectedCharacter)) {
			%>
			        <img class="img" src="${pageContext.request.contextPath}/resources/img/8388431-1.png" />
			<%
			    } else if ("character3".equals(selectedCharacter)) {
			%>
			        <img class="img" src="${pageContext.request.contextPath}/resources/img/8388400-1.png" />
			<%
			    }
			%>            
			<a href="${pageContext.request.contextPath}/resources/jsp/start.jsp"><img class="logo" src="${pageContext.request.contextPath}/resources/img/logo.png" /></a>
	        </div>
	      </div>
	    </div>
	  </div>
	</body>
</html>
