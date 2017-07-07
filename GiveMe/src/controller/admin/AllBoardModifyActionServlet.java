package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		
		
		String abtitle = request.getParameter("abtitle");
		String abcontent = request.getParameter("abcontent");
		String abimage = request.getParameter("abimage");
		int abidx = Integer.parseInt(request.getParameter("abidx"));
		
		AdminServiceImpl as = new AdminServiceImpl();
		AllBoardVo av = new AllBoardVo();

		av.setAbtitle(abtitle);
		av.setAbcontent(abcontent);
		av.setAbimage(abimage);
		int abu = as.modifyAllBoard(av,abidx);
	}

}
