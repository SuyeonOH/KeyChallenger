<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ page import="model.Member"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="globals.css" />
<link rel="stylesheet" href="style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/editProfile.css?after"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<%
// 선택한 이미지의 정보를 가져오기
String selectedCharacter = request.getParameter("character");
// 세션에서 사용자 정보 가져오기
Member user = (Member) session.getAttribute("USER_SESSION_KEY");
%>
</head>
<body>
	<div class="div-wrapper">
		<div class="div">
			<a href="myPage.jsp"><img class="image"
				src="${pageContext.request.contextPath}/resources/img/profile.png" />
			<!-- 마이페이지버튼이미지 --></a> <a href="main.jsp"><img class="logo"
				src="${pageContext.request.contextPath}/resources/img/logo.png" />
			<!-- 마이페이지버튼이미지 --></a>
			<div class="text-wrapper2">프로필 수정</div>
			<div class="overlap-group">
				<!-- 개인정보 수정 폼 -->
				<img class="element"
					src="${pageContext.request.contextPath}/resources/img/8388251-1.png"
					style="cursor: pointer;" onclick="changeCharacter('character1')" />
				<img class="element-2"
					src="${pageContext.request.contextPath}/resources/img/8388431-1.png"
					style="cursor: pointer;" onclick="changeCharacter('character2')" />
				<img class="element-3"
					src="${pageContext.request.contextPath}/resources/img/8388400-1.png"
					style="cursor: pointer;" onclick="changeCharacter('character3')" />
				<form name="update"
					action="${pageContext.request.contextPath}/user/update"
					method="POST">
					<div></div>
					<div class="birth">
						<div class="overlap-group-2">
							<div class="id">
								<input type="text" name="birth" class="rectangle"
									value="<%=user.getBirth()%>">
							</div>
							<div class="text-wrapper">생일</div>
						</div>
					</div>
					<div class="gender">
						<div class="overlap-group-2">
							<div class="id">
								<input type="text" name="gender" class="rectangle"
									value="<%=user.getGender()%>">
							</div>
							<div class="text-wrapper">성별</div>
						</div>
					</div>
					<div class="nickname">
						<div class="overlap-group-2">
							<div class="id">
								<input type="text" name="nickName" class="rectangle"
									value="<%=user.getNickName()%>">
							</div>
							<div class="text-wrapper">닉네임</div>
						</div>
					</div>
					<div class="pwd">
						<div class="overlap-group-2">
							<div class="id">
								<input type="text" name="pwd" class="rectangle"
									value="<%=user.getPwd()%>">
							</div>
							<div class="text-wrapper">PWD</div>
						</div>
					</div>
					<div class="id">
						<div class="overlap-group-2">
							<div class="id">
								<input type="text" name="id" class="rectangle"
									value="<%=user.getId()%>">
							</div>
							<div class="text-wrapper">ID</div>
						</div>
					</div>


					<input type="hidden" name="character"
						value="<%=selectedCharacter%>"> <input type="hidden"
						name="id" value="<%=user.getId()%>"> <input
						type="hidden" name="stampCount"
						value="<%=user.getStampCount()%>"> <a
						href="${pageContext.request.contextPath}/resources/jsp/start.jsp">
						<button>
							<img class="save-btn"
								src="${pageContext.request.contextPath}/resources/img/save-btn.png"
								onclick="submitForm()">
						</button>
					</a>
				</form>
			</div>
		</div>
	</div>
	<script>
		function changeCharacter(character) {
			// 이미지 변경
			$(".character").attr(
					"src",
					"${pageContext.request.contextPath}/resources/img/"
							+ character + "-1.png");
			$("input[name='character']").val(character);
		}

		function submitForm() {
			// 폼 제출
			document.forms["update"].submit();
		}
	</script>
</body>
</html>