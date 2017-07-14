package service.cashdonation;

import java.sql.*;
import java.util.ArrayList;

import common.DBClose;
import common.DBConnect;
import common.Values;

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
		ArrayList<CashDonationVo> clist = new ArrayList<CashDonationVo>(); 
		try { 
			String	sql = "select cidx, cmoney, cpay, cstate, cpoint "
				    	+ "from table_cashdonation ";
			pstmt = con.prepareStatement(sql); 
			rs = pstmt.executeQuery();
			while(rs.next()) { 
				
			CashDonationVo cv = new CashDonationVo(); 
			
			cv.setCidx(rs.getInt("cidx"));
			cv.setCpay(rs.getString("cpay"));
			cv.setCmoney(rs.getInt("cmoney"));
			cv.setCstate(rs.getString("cstate"));
			cv.setCpoint(rs.getInt("cpoint"));
			clist.add(cv); 
			}
		}catch(Exception e) { 
			
		}finally { 
			DBClose.close(con,pstmt,rs); 
			}
		return clist; 
		}

	@Override
	public ArrayList<CashDonationVo> getMypageCashDonationList(int midx) {
		Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		ArrayList<CashDonationVo> clist = new ArrayList<CashDonationVo>(); 
		try { 
			String	sql = "select c.cidx, c.cway, c.cmoney, c.cpay, c.creceipt, c.cstate, c.cpaydate1, c.cpaydate2, c.cpoint "
					    + "from table_cashdonation c, table_member m "
					    + "where c.midx = m.midx "
					    + "and m.midx=? ";
			
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();
		

			while(rs.next()){	
			CashDonationVo cv = new CashDonationVo(); 
			cv.setCidx(rs.getInt("cidx"));
			cv.setCway(rs.getString("cway"));
			cv.setCmoney(rs.getInt("cmoney"));
			cv.setCpay(rs.getString("cpay"));
			cv.setCreceipt(rs.getString("creceipt"));
			cv.setCstate(rs.getString("cstate"));
			cv.setCpaydate1(rs.getString("cpaydate1"));
			cv.setCpaydate2(rs.getDate("cpaydate2"));
			cv.setCpoint(rs.getInt("cpoint"));
			clist.add(cv);
			}
		}catch(Exception e) { 
			
		}finally { 
			DBClose.close(con,pstmt,rs); 
			}
		return clist; 
		}
	
	@Override
	public int insertCashDonation(CashDonationVo cv) {
		Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null; 
		
		int row = 0;
		try { 
			sql = "insert into table_cashdonation "
				+ "(cidx, cway, cmoney, creceipt, cpaydate1, cpaydate2, cstate, cpoint, cdbdate, midx, cpay)"
				 + "values(seq_cidx.nextval,?,?,?,?,sysdate,?,?,sysdate,?,?)"; 
		
		pstmt = con.prepareStatement(sql); 
		pstmt.setString(1, cv.getCway());
		pstmt.setInt(2, cv.getCmoney()); 
		pstmt.setString(3, cv.getCreceipt());
		pstmt.setString(4, cv.getCpaydate1());
		pstmt.setString(5, Values.Result);
		pstmt.setInt(6, cv.getCpoint());
		pstmt.setInt(7, cv.getMidx());
		pstmt.setString(8, cv.getCpay());
			
		row = pstmt.executeUpdate(); 
		
		}catch(Exception e) { 
			e.printStackTrace();
			
		}finally { 
			DBClose.close(con,pstmt);
			} 
			 return row;
		} 


	@Override
	public int modifyCashDonationState(int cidx) {
		// TODO Auto-generated method stub
		Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null;
		int row = 0;
		
		try{
			sql = "update table_cashdonation set cstate='후원취소' where cidx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cidx);
			row = pstmt.executeUpdate();
					
		}catch(Exception e){
			
		}finally{
			DBClose.close(con,pstmt);
		}
		return row;
	}

	@Override
	public int getPaging() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public CashDonationVo getReceipt(int midx, int cidx) {
		Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		CashDonationVo rcv = null; 
		
		try { 
			sql = "select tc.cidx, tc.cmoney, tc.cpaydate2, tc.cway "
				 + "from table_cashdonation tc, table_member tm "
				 + "where tc.midx = tm.midx and tc.cidx=?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, cidx);
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) { 
				rcv = new CashDonationVo();
				rcv.setCidx(rs.getInt("cidx"));
				rcv.setCpaydate2(rs.getDate("cpaydate2"));
				rcv.setCmoney(rs.getInt("cmoney"));
				rcv.setCway(rs.getString("cway"));
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally { 
			DBClose.close(con,pstmt,rs);
		} 
	return rcv;
	}

	public CashDonationVo getCashDonationConfirm(int cidx) {
		Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		CashDonationVo cv = null; 
		
		try {
			sql = "select cidx, cway, cmoney, creceipt, cpaydate1, cpaydate2, cpoint, cdbdate,cpay, capst from table_cashdonation where cidx=?";
				pstmt = con.prepareStatement(sql); 	
				pstmt.setInt(1, cidx);
				rs = pstmt.executeQuery(); 
				while(rs.next()) {
					cv= new CashDonationVo();
					
					cv.setCway(rs.getString("cway"));
					cv.setCmoney(rs.getInt("cmoney"));
					cv.setCreceipt(rs.getString("creceipt"));
					cv.setCpaydate1(rs.getString("cpaydate1"));
					cv.setCpaydate2(rs.getDate("cpaydate2"));
					cv.setCpoint(rs.getInt("cpoint"));
					cv.setCdbdate(rs.getTimestamp("cdbdate"));
					cv.setCpay(rs.getString("cpay"));
				}
		}catch(Exception e) {
			
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return cv;
	}




	}

	

