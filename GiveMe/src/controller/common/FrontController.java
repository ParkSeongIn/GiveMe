package controller.common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import controller.admin.MemberListServlet;
import controller.member.MemberChangePwdActServlet;
import controller.member.MemberCheckLoginActionServlet;
import controller.member.MemberCheckLoginServlet;
import controller.member.MemberCheckLogoutServlet;
import controller.member.MemberCheckidServlet;
import controller.member.MemberContentServlet;
import controller.member.MemberFindidServlet;
import controller.member.MemberFindpwdServlet;
import controller.member.MemberInsertActionServlet;
import controller.member.MemberInsertServlet;
import controller.member.MemberModifyActServlet;
import controller.member.MemberModifyServlet;
import controller.admin.AdQuestionContentServlet;
import controller.admin.AdQuestionListServlet;
import controller.admin.AdQuestionModifyActionServlet;
import controller.admin.AdQuestionModifyServlet;
import controller.admin.CashDonationContentServlet;
import controller.admin.DonationContentServlet;
import controller.admin.DonationDeleteServlet;
import controller.admin.DonationListServlet;
import controller.admin.DonationModifyActionServlet;
import controller.admin.DonationModifyServlet;
import controller.admin.DonationWriteActionServlet;
import controller.admin.DonationWriteServlet;
import controller.cashdonation.CashDonationConfirmServlet;
import controller.cashdonation.CashDonationInsertActionServlet;
import controller.cashdonation.CashDonationInsertServlet;
import controller.cashdonation.CashDonationListServlet;
import controller.cashdonation.CashDonationReceiptServlet;
import controller.member.MypageCashDonationListServlet;
import controller.question.QuestionContentServlet;
import controller.question.QuestionDeleteServlet;
import controller.question.QuestionListServlet;
import controller.question.QuestionModifyActionServlet;
import controller.question.QuestionModifyServlet;
import controller.question.QuestionWriteActionServlet;
import controller.question.QuestionWriteServlet;
import service.admin.DonationListVo;

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
		 	String contextPath = request.getContextPath();
		    String url = request.getRequestURI();
		    String command = url.substring(contextPath.length());
		    
		    //회원
		    if(command.equals("/MemberListServlet.do")){
		    	MemberListServlet ml = new MemberListServlet();
		    	ml.doGet(request, response);
			
		    	this.view = "/member/ad_member_list.jsp";
		    	this.isRedirect=false;	
			
		    }else if(command.equals("/controller/MemberInsertServlet.do")){
		    	
		    	MemberInsertServlet mis = new MemberInsertServlet();
		    	mis.doGet(request, response);
			
		    	this.view = "/member/join.jsp";
		    	this.isRedirect=false;
			
		    }else if(command.equals("/controller/MemberInsertActionServlet.do")){
		    	
		    	MemberInsertActionServlet mas = new MemberInsertActionServlet();
		    	mas.doPost(request, response);
		    	
		    	this.view = "/main.jsp";
		    	this.isRedirect = true;
		    	
		    }else if(command.equals("/controller/MemberContentServlet.do")){
		    	
		    	MemberContentServlet mcs = new MemberContentServlet();
		    	mcs.doGet(request, response);
			
		    	this.view="/admin/ad_member_content.jsp";
		    	this.isRedirect=false;
			
		    }else if(command.equals("/controller/MemberModifyServlet.do")){
		    	
				MemberModifyServlet mms = new MemberModifyServlet();
				mms.doGet(request, response);
				
				this.view="/mypage/member_modify.jsp";
				this.isRedirect=false;
				
		    }else if(command.equals("/MemberModifyActServlet.do")){
		    	
				MemberModifyActServlet mmas = new MemberModifyActServlet();
				mmas.doPost(request, response);
				
				this.view="/MemberListServlet.do";
				this.isRedirect=true;
			
		    }else if(command.equals("/controller/MemberCheckLoginServlet.do")){
		    	
		    	MemberCheckLoginServlet mcls = new MemberCheckLoginServlet();
		    	mcls.doGet(request,response);
		    	
		    	this.view = "/member/login.jsp";
		    	this.isRedirect = false;
		    	
		    }else if(command.equals("/controller/MemberCheckLoginActionServlet.do")){
		    	
		    	MemberCheckLoginActionServlet mclas = new MemberCheckLoginActionServlet();
		    	mclas.doPost(request, response);
		    	
		    	this.view="/main/main.jsp";
		    	this.isRedirect=true;
			
		    }else if(command.equals("/controller/MemberFindidServlet.do")){
		    	
		    	MemberFindidServlet mfs = new MemberFindidServlet();
		    	mfs.doGet(request, response);
			
		    	this.view="/member/find_id_result.jsp";
		    	this.isRedirect=false;
		   
		    }else if(command.equals("/controller/MemberCheckidServlet.do")){
		    	
		    	MemberCheckidServlet mcs = new MemberCheckidServlet();
		    	mcs.doGet(request, response);
		    	
		    	this.view="/member/check_id.jsp";
		    	this.isRedirect=false;
		    
		    }else if(command.equals("/controller/MemberCheckLogoutServlet.do")){
		    	
		    	MemberCheckLogoutServlet mcls = new MemberCheckLogoutServlet();
		    	mcls.doPost(request, response);
		    	
		    	this.view="/main/main.jsp";
		    	this.isRedirect=true;
		   
		    }else if(command.equals("/controller/MemberFindpwdServlet.do")){
		    	
		    	MemberFindpwdServlet mfps = new MemberFindpwdServlet();
		    	mfps.doGet(request, response);
		    	
		    	this.view="/member/change_pwd.jsp";
		    	this.isRedirect= false;
		    
		    }else if(command.equals("/controller/MemberChangePwdActServlet.do")){
		    	
		    	MemberChangePwdActServlet mcpa = new MemberChangePwdActServlet();
		    	mcpa.doGet(request,response);
		    	
		    	this.view = "/member/change_pwd_result.jsp";
		    	this.isRedirect = false;
		    
		    // 현금기부
		    }else if(command.equals("/controller/cashdonation/CashDonationListServlet.do")){

				CashDonationListServlet cdls = new CashDonationListServlet();
				cdls.doGet(request, response);
				
				this.view = "/admin/ad_cash_list.jsp";
				this.isRedirect = false;
			
			}else if (command.equals("/controller/member/MypageCashDonationListServlet.do")) {
				
				MypageCashDonationListServlet mcl = new MypageCashDonationListServlet();
				mcl.doPost(request, response);
				
				this.view = "/mypage/cash_detail.jsp";
				this.isRedirect = false;
				
			}else if (command.equals("/controller/CashDonationInsertServlet.do")) {
		
				CashDonationInsertServlet cdis = new CashDonationInsertServlet();
				cdis.doPost(request, response);
				
				this.view = "/donation/cash_insert.jsp";
				this.isRedirect = false;
				
			}else if (command.equals("/controller/cashdonation/CashDonationConfirmServlet.do")) {
			
				CashDonationConfirmServlet cdcs = new CashDonationConfirmServlet();
				cdcs.doPost(request, response);
				
				this.view = "/donation/cash_confirm.jsp";
				this.isRedirect = false;
				
			}else if (command.equals("/controller/cashdonation/CashDonationInsertActionServlet.do")) {
			
				CashDonationInsertActionServlet cdas = new CashDonationInsertActionServlet();
				cdas.doPost(request, response);
				
				this.view = "/controller/cashdonation/CashDonationResultServlet.do";
				this.isRedirect = true;
				
			}else if (command.equals("/controller/cashdonation/CashDonationResultServlet.do")) {
			
				CashDonationInsertActionServlet cdas = new CashDonationInsertActionServlet();
				cdas.doPost(request, response);
				
				this.view = "/donation/cash_result.jsp";
				this.isRedirect = true;
				
			}else if (command.equals("/controller/admin/CashDonationContentServlet.do")) {
		
				CashDonationContentServlet cdcs = new CashDonationContentServlet();
				cdcs.doPost(request, response);
				
				this.view = "/admin/ad_cash_content.jsp";
				this.isRedirect = false;
			
			}else if (command.equals("/controller/cashdonation/CashDonationReceiptServlet.do")) {
			
				CashDonationReceiptServlet cdrs = new CashDonationReceiptServlet();
				cdrs.doPost(request, response);
					
				this.view = "/mypage/cash_receipt.jsp";
				this.isRedirect = false;
		   
			// 기부처 리스트
			}else if(command.equals("/controller/DonationListServlet.do")){
				DonationListServlet dl = new DonationListServlet();
				dl.doGet(request, response);
				
				this.view = "/admin/ad_donation_list.jsp";
				this.isRedirect = false;
				
			} else if(command.equals("/controller/DonationWriteServlet.do")){
				DonationWriteServlet dw = new DonationWriteServlet();
				dw.doGet(request,response);
				
				this.view = "/admin/ad_donation_write.jsp";
				this.isRedirect = false;
				
			} else if(command.equals("/controller/DonationWriteActionServlet.do")){
				DonationWriteActionServlet da = new DonationWriteActionServlet();
				da.doPost(request,response);
				
				this.view = "/controller/DonationListServlet.do";
				this.isRedirect = true;
			
			} else if(command.equals("/controller/DonationContentServlet.do")){
				DonationContentServlet dc = new DonationContentServlet();
				dc.doGet(request,response);
				
				this.view = "/admin/ad_donation_content.jsp";
				this.isRedirect = false;
				
			}else if(command.equals("/controller/DonationModifyServlet.do")){
				DonationModifyServlet dm = new DonationModifyServlet();
				dm.doGet(request,response);
				
				this.view = "/admin/ad_donation_modify.jsp";
				this.isRedirect = false;
				
			}else if(command.equals("/controller/DonationModifyActionServlet.do")){
				DonationModifyActionServlet dam = new DonationModifyActionServlet();
				dam.doPost(request,response);
				this.view = "/controller/DonationContentServlet.do?dlidx="+request.getParameter("dlidx");
				this.isRedirect = true;
				
			}else if(command.equals("/controller/DonationDeleteServlet.do")){
				DonationDeleteServlet dd = new DonationDeleteServlet();
				dd.doGet(request,response);
				
				this.view = "/controller/DonationListServlet.do";
				this.isRedirect = false;
				
			// 1:1문의
			}else if (command.equals("/controller/question/QuestionListServlet.do")) {
				
				QuestionListServlet qls = new QuestionListServlet();
				qls.doPost(request, response);
				
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
				
				QuestionContentServlet qcs = new QuestionContentServlet();
				qcs.doPost(request, response);
				
				this.view= "/community/qna_content.jsp";
				this.isRedirect = false;
				
			}else if (command.equals("/controller/question/QuestionModifyServlet.do")) {

				QuestionModifyServlet qms = new QuestionModifyServlet();
				qms.doPost(request, response);
				
				this.view= "/community/qna_modify.jsp";
				this.isRedirect = false;
				
			}else if (command.equals("/controller/question/QuestionModifyActionServlet.do")) {

				QuestionModifyActionServlet qma = new QuestionModifyActionServlet();
				qma.doPost(request, response);
				
				this.view= "/controller/question/QuestionContentServlet.do?qidx="+request.getParameter("qidx")+"&midx="+request.getParameter("midx");
				this.isRedirect = true;
				
			}else if (command.equals("/controller/question/QuestionDeleteServlet.do")) {

				QuestionDeleteServlet qds = new QuestionDeleteServlet();
				qds.doPost(request, response);
				
				this.view= "/controller/question/QuestionListServlet.do";
				this.isRedirect = true;
			
			}else if (command.equals("/controller/admin/AdQuestionListServlet.do")) {
		
				AdQuestionListServlet aqls = new AdQuestionListServlet();
				aqls.doPost(request, response);
				
				this.view = "/admin/ad_qna_list.jsp";
				this.isRedirect = false;
				
			}else if (command.equals("/controller/admin/AdQuestionContentServlet.do")) {

				AdQuestionContentServlet aqcs = new AdQuestionContentServlet();
				aqcs.doPost(request, response);
				
				this.view= "/admin/ad_qna_content.jsp";
				this.isRedirect = false;
				
			}else if (command.equals("/controller/admin/AdQuestionModifyServlet.do")) {
		
				AdQuestionModifyServlet aqms = new AdQuestionModifyServlet();
				aqms.doPost(request, response);
				
				this.view = "/admin/ad_qna_modify.jsp";
				this.isRedirect = false;
				
			}else if (command.equals("/controller/admin/AdQuestionModifyActionServlet.do")) {
		
				AdQuestionModifyActionServlet aqas = new AdQuestionModifyActionServlet();
				aqas.doPost(request, response);
				
				this.view = "/controller/admin/AdQuestionListServlet.do";
				this.isRedirect = true;
			}
		    
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
