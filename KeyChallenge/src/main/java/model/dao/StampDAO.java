package model.dao;

import org.apache.ibatis.session.SqlSession;
import model.CalendarStamp;

public class StampDAO {
    private SqlSession sqlSession = null;
    
    public StampDAO(SqlSession sqlSession) {          
        this.sqlSession = sqlSession;
    }
    
    // 스탬프 등록
    public void createStamp(CalendarStamp stamp) {
        try {
            sqlSession.insert("model.dao.StampDAO.createStamp", stamp);
            sqlSession.commit();
            System.out.println("스탬프 등록 완료");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("스탬프 등록 실패");
        } finally {
            sqlSession.close();
        }
    }
}