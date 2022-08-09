package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GogekDAO;
import vo.GogekVO;

/**
 * Servlet implementation class GogekListAction
 */
@WebServlet("/gogek_list.do")
public class GogekListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//gogek_list.do (null)  또는 gogek_list.do?=search (empty) 
		// 넘어온값이 null 또는 empty인지 먼저 판별
		
		//넘어온 파라미터 글자 깨짐 방지
		request.setCharacterEncoding("utf-8");
		
		String search="all";
		String str_search = request.getParameter("search");
		
		//정상적으로 파라미터가 들어온 경우 (not null && not empty)
		if(str_search != null && !str_search.isEmpty()) {
			search=str_search;
		}
		
		//조회 및 목록 가져오기
//		List<GogekVO> list = GogekDAO.getInstance().select();
		List<GogekVO> list=null;
		if(search.equals("all")) {
			list = GogekDAO.getInstance().select();
		}else {
			list=GogekDAO.getInstance().select(search);
		}
		
		request.setAttribute("list", list);
		
		RequestDispatcher disp = request.getRequestDispatcher("gogek_list.jsp");
		disp.forward(request, response);
	}

}
