package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileUploadAction
 */

// @WebServlet : url매핑 - jsp에서 현재 서블릿을 요청할 수 있는 식별자를 지정하는 영역
@WebServlet("/upload.do")
public class FileUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request,// 파라미터를 받을때 사용하는 요청 처리 객체
			HttpServletResponse response) // 파라미터를 보낼때 사용하는 응답 처리 객체 
					throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); //밑 mr에서 지정한다면 쓸 필요는 없으나 습관적으로 쓰자
		System.out.println("서블릿 접속됨");
		
		// 절대경로로 접근하기 위한 경로 . 업로드 폴더 까지만이라도 접근을 하면 절대경로에 있는 사진을 가져올 수는 있음!!
		// 여기의 upload는 상대경로. 여기서 절대경로와 연결하는 것 ! 
		String webpath="/upload/";
		
		// 현재 프로젝트에 대한 정보를 관리하는 클래스
		ServletContext application = request.getServletContext();
		
		// upload폴더까지의 절대경로 >> 사용자가 사진을 올리는 곳
		String path = application.getRealPath(webpath);
		System.out.println(path);
		
		int max_size=1024*1024*100;//1024*1024가 1MB . 1MB*100 = 100MB 
		
		// 파일을 포함한 파라미터를 수신하기 위한 객체  cos.jar 안에 위치함
		MultipartRequest mr = new MultipartRequest(request, //request정보는 문자열만 수신이 가능하기 때문에 사진도 받을 수 있게 정보를 위임
				path , //업로드 경로
				max_size, // 최대 업로드 용량 (남는 용량은 JVM이 알아서 버려줌)
				"utf-8", // 수신시 인코딩 타입 >> setCharacterEncoding 을 쓰지 않아도 됨 
				new DefaultFileRenamePolicy()); //중복된 파일명을 알아서 변경 >>spring에는 없음^^
		
		// filename >> null로 줘도 상관없음
		String filename="no_file";
		
		//업로드가 완료된 파일의 정보를 얻어오자
		File f = mr.getFile("photo");
		
		if(f!=null) {
			filename=f.getName(); //방금 업로드 된 파일의 이름을 가져올 수 있다.
		}
		
		// 파일 이외의 일반 파라미터
		String title=mr.getParameter("title");
		
		// * 가장 중요한 부분 : 바인딩 *
		// 파일명과 제목을 request영역에 저장(바인딩) //request>> 2페이지 영역에서 사용 가능
		// scope영역에 저장 >> el표기법으로 사용하기 위한 순서
		request.setAttribute("title", title);
		request.setAttribute("filename", filename);
		
		// 파일 돌려받기
		// 이렇게 작성할 경우 처음 페이지로는 돌아갈 수 있지만 의미가 없음
//		response.sendRedirect("uploadInput.jsp");
		
		// 바인딩 해놓은 정보를 어떤 페이지에 가져다가 사용할 것인지를 지정(포워딩)
		RequestDispatcher disp = request.getRequestDispatcher("result.jsp");
		disp.forward(request,response);
		
		
	}

}
