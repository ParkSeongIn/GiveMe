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
		String	sql = "select * from "
				+ "(select rownum rnum,tm.midx,tc.cway, tc.cmoney,tc.cstate,tc.capst from table_member tm,table_cashdonation tc"
				+ " where tm.midx = tc.midx order by tc.cidx desc) where rnum <= 20 and rnum >= 1 "; 
			pstmt = con.prepareStatement(sql); 
			rs = pstmt.executeQuery(); 
			
			while(rs.next()) { 
			CashDonationVo vo = new CashDonationVo(); 
			
			vo.setCidx(rs.getInt(1));
			vo.setMidx(rs.getInt(2)); 
			vo.setCway(rs.getString(3)); 	
			vo.setCmoney(rs.getInt(4)); 		
			vo.setCstate(rs.getString(5)); 	
			vo.setCapst(rs.getString(6)); 	
	
			cdlist.add(vo); 
			}
		}catch(Exception e) { 
			
		}finally { 
			DBClose.close(con,pstmt,rs); 
			}
		return cdlist; 
		}

	
	
	@Override
	public int insertCashDonation(CashDonationVo vo) {
		Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null; 
		int row = 0;
		try { sql = "insert into table_cashdonation values(seq_cidx.nextval,?,?,?,?,sysdate,?,?,sysdate,?,?,?,?); "; 
		pstmt = con.prepareStatement(sql); 
		pstmt.setString(1, pasing(vo.getCway()));
		pstmt.setInt(2, vo.getCmoney()); 
		pstmt.setString(3, pasing(vo.getCreceipt())); 
		pstmt.setString(4, pasing(vo.getCpaydate1())); 
		pstmt.setString(5, pasing(vo.getCstate()));
		pstmt.setInt(6, vo.getCpoint());
		pstmt.setInt(7, vo.getMidx());
		pstmt.setInt(8, vo.getDlidx());
		pstmt.setString(9, pasing(vo.getCpay())); 
		pstmt.setString(10, pasing(vo.getCapst())); 		
		row = pstmt.executeUpdate(); 
		}catch(Exception e) { 
			
		}finally { 
			DBClose.close(con,pstmt);
			} 
			 return row;
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


	public String pasing(String data) { 
		try { 
			data = new String(data.getBytes("8859_1"), "UTF-8"); 
			}catch (Exception e){
				
			}
		return data; 
		}

	
}
