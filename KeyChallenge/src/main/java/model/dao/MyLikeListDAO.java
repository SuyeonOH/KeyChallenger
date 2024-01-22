package model.dao;

import org.apache.ibatis.session.SqlSession;
import model.MyLikeList;
import java.util.HashMap;
import java.util.Map;

public class MyLikeListDAO {

    // MyBatis SqlSession
    private SqlSession sqlSession = null;

    public MyLikeListDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public void createLikeList(MyLikeList myLikeList) {
        try {
            sqlSession.insert("model.dao.MyLikeListDAO.create", myLikeList);
            sqlSession.commit();
            System.out.println("MyLikeList 생성 완료");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("MyLikeList 생성 실패");
        } finally {
            sqlSession.close();
        }
    }

    public void likePost(String postId, String userId) {
        try {
           Map<String, Object> parameters = new HashMap<>();
            parameters.put("postId", postId);
            parameters.put("userId", userId);
           
            sqlSession.update("model.dao.MyLikeListDAO.likePost", 
                Map.of("postId", postId, "userId", userId));
            sqlSession.commit();
            System.out.println("게시글 좋아요");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("좋아요 실패");
        } finally {
            sqlSession.close();
        }
    }

    public void unlikePost(String postId, String userId) {
        try {
           Map<String, Object> parameters = new HashMap<>();
            parameters.put("postId", postId);
            parameters.put("userId", userId);
           
            sqlSession.update("model.dao.MyLikeListDAO.unlikePost", 
                Map.of("postId", postId, "userId", userId));
            sqlSession.commit();
            System.out.println("좋아요 취소");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("좋아요 취소 실패");
        } finally {
            sqlSession.close();
        }
    }
}