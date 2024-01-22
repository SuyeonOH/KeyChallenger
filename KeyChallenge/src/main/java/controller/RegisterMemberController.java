package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import model.Member;
import model.dao.MemberDAO;
import model.service.ExistingMemberException;

public class RegisterMemberController implements Controller {
 private static final Logger log = LoggerFactory.getLogger(RegisterMemberController.class);

 @Override
 public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
     if (request.getMethod().equals("GET")) {    
         // GET request: 회원정보 등록 form 요청    
         log.debug("RegisterForm2 Request");
         return "/signIn2.jsp";   // 추가 정보 입력 폼으로 이동
     }

     // POST request (회원정보가 parameter로 전송됨)
     Member member = new Member(
         request.getParameter("id"),
         request.getParameter("pwd"),
         request.getParameter("nickName"),
         request.getParameter("birth"),
         0, // stampCount
         request.getParameter("character"),
         request.getParameter("gender"),
         0
     );

     // 정보를 request에 저장
     request.setAttribute("member", member);

     // DB에 저장하는 로직을 추가하세요. MemberDAO를 사용하여 DB에 저장할 수 있습니다.
     MemberDAO memberDAO = new MemberDAO();
     memberDAO.create(member);
     
     return "redirect:/resources/jsp/start.jsp";
 }
}