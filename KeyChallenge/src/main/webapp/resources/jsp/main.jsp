<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="model.Member"%>
<%@ page import="model.Keyword"%>
<%@ page import="model.Post"%>
<%@ page import="java.util.List"%>
<%@ page import="model.dao.PostDAO"%>
<%@ page import="model.dao.KeywordDAO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/main.css" />
<script>
   // 자식 페이지(calendar.jsp)에서 호출되는 함수
   // function receiveSelectedDate(selectedYear, selectedMonth, selectedDay) {
   // 선택한 날짜를 받아온 후 적절한 작업을 수행
   //      displayedDate = selectedYear+"."+selectedMonth+"."+selectedDay;
   // }
</script>
</head>
<body>
   <%-- 세션에서 사용자 정보 가져오기 --%>
   <%
   Calendar now = Calendar.getInstance();

   Object displayedYear = session.getAttribute("selectedYear"); //2023
   Object displayedMonth = session.getAttribute("selectedMonth"); //12
   Object displayedDay = session.getAttribute("selectedDay"); //10

   if (displayedYear != null) {
      if (Integer.valueOf(String.valueOf(displayedMonth)) / 10 == 0)
         displayedMonth = "0" + String.valueOf(displayedMonth);

      if (Integer.valueOf(String.valueOf(displayedDay)) / 10 == 0)
         displayedDay = "0" + String.valueOf(displayedDay);

   }

   if (displayedYear == null) {
      displayedYear = now.get(Calendar.YEAR);
      displayedMonth = now.get(Calendar.MONTH) + 1;
      displayedDay = now.get(Calendar.DATE);
   }
   String displayedDate = String.valueOf(displayedYear) + "." + String.valueOf(displayedMonth) + "."
         + String.valueOf(displayedDay);

   Member user = (Member) session.getAttribute("USER_SESSION_KEY");
   PostDAO postDAO = new PostDAO();
   %>

   <%--keyword 가져오기 --%>
   <%
   String startDate = "20240101";

   String secondDate = String.valueOf(displayedYear) + String.valueOf(displayedMonth) + String.valueOf(displayedDay); // 현재날짜로 가져옴

   DateFormat format = new SimpleDateFormat("yyyyMMdd");

   Date d1 = format.parse(startDate);
   Date d2 = format.parse(secondDate);

   long Sec = (d1.getTime() - d2.getTime()) / 1000;
   long Days = Math.abs(Sec / (24 * 60 * 60));

   int idx = Long.valueOf(Days / 7 + 1).intValue(); // 수정 필요

   String id = "";

   KeywordDAO keywordDAO = new KeywordDAO();
   String retrievedKeyword = keywordDAO.getKeyword(String.valueOf(idx));
   session.setAttribute("KEYWORD_SESSION_KEY", retrievedKeyword);
   %>

   <%-- 정보 --%>
   <%
   if (user != null) {
      id = user.getId();
      String pwd = user.getPwd();
      String nickName = user.getNickName();
      String birth = user.getBirth();
      int stampCount = user.getStampCount();
      String character = user.getCharacter();
      String gender = user.getGender();

      user.getId();
   %>
   <%
   } else {
   %>
   <p>로그인되지 않은 상태</p>
   <%
   }
   String date = secondDate;
   String postId = date + "_" + id;
   %>

   <div class="screen">
      <div class="div">
         <div class="overlap">
            <jsp:include page="calendar.jsp" flush="false" />
            <div class="overlap-group">
               <div class="overlap-2">
                  <div class="frame-keyword">
                     <div class="keyword-today">
                        <%=retrievedKeyword%></div>
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
               </div>
               <a href="main.jsp"><img class="logo" src="../img/logo.png" /></a>
            </div>
         </div>
         <div class="frame-ranking">
            <div class="text-wrapper-3">
               Ranking

               <form action="${pageContext.request.contextPath}/user/rank/list"
                  method="get">
                  <input type="image" class="group" src="../img/image-6.png">
               </form>
            </div>
            <!-- 첫 번째 버튼 -->

         </div>


         <div class="frame-mypost">
            <div class="text-wrapper-5">My Post</div>
            <a href="myPost.jsp"><div class="group-2"></div></a>
            <!-- 이게 클릭버튼 -->
            <div class="text-wrapper-6"><%=displayedDate%></div>
         </div>
         <a href=myPage.jsp><img class="mypage" src="../img/mypage.png" /></a>
         <div class="frame-challengers"
            style="overflow-y: auto; overflow-x: hidden; max-height: 300px;">
            <!-- 게시판 -->
            <div style="font-size: 25px; font-weight: 500;">다른 사용자들의 글</div>
            <%
            List<Post> userPosts = postDAO.findPostsByDate(date);
            %>
            <%
            if (userPosts != null && !userPosts.isEmpty()) {
            %>
            <!— Iterate through userPosts and display content —>
            <%
            for (Post post : userPosts) {
            %>
            <p
               style="padding-top: 30px; padding-left: 20px; margin-bottom: 15px; font-size: 30px;">
               Title:
               <%=post.getActivity()%>
               / Review:
               <%=post.getReview()%>
            </p>
            <%
            }
            %>
            <%
            } else {
            %>
            <p>포스트가 없습니다!</p>
            <%
            }
            %>
         </div>
      </div>
   </div>
</body>
</html>