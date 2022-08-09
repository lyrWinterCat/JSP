package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import vo.UserVO;

/**
 * Servlet implementation class MemberInsertAction
 */
@WebServlet("/insert.do")
public class MemberInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비밀번호 이름 아이디 등이 있으므로 반드시 .encoding을 해주어야 함
		request.setCharacterEncoding("utf-8");
		
		// insert.do?id=aaaa&pwd=0000&name=bbbb 라고 전달될 것
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		
		// UserVO를 통해 한번에 보내주기
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		
		int res=UserDAO.getInstance().insert(vo);
		
		if(res>0) {
			response.sendRedirect("member_list.do");
		}
		
	}

}
