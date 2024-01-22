<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>나의 순위</title>
<style>
body {
    display: block;
    margin: 0px;
}

.div-wrapper {
	background-color: transparent;
	display: flex;
	flex-direction: row;
	justify-content: center;
	width: 100%;
}

.div-wrapper .div {
	background-image: url(../img/image.png);
	background-size: cover;
	background-position: 50% 50%;
	width: 1440px;
	height: 1024px;
	position: relative;
}

.div-wrapper .group {
	position: absolute;
	width: 632px;
	height: 657px;
	top: 232px;
	left: 405px;
}

.div-wrapper .frame {
	position: absolute;
	width: 337px;
	height: 516px;
	top: 0;
	left: 141px;
	border-top-width: 1px;
	border-top-style: solid;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-color: #000000;
}

.div-wrapper .overlap-group {
	position: relative;
	height: 516px;
	top: -1px;
}

.div-wrapper .p {
	width: 337px;
	height: 516px;
	font-family: "Noto Sans KR", Helvetica;
	font-weight: 500;
	color: transparent;
	font-size: 30px;
	line-height: 43px;
	position: absolute;
	top: 0;
	left: 0;
	text-align: center;
	letter-spacing: 0;
}

.div-wrapper .text-wrapper {
	color: #000000;
}

.div-wrapper .span {
	color: #49977b;
}

.div-wrapper .rectangle {
	position: absolute;
	width: 12px;
	height: 100px;
	top: 82px;
	left: 325px;
	background-color: #b3b3b3;
	border-radius: 10px;
}

.div-wrapper .overlap {
	position: absolute;
	width: 630px;
	height: 108px;
	top: 549px;
	left: 0;
}

.div-wrapper .rectangle-2 {
	position: absolute;
	width: 629px;
	height: 108px;
	top: 0;
	left: 1px;
	border-radius: 30px;
	border: 3px solid;
	border-color: #54b28f;
}

.div-wrapper .text-wrapper-2 {
	width: 629px;
	height: 108px;
	font-family: "Orbitron", Helvetica;
	font-weight: 600;
	color: #000000;
	font-size: 40px;
	line-height: 110px;
	position: absolute;
	top: 0;
	left: 0;
	text-align: center;
	letter-spacing: 0;
}

.div-wrapper .character {
	position: absolute;
	width: 200px;
	height: 200px;
	top: 18px;
	left: 28px;
	object-fit: cover;
}

.div-wrapper .mypage {
	position: absolute;
	width: 85px;
	height: 85px;
	top: 35px;
	left: 1322px;
	object-fit: cover;
}

.div-wrapper .logo {
	position: absolute;
	width: 458px;
	height: 128px;
	top: 14px;
	left: 491px;
	object-fit: cover;
}

.div-wrapper .clost-btn {
	position: absolute;
	width: 218px;
	height: 75px;
	top: 921px;
	left: 611px;
	background-image: url(../img/clost-btn.png);
	background-size: cover;
	background-position: 50% 50%;
}

.div-wrapper .group-2 {
	position: absolute;
	width: 729px;
	height: 58px;
	top: 142px;
	left: 356px;
}

.div-wrapper .text-wrapper-3 {
	width: 727px;
	height: 58px;
	font-family: "Orbitron", Helvetica;
	font-weight: 600;
	color: #000000;
	font-size: 40px;
	line-height: 22px;
	position: absolute;
	top: 21px;
	left: 0;
	text-align: center;
	letter-spacing: 0;
}

.character {
	position: absolute;
	width: 200px;
	height: 200px;
	top: 0;
	left: 0;
	object-fit: cover;
}
</style>
</head>
<body>
<% Member user = (Member) session.getAttribute("USER_SESSION_KEY");%>
	<div class="div-wrapper">
		<div class="div"
			style="background-image: url(${pageContext.request.contextPath}/resources/img/image.png);">
			<div class="group">
				<div class="frame" style="overflow-y: auto; overflow-x: hidden; max-height: 516px;">
					<div class="overlap-group">
						<p class="p">
							<c:forEach var="member" items="${rankingList}" varStatus="loop">
								<span class="text-wrapper">${member.ranking}.
									${member.nickName}<br>
								</span>
							</c:forEach>
						</p>
					</div>
				</div>
				<div class="overlap">
					<div class="rectangle-2"></div>
					  <div class="text-wrapper-2">${sessionScope.USER_SESSION_KEY.nickName}님의 순위는
						<c:forEach var="member" items="${rankingList}">
						<c:if test="${member.id eq sessionScope.USER_SESSION_KEY.id}">${member.ranking}등입니다.</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<%
			// 가져온 정보를 기반으로 이미지 표시
			if ("character1".equals(user.getCharacter())) {
			%>
			<img class="character"
				src="${pageContext.request.contextPath}/resources/img/8388251-1.png" />
			<%
			} else if ("character2".equals(user.getCharacter())) {
			%>
			<img class="character"
				src="${pageContext.request.contextPath}/resources/img/8388431-1.png" />
			<%
			} else if ("character3".equals(user.getCharacter())) {
			%>
			<img class="character"
				src="${pageContext.request.contextPath}/resources/img/8388400-1.png" />
			<%
			}
			%>

			<a href="${pageContext.request.contextPath}/resources/jsp/myPage.jsp">
				<img class="mypage"
				src="${pageContext.request.contextPath}/resources/img/mypage.png" />
			</a> <a href="${pageContext.request.contextPath}/resources/jsp/main.jsp">
				<img class="clost-btn"
				src="${pageContext.request.contextPath}/resources/img/clost-btn.png" />
			</a>

			<!--  <a href="main.jsp"><img class="logo" src="../img/logo.png" /></a>  -->
			<a href="${pageContext.request.contextPath}/resources/jsp/main.jsp"><img class="logo"
				src="${pageContext.request.contextPath}/resources/img/logo.png" /></a>
			<div class="group-2">
				<div class="text-wrapper-3">실시간 랭킹</div>
			</div>
		</div>
	</div>
</body>
</html>
