package service.allpay;

import java.util.ArrayList;

public interface AllPayService {
	ArrayList<AllPayVo> getAllPayList();
	int insertAllPay();
	AllPayVo getAllPay();
	AllPayVo modifyAllPayState();
	int getPaging();
	
}
