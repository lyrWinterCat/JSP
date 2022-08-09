package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutAction
 */
@WebServlet("/logout.do")
public class LogoutAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션 없음... 만들어주기
		
		// 세션 : static. 객체를 만들어도 이미 만들어진 객체랑 주소를 공유함.
		HttpSession session = request.getSession();
		
		//logout-세션에서 vo 제거하기
		session.removeAttribute("vo");
		
		response.sendRedirect("login_form.jsp");
		
	}

}
