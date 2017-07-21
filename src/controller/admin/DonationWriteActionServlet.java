package controller.admin;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//import com.sun.glass.ui.Application;

import service.admin.AdminServiceImpl;
import service.admin.DonationListVo;
import service.member.MemberVo;

/**
 * Servlet implementation class DonationWriteActionServelt
 */
@WebServlet("/DonationWriteActionServelt")
public class DonationWriteActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonationWriteActionServlet() {
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
		try{
		ServletContext context = request.getSession().getServletContext();
		// 파일이 저장될 물리적인 경로를 얻어온다.
		String path = context.getRealPath("/upload");
		// 파일 용량
		int max = 1024 * 1024 * 100; // 100MB
		// 저장 인코딩 방식
		String enc = "utf-8";
		// 중복 파일이 있을 경우 이름 변경 정책
		DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
		// 업로드 처리
		MultipartRequest mr = new MultipartRequest(request, path, max, enc, dfr);
		
		request.setCharacterEncoding("UTF-8");
		
		String dlplace = mr.getParameter("dlplace");
		String dlarea = mr.getParameter("dlarea");
		String dlgroup1 = mr.getParameter("dlgroup1");
		String dlgroup2 = mr.getParameter("dlgroup2");
		String dlgroup3	= mr.getParameter("dlgroup3");
		String dlcontent = mr.getParameter("dlcontent");
		Enumeration files = mr.getFileNames();
		String name1 = (String)files.nextElement();
		String dlimage = mr.getFilesystemName(name1);
		
		AdminServiceImpl as = new AdminServiceImpl();
		
		DonationListVo dl = new DonationListVo();
		dl.setDlplace(dlplace);
		dl.setDlarea(dlarea);
		dl.setDlgroup1(dlgroup1);
		dl.setDlgroup2(dlgroup2);
		dl.setDlgroup3(dlgroup3);
		dl.setDlcontent(dlcontent);
		dl.setDlimage(dlimage);
		
		int row = as.insertDonationList(dl);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
