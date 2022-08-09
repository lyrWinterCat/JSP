package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import util.Common;
import util.Paging;
import vo.BoardVO;

/**
 * Servlet implementation class BoardListAction
 */
@WebServlet("/board_list.do")
public class BoardListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 현재 페이지 설정
		int nowPage=1;
		String page=request.getParameter("page"); // 처음에는 값이 없기 때문에 null로 들어옴
		
		if(page!=null && !page.isEmpty()) { //값이 들어옴
			nowPage = Integer.parseInt(page);
		}
		
		//한 페이지에 표시될 게시물의 시작과 끝번호를 계산
		// page가 1이면 1~10까지 계산이 되어야 함
		// page가 2이면 11~20까지 계산이 되어야 함 >>알고리즘?!
		int start = (nowPage-1)*Common.Board.BLOCKLIST + 1;
		
		// end=start+Common.Board.BLOCKLIST -1; ?? 왜..?
		int end = nowPage*Common.Board.BLOCKLIST;
		
		// start,end를 board.xml로 전달을 해주어야함 >>hashmap 사용!
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("start",start);
		map.put("end",end);
		
		
		
		//전체 목록 가져오기 
		//List<BoardVO> list = BoardDAO.getInstance().selectList();
		
		// 전체 게시글 조회>> 페이지 번호에 따른 게시글 조회
		List<BoardVO> list = BoardDAO.getInstance().selectList(map);
		
		//전체 게시물 수 가져오기
		int rowTotal = BoardDAO.getInstance().getRowTotal();
		
		//									사용할 페이지 주소 , 현재 페이지 번호, 전체 게시물 수 , 한 페이지에 표기할 게시물 수 , 보여지는 페이지 메뉴 수
		String pageMenu = Paging.getPaging("board_list.do", nowPage, rowTotal, Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE);
		
		
		//조회수를 위해 저장해놓았던 show라는 정보를 세션에서 제거
		request.getSession().removeAttribute("show");
		
		//바인딩
		request.setAttribute("list", list);
		request.setAttribute("pageMenu", pageMenu);
		
		//포워딩
		RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");		
		disp.forward(request, response);
		
	}

}
