package model.dao;

import model.Member;
import model.Post;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class PostDAO {
   private static SqlSessionFactory sqlMapper;
   
   static {
        String resource = "mybatis-config.xml";

        try {
            InputStream inputStream = Resources.getResourceAsStream(resource);
            sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            // 예외 메시지를 출력하여 디버깅 목적으로 확인
            e.printStackTrace();
            System.out.println("SqlSessionFactory 예외: " + e.getMessage());
            // 원래 예외를 랩핑한 ExceptionInInitializerError를 던져서 전파
            throw new ExceptionInInitializerError(e);
        } catch (Throwable t) {
            // 추가적인 로그 출력
            t.printStackTrace();
            System.out.println("Unexpected error during initialization: " + t.getMessage());
            throw t;
        }
    }
   
    // 게시글 생성
    public int createPost(Post post) {
       try (SqlSession sqlSession = sqlMapper.openSession()) {
          int succ = sqlSession.insert("model.dao.PostMapper.createPost", post);
          sqlSession.commit();
            return succ;
        }
    }

    // 게시글 업데이트
    public int updatePost(Post post) {
       try (SqlSession sqlSession = sqlMapper.openSession()) {
          int succ = sqlSession.update("model.dao.PostMapper.updatePost", post);
          sqlSession.commit();
            return succ;
        }
    }

    // 게시글 삭제
    public int deletePost(String postId) {
       try (SqlSession sqlSession = sqlMapper.openSession()) {
          int succ = sqlSession.delete("model.dao.PostMapper.deletePost", postId);
          sqlSession.commit();
            return succ;
        }
    }
    
    public Post findPost(String postId) {
        try (SqlSession sqlSession = sqlMapper.openSession()) {
            Post post = new Post();
            post.setPostId(postId);  // 공백 제거

            // MyBatis가 실행하는 SQL 쿼리를 출력
            BoundSql boundSql = sqlSession.getConfiguration().getMappedStatement("model.dao.PostMapper.findPost").getBoundSql(post);
            System.out.println("SQL Query: " + boundSql.getSql());
            
         // 추가로 결과 출력
            try {
                Post result = sqlSession.selectOne("model.dao.PostMapper.findPost", post);
                if (result == null) {
                    System.out.println("postId: " + postId + " - 작성한 포스트가 없습니다.");
                } else {
                    // 추가된 부분: 조회된 Post 객체의 activity와 review 값을 출력
                    System.out.println("Found Post - Activity: " + result.getActivity() + ", Review: " + result.getReview());
                }
                return result;
            } catch (PersistenceException e) {
                System.out.println("실패: 쿼리 실행 중 예외 발생 - " + e.getMessage());
                e.printStackTrace(); // 예외의 상세 내용을 출력
                return null;
            } catch (Exception e) {
                System.out.println("실패: 알 수 없는 예외 발생 - " + e.getMessage());
                e.printStackTrace(); // 예외의 상세 내용을 출력
                return null;
            }

        }
    }
    
    public List<Post> findPostsByDate(String date) {
        try (SqlSession sqlSession = sqlMapper.openSession()) {
            List<Post> posts = sqlSession.selectList("model.dao.PostMapper.findPostsByDate", date);

            if (posts.isEmpty()) {
                System.out.println("해당 유저의 포스트가 없습니다.");
            } else {
                System.out.println("유저의 포스트 목록:");
                for (Post post : posts) {
                    System.out.println("Post ID: " + post.getPostId() +
                            ", Title: " + post.getActivity() + ", Review: " + post.getReview()
                            + ", ID: " + post.getId());
                }
            }

            return posts;
        } catch (PersistenceException e) {
            System.out.println("실패: 쿼리 실행 중 예외 발생 - " + e.getMessage());
            e.printStackTrace();
            return Collections.emptyList(); // 빈 리스트 반환
        } catch (Exception e) {
            System.out.println("실패: 알 수 없는 예외 발생 - " + e.getMessage());
            e.printStackTrace();
            return Collections.emptyList(); // 빈 리스트 반환
        }
    }
}
