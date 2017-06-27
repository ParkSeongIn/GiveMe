package service.cashdonation;

import java.util.ArrayList;

public interface CashDonationService {
	ArrayList<CashDonationListVo> getCashDonationList();
	CashDonationVo modifyCashDonationState();
	int getPaging();
	CashDonationVo getReceipt();
	int insertCashDonation(CashDonationVo vo);
//	int insertCashDonation();
}
