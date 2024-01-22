<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Member"%>
<%@ page import="model.Post"%>
<%@ page import="model.dao.PostDAO"%>
<%@ page import="model.dao.KeywordDAO"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/myPost.css?after"
	type="text/css">
<script>
	function deletePost() {
		// 확인 팝업을 띄우고 사용자가 확인을 누르면 폼을 submit
		if (confirm("포스트를 삭제하시겠습니까?")) {

			var xhr1 = new XMLHttpRequest();

			xhr1.open("POST", "${pageContext.request.contextPath}/post/delete",
					true);
			xhr1.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");

			var data = "action=delete&id=" + document.postForm.id.value
					+ "&date=" + document.postForm.date.value;
			xhr1.send(data);

			xhr1.onreadystatechange = function() {
				if (xhr1.readyState == 4 && xhr1.status == 200) {

					console.log("서버 응답:", xhr1.responseText);

					// 페이지 자동 새로고침
					location.reload();
				}
			};
		}
	}
</script>
</head>
<body>
	<%
	Member user = (Member) session.getAttribute("USER_SESSION_KEY");
	Post post = (Post) session.getAttribute("RETRIEVED_POST_SESSION_KEY");

	String activity = "";
	String review = "";
	String id = user.getId();
	String pwd = "";
	String nickName = "";
	String birth = "";
	String character = "";
	String gender = "";
	String keyword = "";
	Object year = session.getAttribute("selectedYear");
	Object month = session.getAttribute("selectedMonth");
	Object day = session.getAttribute("selectedDay");
	String date = "";

	if (year != null) {
		if (Integer.valueOf(String.valueOf(month)) / 10 == 0)
			month = "0" + String.valueOf(month);

		if (Integer.valueOf(String.valueOf(day)) / 10 == 0)
			day = "0" + String.valueOf(day);
		
		date = String.valueOf(year) + String.valueOf(month) + String.valueOf(day);

	}
	
	String postId = "";

	if (user != null) {
		postId = (date + "_" + id).trim();
		character = user.getCharacter();
		PostDAO postDAO = new PostDAO();
		KeywordDAO keywordDAO = new KeywordDAO();
		keyword = String.valueOf(session.getAttribute("KEYWORD_SESSION_KEY"));
		Post retrievedPost = postDAO.findPost(postId);

		if (retrievedPost != null) {
			session.setAttribute("RETRIEVED_POST_SESSION_KEY", retrievedPost);
			session.setAttribute("REVIEW_SESSION_KEY", retrievedPost.getReview());
			session.setAttribute("ACTIVITY_SESSION_KEY", retrievedPost.getActivity());
			//out.println("retrievedPost is not null");
		} else {
			session.setAttribute("RETRIEVED_POST_SESSION_KEY", null);
			session.setAttribute("REVIEW_SESSION_KEY", null);
			session.setAttribute("ACTIVITY_SESSION_KEY", null);
		}
	}

	if (post != null) {
		activity = (post.getActivity() != null) ? post.getActivity() : "";
		review = (post.getReview() != null) ? post.getReview() : "";
	}
	%>

	<form name="postForm"
		action="${pageContext.request.contextPath}/post/register"
		method="post">
		<div class="div-wrapper">
			<div class="div">
				<a href=myPage.jsp><img class="profile"
					src="${pageContext.request.contextPath}/resources/img/profile.png" /></a>
				<div class="overlap">
					<a href="main.jsp"><img class="logo"
						src="${pageContext.request.contextPath}/resources/img/logo.png" /></a>
					<div class="overlap-group">
						<div class="rectangle"></div>
						<div class="group-2"><textarea class="id" name="review"><%if (session.getAttribute("REVIEW_SESSION_KEY") != null) {%><%=session.getAttribute("REVIEW_SESSION_KEY")%><%}%></textarea>
							<div class="text-wrapper">후기</div>
						</div>
						<div class="group-3"><textarea class="id-2" name="activity"><%if (session.getAttribute("ACTIVITY_SESSION_KEY") != null) {%><%=session.getAttribute("ACTIVITY_SESSION_KEY")%><%}%></textarea>
							<div class="text-wrapper-2">활동</div>
						</div>
						<%
						// 가져온 정보를 기반으로 이미지 표시
						if ("character1".equals(character)) {
						%>
						<img class="turtle"
							src="${pageContext.request.contextPath}/resources/img/8388251-1.png" />
						<%
						} else if ("character2".equals(character)) {
						%>
						<img class="turtle"
							src="${pageContext.request.contextPath}/resources/img/8388431-1.png" />
						<%
						} else if ("character3".equals(character)) {
						%>
						<img class="turtle"
							src="${pageContext.request.contextPath}/resources/img/8388400-1.png" />
						<%
						}
						%>
					</div>
				</div>
				<img type="image" class="delete-btn" onclick="deletePost()"
					src="${pageContext.request.contextPath}/resources/img/delete-btn.png">
				<input type="image" class="small-save-btn"
					src="${pageContext.request.contextPath}/resources/img/small-save-btn.png">
			</div>
		</div>
		<input type="hidden" name="id" value="<%=(id != null) ? id : ""%>">
		<input type="hidden" name="character"
			value="<%=(character != null) ? character : ""%>"> <input
			type="hidden" name="gender"
			value="<%=(gender != null) ? gender : ""%>"> <input
			type="hidden" name="keyword"
			value="<%=(keyword != null) ? keyword : ""%>"> <input
			type="hidden" name="date" value="<%=(date != null) ? date : ""%>">
		<input type="hidden" name="postId"
			value="<%=(postId != null) ? postId : ""%>">
	</form>
</body>
</html>