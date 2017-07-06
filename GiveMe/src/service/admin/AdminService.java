package service.admin;

import java.util.ArrayList;

import service.allboard.AllBoardVo;
import service.cashdonation.CashDonationConVo;
import service.cashdonation.CashDonationVo;
import service.member.MemberVo;
import service.question.QuestionVo;

public interface AdminService {

// 관리자 table_Member
    ArrayList<MemberVo> getMemberList();
    int deleteMember();

// 관리자 table_Allboard    
    int insertAllBoard();
    AllBoardVo modifyAllBoard();
    int deleteAllBoard();
    
// 관리자 table_DonationList    
    int insertDonationList();
    DonationListVo getDonationList();
    ArrayList<DonationListVo> getDonationListLine();
    DonationListVo modifyDonationList();
    int deleteDonationList();
    int getPaging();

// 관리자 table_CashDonation    
	CashDonationConVo getCashDonation(int a);
	
// 관리자 table_Question
	ArrayList<QuestionVo> getAdQuestionList();
//	int insertAdQuestion(QuestionVo vo);
	QuestionVo getAdQuestion(int qidx);
	int modifyWriteAdQuestion(QuestionVo qv);
    
}
