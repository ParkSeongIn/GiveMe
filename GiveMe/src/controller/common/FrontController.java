package controller.common;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.admin.MemberListServlet;
import controller.member.MemberCheckLoginActionServlet;
import controller.member.MemberCheckLoginServlet;
import controller.member.MemberCheckLogoutServlet;
import controller.member.MemberCheckidServlet;
import controller.member.MemberContentServlet;
import controller.member.MemberFindidServlet;
import controller.member.MemberInsertActionServlet;
import controller.member.MemberInsertServlet;
import controller.member.MemberModifyActServlet;
import controller.member.MemberModifyServlet;
import controller.admin.CashDonationContentServlet;
import controller.cashdonation.CashDonationConfirmServlet;
import controller.cashdonation.CashDonationInsertActionServlet;
import controller.cashdonation.CashDonationInsertServlet;
import controller.cashdonation.CashDonationListServlet;
import controller.cashdonation.CashDonationReceiptServlet;
import controller.member.MypageCashDonationListServlet;

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
		    if(command.equals("/MemberListServlet.do")){	//boolean = true;
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
		    	
		    }else if(command.equals("/MemberContentServlet.do")){
		    	MemberContentServlet mcs = new MemberContentServlet();
		    	mcs.doGet(request, response);
			
		    	this.view="/ad_member_content.jsp";
		    	this.isRedirect=false;
			
		    }else if(command.equals("/MemberModifyServlet.do")){
			MemberModifyServlet mms = new MemberModifyServlet();
			mms.doGet(request, response);
			
			this.view="/member_modify.jsp";
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
		    }
		    else if(command.equals("/controller/MemberCheckLoginActionServlet.do")){
		    	MemberCheckLoginActionServlet mclas = new MemberCheckLoginActionServlet();
		    	mclas.doPost(request, response);
		    	
		    	this.view="/main.jsp";
		    	this.isRedirect=true;
			
		    }else if(command.equals("/MemberFindidServlet.do")){
		    	MemberFindidServlet mfs = new MemberFindidServlet();
		    	mfs.doGet(request, response);
			
		    	this.view="/login.jsp";
		    	this.isRedirect=false;
		   
		    }else if(command.equals("/controller/MemberCheckidServlet.do")){
		    	MemberCheckidServlet mcs = new MemberCheckidServlet();
		    	mcs.doGet(request, response);
		    	
		    	this.view="/member/check_id.jsp";
		    	this.isRedirect=false;
		    
		    }else if(command.equals("/controller/MemberCheckLogoutServlet.do")){
		    	MemberCheckLogoutServlet mcls = new MemberCheckLogoutServlet();
		    	mcls.doPost(request, response);
		    	
		    	this.view="/main.jsp";
		    	this.isRedirect=true;
		    
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
				
			}else if (command.equals("/CashDonationInsertServlet.do")) {
				System.out.println("TestINSERT");
				CashDonationInsertServlet cdis = new CashDonationInsertServlet();
				cdis.doPost(request, response);
				
				this.view = "/cash_insert.jsp";
				this.isRedirect = false;
				
			}else if (command.equals("/controller/cashdonation/CashDonationConfirmServlet.do")) {
				System.out.println("TestCONFIRM");
				CashDonationConfirmServlet cdcs = new CashDonationConfirmServlet();
				cdcs.doPost(request, response);
				
				this.view = "/donation/cash_confirm.jsp";
				this.isRedirect = false;
				
			}else if (command.equals("/controller/cashdonation/CashDonationInsertActionServlet.do")) {
				System.out.println("TestINSERTACTION");
				CashDonationInsertActionServlet cdas = new CashDonationInsertActionServlet();
				cdas.doPost(request, response);
				
				this.view = "/controller/cashdonation/CashDonationResultServlet.do";
				this.isRedirect = true;
				
			}else if (command.equals("/controller/cashdonation/CashDonationResultServlet.do")) {
				System.out.println("TestRESULT");
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
		    
			}if(this.isRedirect){
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
