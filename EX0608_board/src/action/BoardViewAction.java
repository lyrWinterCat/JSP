package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardViewAction
 */
@WebServlet("/view.do")
public class BoardViewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// view.do?idx=000 로 넘어오는 파라미터는 idx 하나. (null이 넘어올 일이 없음)
		int idx=Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = BoardDAO.getInstance();
		// 상세보기 >> 조회수 증가 처리를 위해서 db에 두 번 접근해야함 >> dao 객체 생성 하고 진행
		
		//idx에 해당하는 게시글 한 건을 조회하기 위해 selectOne메서드 사용
		BoardVO vo = dao.selectOne(idx);
		
		//조회수 증가
		// session 사용하기 (새로고침시 조회수 증가 방지)
		HttpSession session = request.getSession();
		String show=(String)session.getAttribute("show"); //object로 받아오기때문에 형변환 해주기
		
		if(show==null) {
			//show가 null일때만 조회수 증가
			int res=dao.update_readhit(idx);
			session.setAttribute("show","0");
		}
		// 다른 게시물에 들어가도 0을 점유하고있기 때문에 조회수 증가가 안됨.
		// 따라서 목록으로 돌아오면 session을 해제해주어야 함 (BoardListAction에서 해제)
	
		
		//상세보기페이지로 전환하기 위해 바인딩 및 포워딩
		request.setAttribute("vo", vo);
		RequestDispatcher disp = request.getRequestDispatcher("board_view.jsp");
		disp.forward(request, response);		
	}
}
