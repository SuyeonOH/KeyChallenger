package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.dao.MemberDAO;
import model.dao.PostDAO;
import model.dao.StampDAO;
import model.dao.KeywordDAO;
import model.service.AuthServices;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    // 각 요청 uri에 대한 controller 객체를 저장할 HashMap 생성
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// 각 uri에 대응되는 controller 객체를 생성 및 저장
    	//mappings.put("/start.jsp", new ForwardController("/start.jsp"));
        mappings.put("/", new ForwardController("/main.jsp"));
        mappings.put("/user/character/select", new ForwardController("/signIn1.jsp"));

        //MainController수정
		mappings.put("/main", new MainController());
		mappings.put("/resources/jsp/main", new MainController());
		
        mappings.put("/user/login/form", new ForwardController("/login.jsp"));
        //mappings.put("/user/login/form", new ForwardController("/user/loginForm.jsp"));
        AuthServices authServices = new AuthServices(new MemberDAO());
        mappings.put("/user/login", new LoginController(authServices));
        mappings.put("/user/logout", new LogoutController());
        //mappings.put("/user/list", new ListUserController());
        //mappings.put("/user/view", new ViewUserController());
        
        // 회원 가입 폼 요청과 가입 요청 처리 병합 (폼에 커뮤니티 선택 메뉴 추가를 위함)
        mappings.put("/user/register/form", new ForwardController("/signIn2.jsp"));
        mappings.put("/user/register", new RegisterMemberController());
 
        // 회원 profile 수정 ... -수연..-
        mappings.put("/user/update/form", new ForwardController("/editProfile.jsp"));
        mappings.put("/user/update", new UpdateMemberController());
        
        // post 관련 추가.. -효진-
        mappings.put("/post/register/form", new ForwardController("/myPost.jsp"));
        mappings.put("/post/register", new PostController()); // mypost.jsp에서 사용
        mappings.put("/post/delete", new PostController()); // mypost.jsp에서 사용
        
        mappings.put("/user/rank/list", new RankController());
        // 사용자 정보 수정 폼 요청과 수정 요청 처리 병합
//      mappings.put("/user/update/form", new UpdateUserFormController());
//      mappings.put("/user/update", new UpdateUserController());        
//        mappings.put("/user/update", new UpdateUserController());
        
//        mappings.put("/user/delete", new DeleteUserController());
        
        // 커뮤니티 관련 request URI 추가
//        mappings.put("/community/list", new ListCommunityController());
//        mappings.put("/community/view", new ViewCommunityController());
//        mappings.put("/community/create/form", new ForwardController("/community/creationForm.jsp"));
//        mappings.put("/community/create", new CreateCommunityController());
//        mappings.put("/community/update", new UpdateCommunityController());
//        
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {
        // 주어진 uri에 대응되는 controller 객체를 찾아 반환
        uri = uri.trim(); // 앞뒤 공백 제거
        return mappings.get(uri);
    }
}