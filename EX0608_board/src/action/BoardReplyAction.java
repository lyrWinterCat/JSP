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
 * Servlet implementation class BoardReplyAction
 */
@WebServlet("/reply.do")
public class BoardReplyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		int idx=Integer.parseInt(request.getParameter("idx"));
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		String ip=request.getRemoteAddr();
		
		String myIp=InetAddress.getLocalHost().getHostAddress();
		if(ip.equals("0:0:0:0:0:0:0:1")) {
			ip=myIp;
		}
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//기준글의 idx를 이용해서 댓글을 달고 싶은 게시글의 정보를 가져온다.
		BoardVO base_vo = dao.selectOne(idx);
		
		//기준글에 step 이상 값은 step=step+1 처리
		dao.update_step(base_vo);
		
		//댓글vo
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		// 댓글이 들어갈 위치를 선정
		vo.setRef(base_vo.getRef());
		vo.setStep(base_vo.getStep()+1);
		vo.setDepth(base_vo.getDepth()+1);
		
		//댓글 등록
		int res=dao.reply(vo);
		
		if(res>0) {
			int page=Integer.parseInt(request.getParameter("page"));
			response.sendRedirect("board_list.do?page="+page);
		}
		
		
	}

}
