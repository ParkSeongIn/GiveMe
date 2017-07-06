package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.admin.AdminServiceImpl;
import service.question.QuestionVo;

/**
 * Servlet implementation class AdQuestionModifyActionServlet
 */
@WebServlet("/AdQuestionModifyActionServlet")
public class AdQuestionModifyActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdQuestionModifyActionServlet() {
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
//		doGet(request, response);
	
		int qidx = Integer.parseInt(request.getParameter("qidx"));
		String qrecontent = request.getParameter("qrecontent");
		
		AdminServiceImpl ad = new AdminServiceImpl();
		
		QuestionVo qv = new QuestionVo();
		qv.setQidx(qidx);
		qv.setQrecontent(qrecontent);
		
		int row = ad.modifyWriteAdQuestion(qv);
	}
	
}
