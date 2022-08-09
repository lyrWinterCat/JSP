package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhotoDAO;

/**
 * Servlet implementation class PhotoDeleteAction
 */
@WebServlet("/photo_del.do")
public class PhotoDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//photo_del.do?idx=000&filename=000& ... 넘어옴
		int idx=Integer.parseInt(request.getParameter("idx"));
		String filename=request.getParameter("filename");
		
		//절대경로찾기
		String web_path="/upload/";
		ServletContext app = request.getServletContext();
		
		//실제 경로
		String path=app.getRealPath(web_path);
		
		//idx에 해당되는 글 삭제
		int res= PhotoDAO.getInstance().delete(idx);
		
		// 사진 삭제
		if(res>0) {
			File f = new File(path,filename);
			if(f.exists()) {
				f.delete();
			}
		}
		
		
		//callback함수로 값이 잘 안넘어왔을 경우
		String param="no";
		if(res>0) {
			param="yes";
		}
		
		//결과값인 param을 json구조로 포장
		String resultStr = String.format("[{'param':'%s'}]", param);
		
		//resultSTR을 가지고 콜백메서드로 복귀
		response.getWriter().print(resultStr);
		

	}

}
