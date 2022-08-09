package action;

import java.io.IOException;
import java.net.InetAddress;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardInsertAction
 */
@WebServlet("/insert.do")
public class BoardInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 글자 깨짐 방지
		request.setCharacterEncoding("utf-8");
		
		//insert.do?subject=aaa&name=bbb&... 파라미터 넘어옴
		String subject=request.getParameter("subject");
		String name=request.getParameter("name");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		String ip = request.getRemoteAddr();//ip
		
		
		String myIp=InetAddress.getLocalHost().getHostAddress();
		if(ip.equals("0:0:0:0:0:0:0:1")) {
			ip=myIp;
		}
		
		BoardVO vo = new BoardVO();
		vo.setSubject(subject);
		vo.setName(name);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		int res=BoardDAO.getInstance().insert(vo);
		
		if(res>0) {
			//등록 완료 후 게시판의 첫페이지로 복귀
			response.sendRedirect("board_list.do");
		}
		
		
	}

}
