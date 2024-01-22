package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.service.AuthServices;

public class LoginController implements Controller {
    private AuthServices authServices;

    public LoginController(AuthServices authServices) {
        this.authServices = authServices;
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String memberId = request.getParameter("id");
        String password = request.getParameter("pwd");

        // 공백 제거
        memberId = memberId.trim();
        password = password.trim();
        
        HttpSession session = request.getSession();
        
        // 로그인 처리 및 세션에 저장은 AuthServices에서 하는걸로..
        boolean loginSuccess = authServices.login(memberId, password, session);

        if (loginSuccess) {
            return "redirect:/resources/jsp/main.jsp"; // 로그인 성공 시 이동할 페이지
        } else {
        	// 실패시 현재 페이지에 머물기 
             return "redirect:/resources/jsp/login.jsp";
        }
    }
}
