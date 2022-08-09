package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PhotoDAO;
import vo.PhotoVO;

/**
 * Servlet implementation class PhotoInsertAction
 */
@WebServlet("/insert.do")
public class PhotoInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// insert.do?title=00000&pwd=000000&photo=000000 로 넘어왔을 것.
		
		//webContent에 upload 폴더 생성 (절대경로 잡아주기 위한 순서)
		String web_path="/upload/";
		ServletContext application = request.getServletContext();
		
		//여기서 절대경로 잡기 (안에 상대경로 넣어주기)
		String path = application.getRealPath(web_path);
		System.out.println(path); //사진을 올렸을 경우 콘솔에 절대경로가 찍히게 됨
		
		// 파일 업로드 최대용량
		int max_size= 1024*1024*100;
		
		// 파일 업로드를 할 수 있는 클래스 생성
		MultipartRequest mr = new MultipartRequest(request,path,max_size,"utf-8",new DefaultFileRenamePolicy());
		
		String filename="";
		File f = mr.getFile("photo");
		
		if(f !=null) {
			filename = f.getName(); //업로드된 파일의 실제 파일명
		}
		
		
		//바인딩,포워딩이 아닌 파라미터만 전달		
		//파라미터 받아주기
		String title = mr.getParameter("title");
		String pwd = mr.getParameter("pwd");
		String ip = request.getRemoteAddr();
		
		//VO에 묶어서 전달하기
		PhotoVO vo = new PhotoVO();
		vo.setTitle(title);
		vo.setFilename(filename);
		vo.setIp(ip);
		vo.setPwd(pwd);
		
		// PhotoDAO에 insert 기능 확인
		int res=PhotoDAO.getInstance().insert(vo);
		
		if(res>=1) {
			response.sendRedirect("list.do");
		}

		
	}

}
