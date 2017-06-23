package service.cashdonation;

import java.sql.*;
import java.util.ArrayList;

import common.DBClose;
import common.DBConnect;

public class CashDonationServiceImpl implements CashDonationService {
	
	DBConnect dbconnect = null; 
	String sql="";
	
	public CashDonationServiceImpl() { 
		dbconnect = new DBConnect();
		} 	
	
	@Override
	public ArrayList<CashDonationVo> getCashDonationList() {
		Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		ArrayList<CashDonationVo> cdlist = new ArrayList<CashDonationVo>(); 
		try { 
		String	sql = "select * from (select rownum rnum,tm.midx,tc.cway, tc.cmoney,tc.cstate,tc.capst "
				+ "from table_member tm,table_cashdonation tc"
				+ "where tm.midx = tc.midx order by tc.cidx desc)"
				+ "where rnum <= 20 and rnum >= 1; "; 
			pstmt = con.prepareStatement(sql); 
			rs = pstmt.executeQuery(); 
			
			while(rs.next()) { 
			CashDonationVo vo = new CashDonationVo(); 
			
			vo.setMidx(rs.getInt(1)); 
			vo.setCway(rs.getString(3)); 	
			vo.setCmoney(rs.getInt(7)); 		
			vo.setCstate(rs.getString(9)); 	
			vo.setCapst(rs.getString(10)); 	
	
			cdlist.add(vo); 
			}
		}catch(Exception e) { 
			
		}finally { 
			DBClose.close(con,pstmt,rs); 
			}
		return cdlist; 
		}

	@Override
	public int insertCashDonation() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CashDonationVo modifyCashDonationState() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getPaging() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CashDonationVo getReceipt() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertCashDonation(CashDonationVo vo) {
		// TODO Auto-generated method stub
		return 0;
	} 

}
