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
	public ArrayList<CashDonationListVo> getCashDonationList() {
		Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		ArrayList<CashDonationListVo> cdlist = new ArrayList<CashDonationListVo>(); 
		try { 
		String	sql = "select * from "
				+ "(select * from "
				+ "(select rownum rn, AAA.* from "
				+ "(select  AA.*,BB.dlgroup1, BB.dlgroup2,BB.dlplace from "
				+ "( select tc.cidx,tm.midx, tm.mname, tc.cway, tc.cmoney, ta.apdbdate, tc.cstate, tc.capst, tc.dlidx, ta.apidx"
				+ "	from table_member tm, "
				+ "table_cashdonation tc, "
				+ "table_allpay ta "
				+ "where tm.midx = tc.midx "
				+ "and tm.midx = ta.midx)AA, "
				+ "table_donationlist BB  "
				+ "where  AA.dlidx = BB.dlidx"
				+ "order by AA.apidx desc)AAA"
				+ ") "
				+ "where  rn <=20) "
				+ "where rn >=1"; 
			pstmt = con.prepareStatement(sql); 
			rs = pstmt.executeQuery(); 
			
			while(rs.next()) { 
			CashDonationListVo vo = new CashDonationListVo(); 
			
			vo.setCidx(rs.getInt(2));
			vo.setMidx(rs.getInt(3)); 
			vo.setMname(rs.getString(3));
			vo.setCway(rs.getString(4));
			vo.setDlgroup1(rs.getString(5));
			vo.setDlgroup2(rs.getString(6));
			vo.setDlplace(rs.getString(7)); 
			vo.setCmoney(rs.getInt(8));
			vo.setApdbdate(rs.getTimestamp(9));
			vo.setCstate(rs.getString(10)); 	
			vo.setCapst(rs.getString(11)); 	
	
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
		
		System.out.println(vo.getCmoney());
		System.out.println(vo.getCway());
		System.out.println(vo.getCreceipt());
		System.out.println(vo.getCpaydate1());
		System.out.println(vo.getCstate());
		System.out.println(vo.getCpoint());
		System.out.println(vo.getMidx());
		System.out.println(vo.getDlidx());
		System.out.println(vo.getCpay());
		System.out.println(vo.getCapst());
		
		int row = 0;
		try { sql = "insert into table_cashdonation values(seq_cidx.nextval,?,?,?,?,sysdate,?,?,sysdate,?,?,?,?)"; 
		//			insert into table_cashdonation values(seq_cidx.nextval,'P',20000,'Y',10,sysdate,'S',1000,sysdate,4,4,'C', 'Y'); 
		
		pstmt = con.prepareStatement(sql); 
		pstmt.setString(1, vo.getCway());
		pstmt.setInt(2, vo.getCmoney()); 
		pstmt.setString(3, vo.getCreceipt()); 
		pstmt.setInt(4, vo.getCpaydate1()); 
		pstmt.setString(5, vo.getCstate());
		pstmt.setInt(6, vo.getCpoint());
		pstmt.setInt(7, vo.getMidx());
		pstmt.setInt(8, vo.getDlidx());
		pstmt.setString(9, vo.getCpay()); 
		pstmt.setString(10, vo.getCapst()); 		
		row = pstmt.executeUpdate(); 
		}catch(Exception e) { 
			e.printStackTrace();
			
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
