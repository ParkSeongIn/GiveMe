package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
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
import service.admin.DonationListVo;

/**
 * Servlet implementation class DonationModifyActionServlet
 */
@WebServlet("/DonationModifyActionServlet")
public class DonationModifyActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonationModifyActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
//		MultipartRequest mr = new MultipartRequest(request, path, max, enc, dfr);
		
		request.setCharacterEncoding("UTF-8");
		int dlidx = Integer.parseInt(request.getParameter("dlidx"));
		String dlplace = request.getParameter("dlplace");
		String dlarea = request.getParameter("dlarea");
		String dlcontent = request.getParameter("dlcontent");
		String dlgroup1 = request.getParameter("dlgroup1");
		String dlgroup2 = request.getParameter("dlgroup2");
		String dlgroup3 = request.getParameter("dlgroup3");
//		Enumeration files = mr.getFileNames();
//		String name1 = (String)files.nextElement();
//		String dlimage = mr.getFilesystemName(name1);
		
		AdminServiceImpl as = new AdminServiceImpl();
		
		DonationListVo dl = new DonationListVo();
		dl.setDlidx(dlidx);
		dl.setDlplace(dlplace);
		dl.setDlarea(dlarea);
		dl.setDlcontent(dlcontent);
		dl.setDlgroup1(dlgroup1);
		dl.setDlgroup2(dlgroup2);
		dl.setDlgroup3(dlgroup3);
//		dl.setDlimage(dlimage);
		
		int row = as.modifyDonationWrite(dl);
		
		
	}

}
