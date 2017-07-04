package service.admin;

import java.sql.*; 
import java.util.ArrayList;

import common.DBConnect;
import common.DBClose;
import service.allboard.AllBoardVo;
import service.allpay.AllPayVo;
import service.cashdonation.CashDonationConVo;
import service.cashdonation.CashDonationVo;
import service.member.MemberVo; 


public class AdminServiceImpl implements AdminService{
    
    DBConnect dbconnect = null;
    String sql="";	
    
    public AdminServiceImpl(){	
	dbconnect = new DBConnect();	
    }

    
    @Override
    public ArrayList<MemberVo> getMemberList() {
	// TODO Auto-generated method stub
	
	
	return null;
    }

    @Override
    public int deleteMember() {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public CashDonationConVo getCashDonation(int cidx) {
    	Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		CashDonationConVo gcv = null; 

		try { 
			sql = "select tm.midx, tm.mname, tc.cway, tc.cpaydate1, td.dlgroup1, td.dlgroup2, td.dlplace, tc.cmoney, ta.apdbdate, ta.apstate, tc.cpay "
					+ "from table_member tm, table_cashdonation tc, table_allpay ta, table_donationlist td where td.dlidx = tc.dlidx and ta.cidx = tc.cidx and ta.midx = tm.midx and ta.apidx = ?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, cidx);
			rs = pstmt.executeQuery(); 
			if(rs.next()) { 
				gcv = new CashDonationConVo();
				gcv.setMidx(rs.getInt("midx"));
				gcv.setMname(rs.getString("mname"));
				gcv.setCway(rs.getString("cway"));
				gcv.setCpaydate1(rs.getString("cpaydate1"));
				gcv.setDlgroup1(rs.getString("dlgroup1"));
				gcv.setDlgroup2(rs.getString("dlgroup2"));
				gcv.setDlplace(rs.getString("dlplace"));
				gcv.setCmoney(rs.getInt("cmoney"));
				gcv.setApdbdate(rs.getTimestamp("apdbdate"));
				gcv.setApstate(rs.getString("apstate"));
				gcv.setCpay(rs.getString("cpay"));
				
			} 
		}catch(Exception e) {
				System.out.println(e.getMessage());
		}finally { 
			DBClose.close(con,pstmt,rs);
		} 
	return gcv;
	} 
 

    @Override
    public int insertAllBoard() {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public AllBoardVo modifyAllBoard() {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public int deleteAllBoard() {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public int insertDonationList() {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public DonationListVo getDonationList() {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public ArrayList<DonationListVo> getDonationListLine() {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public DonationListVo modifyDonationList() {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public int deleteDonationList() {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public int getPaging() {
	// TODO Auto-generated method stub
	return 0;
    }
    
    
    

}
