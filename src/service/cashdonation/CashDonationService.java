package service.cashdonation;

import java.util.ArrayList;

public interface CashDonationService {
	ArrayList<CashDonationVo> getCashDonationList();
	int modifyCashDonationState(int cidx);
	int getPaging();
	int insertCashDonation(CashDonationVo vo);
	ArrayList<CashDonationVo> getMypageCashDonationList(int midx);
	CashDonationVo getReceipt(int midx, int cidx);
	CashDonationVo getCashDonationConfirm(int cidx);
}
