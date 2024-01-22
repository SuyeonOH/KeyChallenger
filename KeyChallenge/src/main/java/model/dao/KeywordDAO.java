package model.dao;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class KeywordDAO {
	private static SqlSessionFactory sqlSessionFactory;

	static {
		String resource = "mybatis-config.xml";

		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
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

	public String getKeyword(String id) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectOne("model.dao.KeywordMapper.getKeyword", id);
		} catch (PersistenceException e) {
			e.printStackTrace();
			throw new RuntimeException("Error retrieving keyword from the database.");
		}
	}
}