package service.admin;

import java.util.ArrayList;

import service.allboard.AllBoardVo;
import service.cashdonation.CashDonationVo;
import service.member.MemberVo;

public interface AdminService {

    ArrayList<MemberVo> getMemberList();
    int deleteMember();
    CashDonationVo getCashDonation();
    int insertAllBoard(AllBoardVo avo);
    AllBoardVo AllBoardmodifySe(int abidx);
    int modifyAllBoard(AllBoardVo avo, int abidx);
    int deleteAllBoard(int abidx);
    int insertDonationList(DonationListVo vo);
    DonationListVo getDonationList(int dlidx);
    ArrayList<DonationListVo> getDonationListLine(int midx);
    DonationListVo modifyDonationList(int dlidx);
    int modifyDonationWrite(DonationListVo vo);
    int deleteDonationList(int dlidx);
    int getPaging();
    
}

