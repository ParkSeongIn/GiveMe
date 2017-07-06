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
import controller.allboard.*;
import controller.talentboard.*;
import controller.admin.MemberListServlet;
import controller.admin.TalentBoardAdContentServlet;
import controller.admin.TalentBoardAdListServlet;
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
import controller.admin.AllBoardDeleteServlet;
import controller.admin.AllBoardIfDeleteServlet;
import controller.admin.AllBoardIfModifyActionServlet;
import controller.admin.AllBoardIfModifyServlet;
import controller.admin.AllBoardIfWriteActionServlet;
import controller.admin.AllBoardIfWriteServlet;
import controller.admin.AllBoardModifyActionServlet;
import controller.admin.AllBoardModifyServlet;
import controller.admin.AllBoardWriteActionServlet;
import controller.admin.AllBoardWriteServlet;
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
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		    }
		    else if(command.equals("/controller/MemberCheckLoginActionServlet.do")){
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
				System.out.println("TestINSERT");
				CashDonationInsertServlet cdis = new CashDonationInsertServlet();
				cdis.doPost(request, response);
				
				this.view = "/donation/cash_insert.jsp";
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
			}else if(command.equals("/controller/AllBoardDonationSearchServlet.do")){ // 기부처 검색
				AllBoardDonationSearchServlet abdss = new AllBoardDonationSearchServlet();
				abdss.doGet(request,response);
				
				this.view = "/community/search_list.jsp";
				this.isRedirect = false;
			} else if(command.equals("/controller/AllBoardListServlet.do")){ // 기부동향 게시판 리스트 
				
				AllBoardListServlet als = new AllBoardListServlet();
				als.doGet(request, response);
				
				this.view = "/community/news_list.jsp";
				this.isRedirect = false;		
					
			} else if(command.equals("/controller/AllBoardIfListServlet.do")){ // 공지사항 게시판 리스트

				AllBoardIfListServlet ails = new AllBoardIfListServlet();
				ails.doGet(request, response);
				
				this.view = "/intro/notice_list.jsp";
				this.isRedirect = false;		
			
			} else if (command.equals("/controller/AllBoardContentServlet.do")){ // 기부동향 content

				AllBoardContentServlet acs = new AllBoardContentServlet();  
				acs.doGet(request, response);  
				
				this.view = "/community/news_content.jsp";  
				this.isRedirect = false;
				
			} else if (command.equals("/controller/AllBoardIfContentServlet.do")){ // 공지사항 content

				AllBoardIfConTentServlet aics = new AllBoardIfConTentServlet();  
				aics.doGet(request, response);  
				
				this.view = "/intro/notice_content.jsp";  
				this.isRedirect = false;
				
			} else if (command.equals("/controller/AllBoardWriteServlet.do")){ // 기부동향 write 페이지

				AllBoardWriteServlet abw = new AllBoardWriteServlet();
				abw.doGet(request, response);
				
				this.view = "/admin/ad_news_write.jsp";
				this.isRedirect = false;
				
			} else if (command.equals("/controller/AllBoardIfWriteServlet.do")){ // 공지사항 write 페이지

				AllBoardIfWriteServlet aibw = new AllBoardIfWriteServlet();
				aibw.doGet(request, response);

				this.view = "/admin/ad_notice_write.jsp";
				this.isRedirect = false;
				
			} else if (command.equals("/controller/AllBoardWriteActionServlet.do")){ // 기부동향 글 등록

				AllBoardWriteActionServlet abwa = new AllBoardWriteActionServlet();
				abwa.doPost(request, response);
				
				this.view = "/controller/AllBoardListServlet.do?abtype=N";
				this.isRedirect = true;
				
				
			} else if (command.equals("/controller/AllBoardIfWriteActionServlet.do")){ // 공지사항 글 등록

				AllBoardIfWriteActionServlet abiwa = new AllBoardIfWriteActionServlet();
				abiwa.doPost(request, response);
				
				this.view = "/controller/AllBoardIfListServlet.do?abtype=I";
				this.isRedirect = true;
				
				
			} else if (command.equals("/controller/AllBoardModifyServlet.do")){ // 기부동향 수정 페이지
				
				AllBoardModifyServlet ams = new AllBoardModifyServlet();
				ams.doGet(request, response);
				
				this.view = "/admin/ad_news_modify.jsp";
				this.isRedirect = false;
				
			} else if (command.equals("/controller/AllBoardIfModifyServlet.do")){ // 공지사항 수정 페이지
				
				AllBoardIfModifyServlet aims = new AllBoardIfModifyServlet();
				aims.doGet(request, response);

				this.view = "/admin/ad_notice_modify.jsp";
				this.isRedirect = false;
				
			} else if (command.equals("/controller/AllBoardModifyActionServlet.do")){ // 기부동향 수정

				AllBoardModifyActionServlet abms = new AllBoardModifyActionServlet();  
				abms.doPost(request, response);
				
				this.view = "/controller/AllBoardContentServlet.do?abidx="+request.getParameter("abidx");
				this.isRedirect = true;
				
			} else if (command.equals("/controller/AllBoardIfModifyActionServlet.do")){ // 공지사항 수정

				AllBoardIfModifyActionServlet abims = new AllBoardIfModifyActionServlet();  
				abims.doPost(request, response);
				
				this.view = "/controller/AllBoardIfContentServlet.do?abidx="+request.getParameter("abidx");
				this.isRedirect = true;
				
			} else if (command.equals("/controller/AllBoardDeleteServlet.do")){ // 기부동향 삭제

				AllBoardDeleteServlet ads = new AllBoardDeleteServlet();
				ads.doPost(request, response);
				
				this.view = "/controller/AllBoardIfListServlet.do?abtype=N";
				this.isRedirect = true;
				
			} else if (command.equals("/controller/AllBoardIfDeleteServlet.do")){ // 공지사항 삭제

				AllBoardIfDeleteServlet ads = new AllBoardIfDeleteServlet();
				ads.doPost(request, response);
				
				this.view = "/controller/AllBoardIfListServlet.do?abtype=I";
				this.isRedirect = true;
				
			} else if(command.equals("/controller/TalentBoardListServlet.do")){ // 재능기부 게시판쪽 목록

				TalentBoardListServlet tbs = new TalentBoardListServlet();
				tbs.doGet(request, response);
				
				this.view = "/donation/talent_list.jsp";
				this.isRedirect = false;		
			
			} else if(command.equals("/controller/TalentBoardContentServlet.do")){ // 재능기부 게시판쪽 content

				TalentBoardContentServlet tbcs = new TalentBoardContentServlet();
				tbcs.doGet(request, response);
				
				this.view = "/donation/talent_content.jsp";
				this.isRedirect = false;		
				
			} else if (command.equals("/controller/TalentBoardWriteServlet.do")){ // 재능기부 게시판 글 작성 폼

				TalentBoardWriteServlet tbw = new TalentBoardWriteServlet();
				tbw.doGet(request, response);
				
				this.view = "/donation/talent_write.jsp";
				this.isRedirect = false;
			
			} else if (command.equals("/controller/TalentBoardWriteActionServlet.do")){ // 재능기부 게시판 글 등록

				TalentBoardWriteActionServlet tbwa = new TalentBoardWriteActionServlet();
				tbwa.doPost(request, response);
				
				this.view = "/controller/TalentBoardListServlet.do";
				this.isRedirect = true;

			} else if (command.equals("/controller/TalentBoardModifyServlet.do")){ // 재능기부 게시판 수정 페이지

				TalentBoardModifyServlet tbs = new TalentBoardModifyServlet();
				tbs.doGet(request, response);
				
				this.view = "/donation/talent_modify.jsp";
				this.isRedirect = false;
				
			} else if (command.equals("/controller/TalentBoardModifyActionServlet.do")){ // 재능기부 게시판 수정

				TalentBoardModifyActionServlet tbms = new TalentBoardModifyActionServlet();
				tbms.doPost(request, response);
				
				this.view = "/controller/TalentBoardContentServlet.do?tbidx="+request.getParameter("tbidx");
				this.isRedirect = true;
				
			} else if (command.equals("/controller/TalentBoardDeleteServlet.do")){ // 재능기부 게시판 글 삭제

				TalentBoardDeleteServlet tbds = new TalentBoardDeleteServlet();
				tbds.doPost(request, response);
				
				this.view = "/controller/TalentBoardListServlet.do";
				this.isRedirect = true;
				
			} else if (command.equals("/controller/TalentBoardConfirmServlet.do")){ // 마이페이지 신청자 확인

				TalentBoardConfirmServlet tbcs = new TalentBoardConfirmServlet();
				tbcs.doPost(request, response);
				
				this.view = "/controller/TalentBoardListServlet.do";
				this.isRedirect = true;
				
			} else if (command.equals("/controller/TalentBoardStateServlet.do")){ // 재능기부 게시판 신청하기

				TalentBoardStateServlet tbss = new TalentBoardStateServlet();
				tbss.doPost(request, response);
				
				this.view = "/controller/TalentBoardListServlet.do";
				this.isRedirect = true;
				
			} else if (command.equals("/controller/TalentBoardEtimeServlet.do")){ // 관리자 페이지 매칭 확인 버튼

				TalentBoardEtimeServlet tbes = new TalentBoardEtimeServlet();
				tbes.doPost(request, response);
				
				this.view = "/controller/TalentBoardAdListServlet.do";
				this.isRedirect = true;
				
			} else if (command.equals("/controller/TalentBoardCancleServlet.do")){ // 사용자 신청 취소

				TalentBoardCancleServlet tbcs = new TalentBoardCancleServlet();
				tbcs.doPost(request, response);
				
				this.view = "/controller/TalentBoardListServlet.do";
				this.isRedirect = true;
				
			} else if (command.equals("/controller/TalentBoardAdListServlet.do")){ // 재능기부 관리자 페이지

				TalentBoardAdListServlet tbals = new TalentBoardAdListServlet();
				tbals.doGet(request, response);
				
				this.view = "/admin/ad_talent_list.jsp";
				this.isRedirect = false;
				
			} else if (command.equals("/controller/TalentBoardAdContentServlet.do")){ // 재능기부 관리자 페이지 content

				TalentBoardAdContentServlet tbacs = new TalentBoardAdContentServlet();
				tbacs.doGet(request, response);
				
				this.view = "/admin/ad_talent_content.jsp";
				this.isRedirect = false;
				
			} else if (command.equals("/controller/TalentBoardMyListServlet.do")){ // 재능기부 마이페이지 내역

				TalentBoardMyListServlet tbmls = new TalentBoardMyListServlet();
				tbmls.doGet(request, response);
				
				this.view = "/mypage/talent_detail.jsp";
				this.isRedirect = false;
				
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
