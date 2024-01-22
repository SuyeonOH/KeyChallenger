package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.List;
import model.Member;
import model.dao.MemberDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RankController extends HttpServlet implements Controller {

	private static final Logger logger = LoggerFactory.getLogger(RankController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// GET 요청일 때 랭킹 정보 조회
		if (request.getMethod().equals("GET")) {
			MemberDAO memberDAO = new MemberDAO(); // 멤버 DAO 생성


			try {
				List<Member> rankingList = memberDAO.getRankingMembers();
				
				int rank = 1;
				// 랭크처리
				for (Member member : rankingList) {
					member.setRanking(rank);
					rank++; 
				}

				// 데이터 확인을 위해 콘솔에 출력
				if (!rankingList.isEmpty()) {
					for (Member member : rankingList) {
						System.out.println("ID: " + member.getId() + ", Nickname: " + member.getNickName()
								+ ", Stamp Count: " + member.getStampCount() + ", Ranking: " + member.getRanking());
					}
				} else {
					System.out.println("랭킹 멤버 리스트가 비어 있습니다.");
				}
				request.setAttribute("rankingList", rankingList); // 랭킹 정보를 request로 넘겨주

				// 랭킹 페이지로 포워딩
				RequestDispatcher dispatcher = request.getRequestDispatcher("/resources/jsp/myRank.jsp");
				dispatcher.forward(request, response);
				return null; 
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("랭킹 조회 중 오류가 발생했습니다.", e); // 로그에 예외 정보 기록
			}

		}
		return null; 
	}
}
