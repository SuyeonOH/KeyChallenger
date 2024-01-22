package controller;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Post;
import model.dao.PostDAO;
import model.Member;
import model.dao.MemberDAO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PostController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterMemberController.class);
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String date = request.getParameter("date");
        String postId = date + "_" + id;        
        
        // POST request (post 정보가 parameter로 전송됨)
        PostDAO postDAO = new PostDAO();
      MemberDAO memberDAO = new MemberDAO();
      
        String activity = request.getParameter("activity");
        String review = request.getParameter("review");
        String keyword = request.getParameter("keyword");
              
        if ("delete".equals(request.getParameter("action"))) {
            // 포스트 삭제 로직
            int deleteResult = postDAO.deletePost(postId);

            if (deleteResult > 0) {
                // 삭제 성공
                session.removeAttribute("RETRIEVED_POST_SESSION_KEY");
                session.removeAttribute("REVIEW_SESSION_KEY");
                session.removeAttribute("ACTIVITY_SESSION_KEY");
                
                // 세션 값을 업데이트하여 뷰에서 올바른 값이 표시되도록 함
                session.setAttribute("RETRIEVED_POST_SESSION_KEY", null);
                session.setAttribute("REVIEW_SESSION_KEY", null);
                session.setAttribute("ACTIVITY_SESSION_KEY", null);
                
                memberDAO.removeStamp(id);
            } else {
                System.out.println("삭제 오류!!");
            }
            
            session.removeAttribute("RETRIEVED_POST_SESSION_KEY");
            
        } else if (session.getAttribute("RETRIEVED_POST_SESSION_KEY") == null) {
            System.out.println("CREATE ----------" + session.getAttribute("RETRIEVED_POST_SESSION_KEY"));

            // 데이터베이스에 해당 기본 키를 가진 레코드가 없으면 새로운 레코드를 생성
            Post post = new Post(
                postId,
                activity,
                "photo", 
                review,
                keyword,
                date,
                0,
                "임시LikeID",
                id
            );

            session.setAttribute("POST_SESSION_KEY", post);
            session.setAttribute("ACTIVITY_SESSION_KEY", post.getActivity());
            session.setAttribute("REVIEW_SESSION_KEY", post.getReview());

            postDAO.createPost(post);
            memberDAO.addStamp(id);
            
        } else {
            // 데이터베이스에 해당 기본 키를 가진 레코드가 이미 존재하면 레코드를 업데이트
           System.out.println("UPDATE ----------" + session.getAttribute("RETRIEVED_POST_SESSION_KEY"));
           Post post2 = new Post(
                 postId,
                   activity,
                   "photo", 
                   review,
                   keyword,
                   date,
                   0,
                   "임시LikeID",
                   id
              );
            
            post2.setActivity(activity);
            post2.setReview(review);
            post2.setPhoto("photo");
            
            session.setAttribute("POST_SESSION_KEY", post2);
            session.setAttribute("ACTIVITY_SESSION_KEY", post2.getActivity());
            session.setAttribute("REVIEW_SESSION_KEY", post2.getReview());

            postDAO.updatePost(post2);
        }
        
        return "redirect:/resources/jsp/main.jsp";
        
    }

}