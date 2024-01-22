<%@ page import = "java.util.Calendar" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   
   Calendar now = Calendar.getInstance();
   int year = now.get(Calendar.YEAR);
   int month = now.get(Calendar.MONTH)+1;
   int today = now.get(Calendar.DATE);
   
   String _year = request.getParameter("year");
   String _month = request.getParameter("month");
   String _today = request.getParameter("today");
   
   if(_year !=null)
      year = Integer.parseInt(_year);
   if(_month != null)
      month = Integer.parseInt(_month);
   if(_today != null)
      today = Integer.parseInt(_today);

   now.set(year, month-1, today); //출력할 년도, 월로 설정
   
   year = now.get(Calendar.YEAR);
   month = now.get(Calendar.MONTH)+1;
   today = now.get(Calendar.DATE);
   
   int end = now.getActualMaximum(Calendar.DAY_OF_MONTH); //해당 월의 마지막 날짜
   int weekday = now.get(Calendar.DAY_OF_WEEK); //1~7(일~토)
   
   
%>
<!DOCTYPE html>
<html>
<head>
   <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/calendar.css?after" type="text/css" > 
   <title>calendar.jsp</title>
   <script>
       function sendSelectedDate(year, month, i) {
         var day = i;
          console.log("함수실행");

          var xhr = new XMLHttpRequest();
      
          xhr.open("GET", "main?selectedYear="+year+"&selectedMonth="+month+"&selectedDay="+day, true);
   
            xhr.send();
          location.reload();
     }
    </script>
</head>
<body>
   <div class="screen">
      <div class="calendar-single-dark">
         <table width="685" border="0" cellpadding="4" cellspacing="4">
            <tr height = "30">
             <td align="center">
                <a href="main.jsp?year=<%=year %>&month=<%=month-1 %>">
                    <img class="img" src="${pageContext.request.contextPath}/resources/img/chevron-left.png" />
                </a>&nbsp;&nbsp;&nbsp;&nbsp;
                <% out.print("<font color='#49977b'>" + month + "&nbsp;&nbsp;&nbsp;</font>"); //월
                   out.print("<font color='#49977b'>" + year + "</font>&nbsp;&nbsp;&nbsp;&nbsp;"); //년도
                %>
                <a href="main.jsp?year=<%=year %>&month=<%=month+1 %>">
                    <img class="img" src="${pageContext.request.contextPath}/resources/img/chevron-right.png" />
                </a>
            </td>
            </tr>
            <tr height="10">
               <td align="center">
                  <img class="line" src="${pageContext.request.contextPath}/resources/img/line-21.png" />
               </td>
            </tr>
         </table>
         <table width="685" border="0" cellpadding="4" cellspacing="4" >
            <tr height="42">
               <td align="center"><font color="#49977b">SUN</font></td>
               <td align="center"><font color="#49977b">MON</font></td>
               <td align="center"><font color="#49977b">TUE</font></td>
               <td align="center"><font color="#49977b">WED</font></td>
               <td align="center"><font color="#49977b">THU</font></td>
               <td align="center"><font color="#49977b">FRI</font></td>
               <td align="center"><font color="#49977b">SAT</font></td>
            </tr>
            <%
               int newLine = 0;
               //1일이 어느 요일에서 시작하느냐에 따른 빈칸 삽입
               out.println("<tr height='42'>");
               for(int i=1; i<=weekday; i++){
                  out.println("<td bgcolor='#ffffff'>&nbsp;</td>");
                  newLine++;
               }
               String fontColor, background;
               for(int i=1; i<=end; i++){
                  fontColor = "#49977b";
                  background = "#ffffff";
                  // 오늘날짜인지 확인하고 font color 다르게 표시
                  //  if (i == today && i == now.get(Calendar.DATE)&& month == now.get(Calendar.MONTH) + 1 && year == now.get(Calendar.YEAR)) {
                  //      fontColor = "#000000"; // Set the special font color for today
                  //  }
                  %>
                  <% String year_string = Integer.toString(year); String month_string = Integer.toString(month); String day_string = Integer.toString(i); %>
                  <td onclick="sendSelectedDate('<%= year_string %>', '<%=month_string %>', '<%=day_string %>')" align='center' bgcolor=<%=background%> >
                   <font color=<%=fontColor%>><%=i%></font>
              </td>
                  <% newLine++;
                  if(newLine==7&&i!=end){
                     out.println("</tr>");
                     out.println("<tr height='42'>");
                     newLine=0;
                  }
               }
               
               while(newLine>0 && newLine<7){
                  out.println("<td background='#ffffff'>&nbsp;</td>");
                  newLine++;
               }
               out.println("</tr>");
            %>
         </table>
      </div>
   </div>
</body>
</html>