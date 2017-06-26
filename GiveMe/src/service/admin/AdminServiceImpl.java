package service.admin;

import java.sql.*; 
import java.util.ArrayList;

import Model1.DBClose;
import common.DBConnect;
import service.allboard.AllBoardVo;
import service.allpay.AllPayVo;
import service.cashdonation.CashDonationVo;
import service.member.MemberVo; 


public class AdminServiceImpl implements AdminService{
    
    DBConnect dbconnect = null; //dbconnect ���� �ʱ�ȭ��.
    String sql="";	//sql ���� �������� ����.
    
    public AdminServiceImpl(){	//������(Ŭ������� �����ϹǷ�)
	dbconnect = new DBConnect();	//dbconnect ��ü�� ���� dbconnect ã�� ���� ������ ��ü�� �����ؼ� ����ϰڴٴ� �� 
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
    public CashDonationVo getCashDonation() {
    	Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		CashDonationVo cv = null; 
		MemberVo mv = null;
		DonationListVo dv = null;
		AllPayVo pv = null;
		try { 
			sql = "select tm.midx, tm.mname, tc.cway, tc.cpaydate1, td.dlgroup1, td.dlgroup2, td.dlplace, tc.cmoney, ta.apdbdate, ta.apstate, tc.cpay "
					+ "from table_member tm, table_cashdonation tc, table_allpay ta, table_donationlist td where td.dlidx = tc.dlidx and ta.cidx = tc.cidx and ta.midx = tm.midx and ta.apidx = ?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery(); 
			while(rs.next()) { 
				cv = new CashDonationVo();	
				mv.setMname(rs.getString("mname"));
				cv.setCway(rs.getString("cway"));
				cv.setCpaydate1(rs.getString("cpaydate1"));
				dv.setDlgroup1(rs.getString("dlgroup1"));
				dv.setDlgroup2(rs.getString("dlgroup2"));
				dv.setDlplace(rs.getString("dlplace"));
				cv.setCmoney(rs.getInt("cmoney"));
	
			} 
		}catch(Exception e) {
				
		}finally { 
			DBClose.close(con,pstmt,rs);
		} 
	return mv;
	} 
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
