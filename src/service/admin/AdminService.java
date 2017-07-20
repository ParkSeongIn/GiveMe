package service.admin;

import java.util.ArrayList;

import service.allboard.AllBoardVo;
import service.cashdonation.CashDonationVo;
import service.member.MemberVo;
import service.question.QuestionVo;

public interface AdminService {

    ArrayList<MemberVo> getMemberList(String keyField, String keyWord, int page_num);
    int deleteMember();
    CashDonationVo getCashDonation();
    int insertAllBoard(AllBoardVo avo);
    AllBoardVo AllBoardmodifySe(int abidx);
    int modifyAllBoard(AllBoardVo avo, int abidx);
    int deleteAllBoard(int abidx);
    int insertDonationList(DonationListVo vo);
    DonationListVo getDonationList(int dlidx);
    ArrayList<DonationListVo> getDonationListLine(String keyField, String keyWord,int page_num);
    DonationListVo modifyDonationList(int dlidx);
    int modifyDonationWrite(DonationListVo vo);
    int deleteDonationList(int dlidx);
    int getPaging();
    int getPaging1();
    int getPagingM();
    // 관리자 table_Question
 	ArrayList<QuestionVo> getAdQuestionList(String keyField, String keyWord, int page_num);
 	QuestionVo getAdQuestion(int qidx);
 	int modifyWriteAdQuestion(QuestionVo qv);
}


