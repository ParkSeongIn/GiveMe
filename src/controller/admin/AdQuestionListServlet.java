package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.admin.AdminServiceImpl;
import service.member.MemberVo;
import service.question.QuestionVo;

/**
 * Servlet implementation class AdQuestionListServlet
 */
@WebServlet("/AdQuestionListServlet")
public class AdQuestionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdQuestionListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int midx = 0;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("vo") != null ) {
			MemberVo vo = (MemberVo) session.getAttribute("vo");
			midx = vo.getMidx();
		}
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		
		AdminServiceImpl ad = new AdminServiceImpl();
		
		ArrayList<QuestionVo> aqlist = ad.getAdQuestionList(keyField,keyWord);
		request.setAttribute("aqlist", aqlist);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
