package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;

/**
 * Servlet implementation class SawonListAction
 */
@WebServlet("/sawon_list.do")
public class SawonListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 선택한 부서번호의 멤버만 출력하기
		
		// 이렇게 쓰면 에러!
//		int deptno=Integer.parseInt(request.getParameter("deptno"));
		// null 또는 empty가 넘어오는 상황도 있기 때문.(null은 형변환 불가능)
		
		int deptno=0; //초기화
		String str_deptno=request.getParameter("deptno"); // 넘어온 파라미터를 String에 담아주기
		
		System.out.println(str_deptno);
		
		// jsp에서 넘어오는 값
		//sawon_list.do >> null값이 넘어옴 : 메모리 점유 X
		//sawon_list.do?deptno= >> empty값이 넘어옴 : 메모리 점유 O
		
		//null 또는 empty가 들어올 경우와 0-50 숫자가 들어올 경우를 나누어서 코딩
		// 파라미터가 null이 아니고 비어있지 않은 경우 >>0-50의 파라미터를 받음
		if(str_deptno !=null && !str_deptno.isEmpty()) { 

			deptno=Integer.parseInt(str_deptno);
		}
		
		
		// 조건문 안에 쓰면 지역변수가 되어서 해당 조건문 밖에서 접근 불가.
		// 선언해서 초기화 해주고 사용
		List<SawonVO> list = null;
		if(deptno == 0) {
			//전체사원 출력
			list = SawonDAO.getInstance().select();
		} else {
			//파라미터에 해당하는 사원만 조회
			list=SawonDAO.getInstance().select(deptno);
			
		}
		
		
		
		//전체사원 출력
//		List<SawonVO> list = SawonDAO.getInstance().select();
		
		request.setAttribute("list", list);
		
		RequestDispatcher disp = request.getRequestDispatcher("sawon_list.jsp");
		disp.forward(request, response);
	}

}
