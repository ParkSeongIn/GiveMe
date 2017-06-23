package service.cashdonation;

import java.util.ArrayList;

public interface CashDonationService {
	ArrayList<CashDonationVo> getCashDonationList();
	int insertCashDonation();
	CashDonationVo modifyCashDonationState();
	int getPaging();
	CashDonationVo getReceipt();
}
