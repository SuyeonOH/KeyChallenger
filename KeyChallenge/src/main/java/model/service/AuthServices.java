package model.service;

import java.util.HashMap;
import javax.servlet.http.HttpSession;
import model.Member;
import model.dao.MemberDAO;

public class AuthServices {
    private MemberDAO memberDAO; // MemberDAO에 접근하여 사용자 정보를 확인하기 위한 DAO 객체

    public AuthServices(MemberDAO memberDAO) {
        this.memberDAO = memberDAO;
    }

    public boolean login(String memberId, String password, HttpSession session) {
        // memberId와 password 값이 제대로 전달되는지 출력해봅니다.
        System.out.println("로그인시도 아이디: " + memberId);
        System.out.println("로그인시도 비밀번호: " + password);

        Member member = memberDAO.findMember(memberId, password); // memberId를 사용하여 사용자 정보 조회

        // 로그인 조건: 사용자 정보가 존재하고, 비밀번호가 일치해야 함
        boolean success = member != null;

        if (success) {
            // 로그인 성공 시 세션에 회원 정보 저장
            session.setAttribute("USER_SESSION_KEY", member);
        } else {
            // 로그인 실패 시
        	 System.out.println("로그인 실패");
        }
        return success;
    }
    
}
