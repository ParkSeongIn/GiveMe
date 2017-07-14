package controller.allboard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.allboard.AllBoardServiceImpl;
import service.allboard.AllBoardVo;

/**
 * Servlet implementation class AllBoardContentServlet
 */
@WebServlet("/AllBoardContentServlet")
public class AllBoardContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllBoardContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int abidx = Integer.parseInt(request.getParameter("abidx"));
		
		AllBoardServiceImpl abi = new AllBoardServiceImpl();
		AllBoardVo av = abi.getAllBoard(abidx);
						abi.updateAllBoardHit(abidx);
		
		request.setAttribute("av", av);
		request.setAttribute("abidx", abidx);

//		RequestDispatcher rd = request.getRequestDispatcher(request.getContextPath()+"/community/news_content.jsp");
//		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
