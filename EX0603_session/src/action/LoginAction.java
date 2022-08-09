package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// login.do?id=aaa&pwd=1111
		
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		MemberVO vo=MemberDAO.getInstance().selectOne(id);
		
		String param="";
		String resultStr="";
		
		//vo가 null인 경우 id자체가 DB자체에 존재하지 않는다는 의미
		if(vo==null) {
			param="no_id";
			resultStr=String.format("[{'param':'%s'}]", param);
			response.getWriter().print(resultStr);
			return;
		}
		
		// 비밀번호가 일치하지 않을 때
		if(!vo.getPwd().equals(pwd)) {
			param="no_pwd";
			resultStr=String.format("[{'param':'%s'}]", param);
			response.getWriter().print(resultStr);
			return;
		}
		
		//session 만들기
		HttpSession session=request.getSession();
		
		// 세션 기본 유지시간은 30분(1800초). 이걸 변경해주기 위한 초단위로 시간을 써주어야 함
//		session.setMaxInactiveInterval(60*60);
		
		session.setAttribute("vo", vo);
		
		// * session에 바인딩을 해놓았다면 포워딩할 필요 없음. 
		// 어느 JSP에서든 el표기법으로  (ex-vo.name/vo.pwd) 사용할 수 있다!
		
		// * session은 서버의 메모리를 사용하기 때문에 세션을 많이 사용할수록 브라우저가 느려짐
		// >> 필요한 곳에서만 세션을 사용하도록 하자
		
		
		
		
		//로그인에 성공했을 경우
		param="clear";
		resultStr=String.format("[{'param':'%s'}]", param);
		response.getWriter().print(resultStr);
		
	}

}
