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
		String	sql = "select * from (select * from (select rownum rn, AAA.* from (select  AA.*,BB.dlgroup1, BB.dlgroup2,BB.dlplace from ( select tc.cidx,tm.midx, tm.mname, tc.cway, tc.cmoney, ta.apdbdate, tc.cstate, tc.capst, tc.dlidx, ta.apidx from table_member tm, table_cashdonation tc, table_allpay ta where tm.midx = tc.midx and tm.midx = ta.midx)AA, table_donationlist BB  where  AA.dlidx = BB.dlidx order by AA.cidx desc)AAA) where  rn <=20) where rn >=1"; 
			pstmt = con.prepareStatement(sql); 
			rs = pstmt.executeQuery(); 
			//System.out.println(sql);
			while(rs.next()) { 
				
//				System.out.println("ddd:"+rs.getInt("cidx"));
//				System.out.println("ddds:"+rs.getTimestamp("apdbdate"));
//				System.out.println("bbb:"+rs.getInt("midx"));
//				System.out.println("ccc:"+rs.getString("mname"));
//				System.out.println("ddd:"+rs.getString("cway"));
//				System.out.println("eee:"+rs.getInt("cmoney"));
//				System.out.println("fff:"+rs.getString("cstate"));
//				System.out.println("ggg:"+rs.getInt("dlidx"));
//				System.out.println("hhh:"+rs.getInt("apidx"));
//				System.out.println("iii:"+rs.getString("dlgroup1"));
//				System.out.println("jjj:"+rs.getString("dlgroup2"));
//				System.out.println("kkk:"+rs.getString("dlplace"));
				
			CashDonationListVo vo = new CashDonationListVo(); 
			
			vo.setCidx(rs.getInt("cidx"));
			vo.setMidx(rs.getInt("midx")); 
			vo.setMname(rs.getString("mname"));
			vo.setCway(rs.getString("cway"));
			vo.setCmoney(rs.getInt("cmoney"));
			vo.setApdbdate(rs.getTimestamp("apdbdate"));	
			vo.setCstate(rs.getString("cstate")); 
			vo.setCapst(rs.getString("capst"));
			vo.setDlidx(rs.getInt("dlidx")); 
			vo.setApidx(rs.getInt("apidx")); 
			vo.setDlgroup1(rs.getString("dlgroup1"));
			vo.setDlgroup2(rs.getString("dlgroup2"));
			vo.setDlplace(rs.getString("dlplace"));
			
			cdlist.add(vo); 
			}
		}catch(Exception e) { 
			
		}finally { 
			DBClose.close(con,pstmt,rs); 
			}
		return cdlist; 
		}

	@Override
	public ArrayList<CashDonationListVo> getMypageCashDonationList(int midx) {
		Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		ArrayList<CashDonationListVo> mcdlist = new ArrayList<CashDonationListVo>(); 
	//	System.out.println(midx);
		try { 
			String	sql = "select * from (select * from (select rownum rn, AAA.* from (select  AA.*,BB.dlgroup1 from ( select tc.cidx,tm.midx,tc.cway, tc.cmoney, tc.cpay, ta.apdbdate, tc.cstate, tc.capst, tc.dlidx, ta.apidx from table_member tm, table_cashdonation tc, table_allpay ta where tm.midx = tc.midx and tm.midx = ta.midx and tm.midx=?)AA, table_donationlist BB  where  AA.dlidx = BB.dlidx order by AA.cidx desc)AAA) where  rn <=20) where rn >=1";  
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();
		//	System.out.println(sql);
			while(rs.next()) { 
				
//				System.out.println("ddd:"+rs.getInt("midx"));
//				System.out.println("ddds:"+rs.getString("cway"));
//				System.out.println("bbb:"+rs.getInt("cmoney"));
//				System.out.println("ccc:"+rs.getString("cpay"));
//				System.out.println("ddd:"+rs.getTimestamp("apdbdate"));
//				System.out.println("eee:"+rs.getString("cstate"));
//				System.out.println("fff:"+rs.getInt("cidx"));
//				System.out.println("ggg:"+rs.getInt("dlidx"));
//				System.out.println("hhh:"+rs.getInt("apidx"));
//				System.out.println("iii:"+rs.getString("dlgroup1"));
				
			CashDonationListVo vo = new CashDonationListVo(); 
			
			//vo.setRnum(rs.getInt("rnum"));
			vo.setMidx(rs.getInt("midx"));
			vo.setCway(rs.getString("cway"));
			vo.setCmoney(rs.getInt("cmoney"));
			vo.setCpay(rs.getString("cpay"));
			vo.setApdbdate(rs.getTimestamp("apdbdate"));	
			vo.setCstate(rs.getString("cstate")); 
			vo.setCapst(rs.getString("capst"));
			vo.setCidx(rs.getInt("cidx"));
			vo.setDlgroup1(rs.getString("dlgroup1"));
			vo.setDlidx(rs.getInt("dlidx"));
			vo.setApidx(rs.getInt("apidx"));
	
			mcdlist.add(vo); 
			}
		}catch(Exception e) { 
			
		}finally { 
			DBClose.close(con,pstmt,rs); 
			}
		return mcdlist; 
		}
	
	@Override
	public int insertCashDonation(CashDonationVo vo) {
		Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null; 
		
//		System.out.println("cway"+vo.getCway());
//		System.out.println("cmoney"+vo.getCmoney());
//		System.out.println("creceipt"+vo.getCreceipt());
//		System.out.println("cpaydate1"+vo.getCpaydate1());
//		System.out.println("cstate"+vo.getCstate());
//		System.out.println("cpoint"+vo.getCpoint());
//		System.out.println("midx"+vo.getMidx());
//		System.out.println("dlidx"+vo.getDlidx());
//		System.out.println("cpay"+vo.getCpay());
//		System.out.println("capst"+vo.getCapst());
		
		int row = 0;
		try { sql = "insert into table_cashdonation values(seq_cidx.nextval,?,?,?,?,sysdate,?,?,sysdate,?,?,?,?)"; 
		//			insert into table_cashdonation values(seq_cidx.nextval,'P',20000,'Y',10,sysdate,'S',1000,sysdate,4,4,'C', 'Y'); 
		
		pstmt = con.prepareStatement(sql); 
		//pstmt.setInt(1, vo.getMidx());
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
		Connection con = dbconnect.getConnection(); 
		return null;
	}

	@Override
	public int getPaging() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CashDonationConVo getReceipt(int midx, int apidx) {
		Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		CashDonationConVo rcv = null; 
		
		try { 
			sql = "select  AA.*,BB.dlgroup1, BB.dlgroup2,BB.dlplace from (select tm.midx, tm.mname, tm.mpost, tm.maddr1, tm.maddr2, tm.mbirth, tc.cmoney, ta.apdbdate, tc.dlidx, ta.apidx from table_member tm, table_cashdonation tc, table_allpay ta  where tm.midx = tc.midx and tm.midx = ta.midx and tm.midx=? and ta.apidx=?)AA, table_donationlist BB where  AA.dlidx = BB.dlidx";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, midx);
			pstmt.setInt(2, apidx);
			rs = pstmt.executeQuery(); 
			//System.out.println(sql);
			while(rs.next()) { 
				
				//System.out.println();
				rcv = new CashDonationConVo();
				
			//	rcv.setMidx(rs.getInt("midx"));
				rcv.setMname(rs.getString("mname"));
				rcv.setMpost(rs.getInt("mpost"));
				rcv.setMaddr1(rs.getString("maddr1"));
				rcv.setMaddr2(rs.getString("maddr2"));
				rcv.setMbirth(rs.getInt("mbirth"));
				rcv.setCmoney(rs.getInt("cmoney"));
				rcv.setApdbdate(rs.getTimestamp("apdbdate"));
				rcv.setDlidx(rs.getInt("dlidx"));
				rcv.setApidx(rs.getInt("apidx"));
				rcv.setDlgroup1(rs.getString("dlgroup1"));
				rcv.setDlgroup2(rs.getString("dlgroup2"));
				rcv.setDlplace(rs.getString("dlplace"));
				
	//			rcv.setCway(rs.getString("cway"));
	//			rcv.setCpaydate1(rs.getString("cpaydate1"));
				
				
			} 
		}catch(Exception e) {
			//	System.out.println(e.getMessage());
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
			sql = "select cidx, cway, cmoney, creceipt, cpaydate1, cpaydate2, cpoint, cdbdate, midx, dlidx, cpay, capst from table_cashdonation where cidx=?";
				pstmt = con.prepareStatement(sql); 	
				pstmt.setInt(1, cidx);
				rs = pstmt.executeQuery(); 
				System.out.println(sql);
				while(rs.next()) {
					cv= new CashDonationVo();
					
					System.out.println("cway :"+rs.getString("cway"));
					System.out.println("cmoney :"+rs.getString("cmoney"));
					System.out.println("creceipt :"+rs.getString("creceipt"));
					System.out.println("cpaydate1 :"+rs.getString("cpaydate1"));
					System.out.println("cpaydate2 :"+rs.getString("cpaydate2"));
					System.out.println("cpoint :"+rs.getString("cpoint"));
					System.out.println("cdbdate :"+rs.getString("cdbdate"));
					System.out.println("midx :"+rs.getString("midx"));
					System.out.println("dlidx :"+rs.getString("dlidx"));
					System.out.println("cpay :"+rs.getString("cpay"));
					System.out.println("capst :"+rs.getString("capst"));
					
					cv.setCway(rs.getString("cway"));
					cv.setCmoney(rs.getInt("cmoney"));
					cv.setCreceipt(rs.getString("creceipt"));
					cv.setCpaydate1(rs.getInt("cpaydate1"));
					cv.setCpaydate2(rs.getDate("cpaydate2"));
					cv.setCpoint(rs.getInt("cpoint"));
					cv.setCdbdate(rs.getTimestamp("cdbdate"));
					cv.setMidx(rs.getInt("midx"));
					cv.setDlidx(rs.getInt("dlidx"));
					cv.setCpay(rs.getString("cpay"));
					cv.setCapst(rs.getString("capst"));	
				}
		}catch(Exception e) {
			
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return cv;
	}


//	public String pasing(String data) { 
//		try { 
//			data = new String(data.getBytes("8859_1"), "UTF-8"); 
//			}catch (Exception e){
//				
//			}
//		return data; 
//		}


	}

	

