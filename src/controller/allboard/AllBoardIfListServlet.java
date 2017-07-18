package controller.allboard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.allboard.AllBoardServiceImpl;
import service.allboard.AllBoardVo;

/**
 * Servlet implementation class AllBoardIfListServlet
 */
@WebServlet("/AllBoardIfListServlet")
public class AllBoardIfListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllBoardIfListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	String abtype = request.getParameter("abtype");
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
	
		AllBoardServiceImpl ab = new AllBoardServiceImpl();
		ArrayList<AllBoardVo> ablist = ab.getAllBoardList(keyField, keyWord);
		request.setAttribute("ablist", ablist);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}