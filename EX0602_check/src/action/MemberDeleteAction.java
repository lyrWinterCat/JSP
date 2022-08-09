package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

/**
 * Servlet implementation class MemberDeleteAction
 */
@WebServlet("/delete.do")
public class MemberDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int idx=Integer.parseInt(request.getParameter("idx"));
		
		int res=UserDAO.getInstance().delete(idx);
		
		String param = "no";
		if(res>0) { //삭제성공시
			param = "yes";
		}
		
		//json 배열로 결과값 보내기
		String resultStr=String.format("[{'param':'%s'}]", param);
		response.getWriter().print(resultStr);
	}

}
