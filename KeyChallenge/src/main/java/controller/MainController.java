package controller;

import java.util.List;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.PostDAO;
import model.dao.KeywordDAO;
import model.dao.StampDAO;
import model.Post;

public class MainController implements Controller {

    private final PostDAO postDAO = new PostDAO();
    
    public void handleSelectedDate(HttpServletRequest request) { //calendar.jsp로부터 선택한 날짜를 받아서 세션에 저장한다.
       // Extract year, month, and day from the request parameters
       String selectedYear = request.getParameter("selectedYear");
        String selectedMonth = request.getParameter("selectedMonth");
        String selectedDay = request.getParameter("selectedDay");
        
        System.out.println(selectedYear + selectedMonth + selectedDay);
        HttpSession session = request.getSession();
        // Store the selected date in the session
        session.setAttribute("selectedYear", selectedYear);
        session.setAttribute("selectedMonth", selectedMonth);
        session.setAttribute("selectedDay", selectedDay);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("USER_SESSION_KEY");

        // 선택한 날짜를 세션에 저장
        handleSelectedDate(request);
        
        // 유저가 작성한 포스트 빼고, 포스트 목록 가져오기
        List<Post> posts = postDAO.findPostsByDate(userId);

        // main.jsp로 유저의 포스트 목록 전
        request.setAttribute("userPosts", posts);
        
        // 선택한 날짜 정보를 가져옴
        int selectedYear = (int) session.getAttribute("selectedYear");
        int selectedMonth = (int) session.getAttribute("selectedMonth");
        int selectedDay = (int) session.getAttribute("selectedDay");

        // 적절한 날짜 처리 로직 작성 (예: 콘솔에 출력)
        System.out.println("Selected Date: " + selectedYear + "-" + selectedMonth + "-" + selectedDay);
        
        // 적절한 뷰로 이동하는 로직 작성
        return "main.jsp"; // 이동할 뷰 이름을 반환 (main.jsp로 이동 예정)
    }
}