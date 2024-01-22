package model.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class MemberDAO {
    private static SqlSessionFactory sqlMapper;
    

	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);

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


    public int create(Member member) {
        try (SqlSession sqlSession = sqlMapper.openSession()) {
            int succ = sqlSession.insert("model.dao.MemberMapper.create", member);
            sqlSession.commit();
            return succ;
        }
    }

    public int update(Member member) {
        try (SqlSession sqlSession = sqlMapper.openSession()) {
            int succ = sqlSession.update("model.dao.MemberMapper.update", member);
            sqlSession.commit();
            return succ;
        }
    }
    
    public int remove(String memberId) {
        try (SqlSession sqlSession = sqlMapper.openSession()) {
            int succ = sqlSession.delete("model.dao.MemberMapper.remove", memberId);
            sqlSession.commit();
            return succ;
        }
    }

    public int addStamp(String memberId) {
        try (SqlSession sqlSession = sqlMapper.openSession()) {
            int succ = sqlSession.update("model.dao.MemberMapper.addStamp", memberId);
            sqlSession.commit();
            return succ;
        }
    }
    
    public int removeStamp(String memberId) {
        try (SqlSession sqlSession = sqlMapper.openSession()) {
            int succ = sqlSession.update("model.dao.MemberMapper.removeStamp", memberId);
            sqlSession.commit();
            return succ;
        }
    }
    
    public Member findMember(String id, String pwd) {
        try (SqlSession sqlSession = sqlMapper.openSession()) {
            Member member = new Member();
            member.setId(id);  // 공백 제거
            member.setPwd(pwd);

            // MyBatis가 실행하는 SQL 쿼리를 출력
            BoundSql boundSql = sqlSession.getConfiguration().getMappedStatement("model.dao.MemberMapper.findMember").getBoundSql(member);
            System.out.println("SQL Query: " + boundSql.getSql());
            
            // 추가로 결과 출력
            try {
            	Member result = sqlSession.selectOne("model.dao.MemberMapper.findMember", member);
            	if (result == null) {
            	    System.out.println("로그인 실패: 데이터베이스에서 일치하는 회원을 찾을 수 없습니다. ID: " + id);
            	}
                return result;
            } catch (PersistenceException e) {
                System.out.println("로그인 실패: 쿼리 실행 중 예외 발생 - " + e.getMessage());
                return null;
            } catch (Exception e) {
                System.out.println("로그인 실패: 알 수 없는 예외 발생 - " + e.getMessage());
                return null;
            }
        }
    }


    public List<Member> findMemberList() {
        try (SqlSession sqlSession = sqlMapper.openSession()) {
            return sqlSession.selectList("model.dao.MemberMapper.findMemberList");
        }
    }

    public List<Member> findMemberList(int currentPage, int countPerPage) {
        try (SqlSession sqlSession = sqlMapper.openSession()) {
            String statement = "model.dao.MemberMapper.findMemberListWithPagination";
            Map<String, Integer> parameters = new HashMap<>();
            int start = ((currentPage - 1) * countPerPage) + 1;
            parameters.put("start", start);
            parameters.put("countPerPage", countPerPage);
            return sqlSession.selectList(statement, parameters);
        }
    }
    
    public List<Member> getRankingMembers() throws Exception {
        try (SqlSession sqlSession = sqlMapper.openSession()) {
            List<Member> rankingList = sqlSession.selectList("model.dao.MemberMapper.getRanking");

            // 데이터 확인용 출력
//            for (Member member : rankingList) {
//                System.out.println("ID: " + member.getId() + ", Stamp Count: " + member.getStampCount());
//            }

            return rankingList;
        } catch (Exception e) {
            throw new Exception("랭킹 멤버 리스트를 가져오는 중 오류가 발생했습니다.", e);
        }
    }
}
