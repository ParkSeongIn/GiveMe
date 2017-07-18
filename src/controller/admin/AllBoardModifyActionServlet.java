package controller.admin;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import service.admin.AdminServiceImpl;
import service.allboard.AllBoardVo;

/**
 * Servlet implementation class AllBoardModifyActionServlet
 */
@WebServlet("/AllBoardModifyActionServlet")
public class AllBoardModifyActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllBoardModifyActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		ServletContext context = request.getSession().getServletContext();
//		// 파일이 저장될 물리적인 경로를 얻어온다.
//		String path = context.getRealPath("/upload");
//		// 파일 용량
//		int max = 1024 * 1024 * 100; // 100MB
//		// 저장 인코딩 방식
//		String enc = "utf-8";
//		// 중복 파일이 있을 경우 이름 변경 정책
//		DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
//		// 업로드 처리
//		MultipartRequest multi = new MultipartRequest(request, path, max, enc, dfr);
		
		request.setCharacterEncoding("UTF-8");
		
		String abtitle = request.getParameter("abtitle");
		String abcontent = request.getParameter("abcontent");
//		Enumeration files = multi.getFileNames();
//		String name1 = (String)files.nextElement();
//		String abimage = multi.getParameter(name1);
		int abidx = Integer.parseInt(request.getParameter("abidx"));
		
		AdminServiceImpl as = new AdminServiceImpl();
		AllBoardVo av = new AllBoardVo();

		av.setAbtitle(abtitle);
		av.setAbcontent(abcontent);
//		av.setAbimage(abimage);
		int abu = as.modifyAllBoard(av,abidx);
	}

}
