package service.cashdonation;

import java.util.ArrayList;

public interface CashDonationService {
	ArrayList<CashDonationListVo> getCashDonationList();
	CashDonationVo modifyCashDonationState();
	int getPaging();
//	CashDonationVo getReceipt();
	int insertCashDonation(CashDonationVo vo);
//	int insertCashDonation();
//	ArrayList<CashDonationListVo> getMypageCashDonationList();
//	CashDonationConVo getReceipt(int apidx);
	ArrayList<CashDonationListVo> getMypageCashDonationList(int midx);
	CashDonationConVo getReceipt(int midx, int apidx);
	CashDonationVo getCashDonationConfirm(int cidx);
}
