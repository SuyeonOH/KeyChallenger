package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.dao.MemberDAO;

public class UpdateMemberController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (request.getMethod().equals("GET")) {
            // GET 요청: 회원 정보 수정 폼 요청
            return "/editProfile.jsp"; 
        }
            // 수정된 회원 정보를 가져오기
          Member member = new Member(
                request.getParameter("id"),
                request.getParameter("pwd"),
                request.getParameter("nickName"),
                request.getParameter("birth"),
                request.getParameter("character"),
                request.getParameter("gender") 
            );
            request.setAttribute("member", member);

            // DB에 저장하는 로직을 추가하세요.
            MemberDAO memberDAO = new MemberDAO();
            memberDAO.update(member);

            return "redirect:/resources/jsp/start.jsp";
    }
}