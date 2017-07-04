package controller.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.admin.CashDonationContentServlet;
import controller.cashdonation.CashDonationConfirmServlet;
import controller.cashdonation.CashDonationInsertActionServlet;
import controller.cashdonation.CashDonationInsertServlet;
import controller.cashdonation.CashDonationListServlet;
import controller.cashdonation.CashDonationReceiptServlet;
import controller.member.MypageCashDonationListServlet;
import controller.question.QuestionContentServlet;
import controller.question.QuestionListServlet;
import controller.question.QuestionModifyActionServlet;
import controller.question.QuestionModifyServlet;
import controller.question.QuestionWriteActionServlet;
import controller.question.QuestionWriteServlet;


/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean isRedirect = false;
	private String view;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String contextPath = request.getContextPath(); 
		String url = request.getRequestURI();
		String command = url.substring(contextPath.length());
		
		if(command.equals("/controller/cashdonation/CashDonationListServlet.do")){

			CashDonationListServlet cdls = new CashDonationListServlet();
			cdls.doGet(request, response);
			
			this.view = "/admin/ad_cash_list.jsp";
			this.isRedirect = false;
		
		}else if (command.equals("/controller/member/MypageCashDonationListServlet.do")) {
			
			MypageCashDonationListServlet mcl = new MypageCashDonationListServlet();
			mcl.doPost(request, response);
			
			this.view = "/mypage/cash_detail.jsp";
			this.isRedirect = false;
			
		}else if (command.equals("/controller/cashdonation/CashDonationInsertServlet.do")) {
			//System.out.println("TestINSERT");
			CashDonationInsertServlet cdis = new CashDonationInsertServlet();
			cdis.doPost(request, response);
			
			this.view = "/donation/cash_insert.jsp";
			this.isRedirect = false;
			
		}else if (command.equals("/controller/cashdonation/CashDonationConfirmServlet.do")) {
			//System.out.println("TestCONFIRM");
			CashDonationConfirmServlet cdcs = new CashDonationConfirmServlet();
			cdcs.doPost(request, response);
			
			this.view = "/donation/cash_confirm.jsp";
			this.isRedirect = false;
			
		}else if (command.equals("/controller/cashdonation/CashDonationInsertActionServlet.do")) {
			//System.out.println("TestINSERTACTION");
			CashDonationInsertActionServlet cdas = new CashDonationInsertActionServlet();
			cdas.doPost(request, response);
			
			this.view = "/controller/cashdonation/CashDonationResultServlet.do";
			this.isRedirect = true;
			
		}else if (command.equals("/controller/cashdonation/CashDonationResultServlet.do")) {
			//System.out.println("TestRESULT");
			CashDonationInsertActionServlet cdas = new CashDonationInsertActionServlet();
			cdas.doPost(request, response);
			
			this.view = "/donation/cash_result.jsp";
			this.isRedirect = true;
			
		}else if (command.equals("/controller/admin/CashDonationContentServlet.do")) {
		//	System.out.println("TestOk");
			CashDonationContentServlet cdcs = new CashDonationContentServlet();
			cdcs.doPost(request, response);
			
			this.view = "/admin/ad_cash_content.jsp";
			this.isRedirect = false;
		
		}else if (command.equals("/controller/cashdonation/CashDonationReceiptServlet.do")) {
			//System.out.println("TTTTT");
			CashDonationReceiptServlet cdrs = new CashDonationReceiptServlet();
			cdrs.doPost(request, response);
				
			this.view = "/mypage/cash_receipt.jsp";
			this.isRedirect = false;
		}else if (command.equals("/controller/question/QuestionListServlet.do")) {
	
			QuestionListServlet cls = new QuestionListServlet();
			cls.doPost(request, response);
			
			this.view = "/community/qna_list.jsp";
			this.isRedirect = false;
			
		}else if (command.equals("/controller/question/QuestionWriteServlet.do")) {
			
				QuestionWriteServlet cws = new QuestionWriteServlet();
				cws.doGet(request, response);
				
				this.view = "/community/qna_write.jsp";
				this.isRedirect = false;
				
		}else if (command.equals("/controller/question/QuestionWriteActionServlet.do")) {
			
			QuestionWriteActionServlet cwas = new QuestionWriteActionServlet();
			cwas.doPost(request, response);
			
			this.view = "/controller/question/QuestionListServlet.do";
			this.isRedirect = true;	
			
		}else if (command.equals("/controller/question/QuestionContentServlet.do")) {
			//System.out.println("content");
			QuestionContentServlet qcs = new QuestionContentServlet();
			qcs.doPost(request, response);
			
			this.view= "/community/qna_content.jsp";
			this.isRedirect = false;
			
		}else if (command.equals("/controller/question/QuestionModifyServlet.do")) {
//			System.out.println("modify");
			QuestionModifyServlet qms = new QuestionModifyServlet();
			qms.doPost(request, response);
			
			this.view= "/community/qna_modify.jsp";
			this.isRedirect = false;
			
		}else if (command.equals("/controller/question/QuestionModifyActionServlet.do")) {
			System.out.println("modifyAction");
			QuestionModifyActionServlet qma = new QuestionModifyActionServlet();
			qma.doPost(request, response);
			
			this.view= "/controller/question/QuestionContentServlet.do?qidx="+request.getParameter("qidx")+"&midx="+request.getParameter("midx");
			this.isRedirect = true;
			
		}
