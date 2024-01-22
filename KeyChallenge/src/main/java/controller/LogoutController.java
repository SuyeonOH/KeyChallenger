package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       
        HttpSession session = request.getSession();
        
        // 세션 속성 제거
        session.removeAttribute("RETRIEVED_POST_SESSION_KEY");
        session.removeAttribute("REVIEW_SESSION_KEY");
        session.removeAttribute("ACTIVITY_SESSION_KEY");
        
        // 세션 완전 초기화
        session.invalidate();
        
        return "redirect:/resources/jsp/start.jsp"; // 로그아웃 후 이동할 페이지
    }
}
