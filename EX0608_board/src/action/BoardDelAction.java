package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardDelAction
 */
@WebServlet("/del.do")
public class BoardDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//del.do?idx=00 넘어옴
		int idx=Integer.parseInt(request.getParameter("idx"));
		
		//DB 두번 쓸 것이기 때문에 dao 선언 하고 시작
		BoardDAO dao = BoardDAO.getInstance();
		
		//삭제하려고하는 원본 글 받아오기
		BoardVO baseVO = dao.selectOne(idx);
		
		baseVO.setSubject("이미 삭제된 글입니다.");
		baseVO.setName("deleted");
		
		int res=dao.del_update(baseVO);
		
		if(res>0) {
			response.getWriter().print("[{'param':'yes'}]");
		} else {
			response.getWriter().print("[{'param':'no'}]");
		}
		
		
		
		
		
		
		
	}

}