//		else if (command.equals("/Controller/QuestionDeleteServlet.do")) {
//			
//			QuestionDeleteServlet qds = new QuestionDeleteServlet();
//			qds.doPost(request, response);
//			
//			this.view= "/Controller/QuestionListServlet.do";
//			this.isRedirect = true;
//		
		
//		if(command.equals("/Controller/QusetionListServlet.do")){
//
//			QuestionListServlet qls = new QuestionListServlet();
//			qls.doGet(request, response);
//			
//			this.view = "/community/qna_list.jsp";
//			this.isRedirect = false;
//		
//		}else if (command.equals("/Controller/QuestionWriteServlet.do")) {
//			
//			QuestionWriteServlet qws = new QuestionWriteServlet();
//			qws.doPost(request, response);
//			
//			this.view = "/community/qna_write.jsp";
//			this.isRedirect = false;
//			
//		}else if (command.equals("/Controller/QuestionWriteActionServlet.do")) {
//			
//			QuestionWriteActionServlet qwa = new QuestionWriteActionServlet();
//			qwa.doPost(request, response);
//			
//			this.view = "/Controller/QuestionListServlet.do";
//			this.isRedirect = true;
//			
//		}else if (command.equals("/Controller/QuestionContentServlet.do")) {
//			
//			QuestionContentServlet qcs = new QuestionContentServlet();
//			qcs.doPost(request, response);
//			
//			this.view= "/community/qna_content.jsp";
//			this.isRedirect = false;
//			
//		}else if (command.equals("/Controller/QuestionModifyServlet.do")) {
//			
//			QuestionModifyServlet qms = new QuestionModifyServlet();
//			qms.doPost(request, response);
//			
//			this.view= "/community/qna_modify.jsp";
//			this.isRedirect = false;
//			
//		}else if (command.equals("/Controller/QuestionModifyActionServlet.do")) {
//			
//			QuestionModifyActionServlet qma = new QuestionModifyActionServlet();
//			qma.doPost(request, response);
//			
//			this.view= "/Controller/QuestionContentServlet.do";
//			this.isRedirect = true;
//			
//		}else if (command.equals("/Controller/QuestionDeleteServlet.do")) {
//			
//			QuestionDeleteServlet qds = new QuestionDeleteServlet();
//			qds.doPost(request, response);
//			
//			this.view= "/Controller/QuestionListServlet.do";
//			this.isRedirect = true;
//	}
		if(this.isRedirect){
			response.sendRedirect(contextPath+view);
		}else{
			RequestDispatcher rs = request.getRequestDispatcher(view);
			rs.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
