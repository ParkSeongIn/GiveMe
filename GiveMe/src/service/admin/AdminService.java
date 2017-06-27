package service.admin;

import java.util.ArrayList;

import service.allboard.AllBoardVo;
import service.cashdonation.CashDonationVo;
import service.member.MemberVo;

public interface AdminService {

    ArrayList<MemberVo> getMemberList();
    int deleteMember();
 //   CashDonationVo getCashDonation();
    int insertAllBoard();
    AllBoardVo modifyAllBoard();
    int deleteAllBoard();
    int insertDonationList();
    DonationListVo getDonationList();
    ArrayList<DonationListVo> getDonationListLine();
    DonationListVo modifyDonationList();
    int deleteDonationList();
    int getPaging();
	CashDonationConVo getCashDonation(int a);
    
}
