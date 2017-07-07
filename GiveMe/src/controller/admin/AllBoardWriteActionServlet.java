package controller.admin;

import java.io.IOException;
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
 * Servlet implementation class AllBoardWriteActionServlet
 */
@WebServlet("/AllBoardWriteActionServlet")
public class AllBoardWriteActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllBoardWriteActionServlet() {
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
		request.setCharacterEncoding("UTF-8");
		
		// 파일첨부 관련 추가
		String savePath = request.getServletContext().getRealPath("upload");
		int sizeLimit = 10 * 1024 * 1024 ; // 10메가 용량 제한
		MultipartRequest multi =new MultipartRequest
				(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

		String abtype = multi.getParameter("abtype");
		String abtitle = multi.getParameter("abtitle");
		String abcontent = multi.getParameter("abcontent");
		String abimage = multi.getFilesystemName("abimage");
		
		String fileFullPath = savePath + "/" + abimage;
		
		AdminServiceImpl ads = new AdminServiceImpl();
		AllBoardVo avo = new AllBoardVo();
		
		avo.setAbtype(abtype);
		avo.setAbtitle(abtitle);
		avo.setAbcontent(abcontent);
		avo.setAbimage(abimage);
		avo.setFileFullPath(fileFullPath);
		
		int iab = ads.insertAllBoard(avo);
		
//	    if (iab ==0) {
//	    response.sendRedirect(request.getContextPath()+"/controller.allboard/AllBoardListServlet.do");	
//	    }
//	    else{
//	    response.sendRedirect(request.getContextPath()+"/community/news_content.jsp");
//	    }
	}

}
