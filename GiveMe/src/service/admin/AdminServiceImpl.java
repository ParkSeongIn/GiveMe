package service.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBClose;
import common.DBConnect;
import common.Values;
import service.allboard.AllBoardVo;
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
    public CashDonationVo getCashDonation() {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public int insertAllBoard(AllBoardVo avo) {
	// TODO Auto-generated method stub
    	Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null;
		int iab = 0;
		
		try { 
			sql = "insert into table_allboard (abtype,abidx,abtitle,abhit,abwdate,abcontent,abmdate,abdbdate,abdeletest,abimage,midx) "
					+ "values(?,seq_abidx.nextval,?,0,sysdate,?,'',sysdate,'N',?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, avo.getAbtype());
		pstmt.setString(2, avo.getAbtitle());
		pstmt.setString(3, avo.getAbcontent());
		pstmt.setString(4, avo.getAbimage());
		pstmt.setInt(5, avo.getMidx());
		
		iab = pstmt.executeUpdate();
		}catch(Exception e){
		
		}finally {
			DBClose.close(con,pstmt);
		}
		return iab;
    }

    @Override
	public AllBoardVo AllBoardmodifySe(int abidx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AllBoardVo avo = null;
		
		try { 
		String sql = "select tb.abtitle, tm.midx, tb.abwdate, tb.abimage,tb.abcontent "
				+ "from table_allboard tb,table_member tm where tb.midx = tm.midx and tb.abidx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,abidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				avo = new AllBoardVo(); 
			
			avo.setAbtitle(rs.getString(1));
			avo.setMidx(rs.getInt(2));
			avo.setAbwdate(rs.getDate(3));
			avo.setAbimage(rs.getString(4));
			avo.setAbcontent(rs.getString(5));

			}
		}catch(Exception e) { 
			
		}finally {
			DBClose.close(con,pstmt,rs);
			}
			return avo;
		}
    
    
    @Override
    public int modifyAllBoard(AllBoardVo avo, int abidx) {
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		int abu = 0;
		
		try {
			sql ="update table_allboard set abtitle = ? , abcontent = ? , abimage = ? , abmdate=sysdate where abidx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, avo.getAbtitle());
			pstmt.setString(2, avo.getAbcontent());
			pstmt.setString(3, avo.getAbimage());
			pstmt.setInt(4, abidx);
			
			abu = pstmt.executeUpdate();
			
		}	catch(Exception e){
			
		}	finally {
				DBClose.close(con,pstmt);
		}
			return abu;
		}

    @Override
    public int deleteAllBoard(int abidx) {
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		AllBoardVo avo = new AllBoardVo();
    	int dab = 0;
		
    	try {
			sql ="update table_allboard set abdeletest = 'Y' where abidx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, abidx);
			dab = pstmt.executeUpdate();
		
    	}catch(Exception e) { 
			
		}finally { 
			DBClose.close(con,pstmt);
		}
		return dab;
    }

    @Override
    public int insertDonationList(DonationListVo vo) {
	// TODO Auto-generated method stub
    	Connection con = dbconnect.getConnection();
    	PreparedStatement pstmt = null;
    	int row = 0;
    	try{
    		sql = "insert into table_donationlist "
    			 + "(dlidx,dlgroup1,dlgroup2,dlimage,dlplace,dlarea,dlcontent,dldeletest,dlwdate, dlmdate,dldbdate)"	
                 + "values(seq_dlidx.nextval,?,?,?,?,?,?,'N',sysdate,sysdate,sysdate,?)";
    		 
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, vo.getDlgroup1());
    		pstmt.setString(2, vo.getDlgroup2());
    		pstmt.setString(3, vo.getDlimage());
    		pstmt.setString(4, vo.getDlplace());
    		pstmt.setString(5, vo.getDlarea());
    		pstmt.setString(6, vo.getDlcontent());
    		row = pstmt.executeUpdate();
    		
    		
    	}catch(Exception e){
    		
    	}finally {
    		DBClose.close(con,pstmt);
    	}
    	return row;
    }

    @Override
    public DonationListVo getDonationList(int dlidx) {
	// TODO Auto-generated method stub
    	
    	Connection con = dbconnect.getConnection();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	DonationListVo vo = null;
    	
    	try{
    		sql = "select dl.dlidx, dl.dlimage, dl.dlplace, dl.dlarea ,dl.dlcontent, dl.dlgroup1, dl.dlgroup2, dl.dlwdate, dl.dlmdate, dl.midx, tm.mid " 
    			 + "from table_donationlist dl, table_member tm " 
    			 + "where dl.midx = tm.midx " 
    			 + "and dl.dlidx = ?"; 
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, dlidx);
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()){
    			vo = new DonationListVo();
    			vo.setDlidx(rs.getInt("dlidx"));
    			vo.setDlimage(rs.getString("dlimage"));
    			vo.setDlplace(rs.getString("dlplace"));
    			vo.setDlarea(rs.getString("dlarea"));
    			vo.setDlcontent(rs.getString("dlcontent"));
    			vo.setDlgroup1(rs.getString("dlgroup1"));
    			vo.setDlgroup2(rs.getString("dlgroup2"));
    			vo.setDlwdate(rs.getDate("dlwdate"));
    			vo.setDlmdate(rs.getDate("dlmdate"));
    			vo.setMidx(rs.getInt("midx"));
    			vo.setDlid(rs.getString("mid"));
    		}
    		rs.close();
    		pstmt.close();
    		
    	}catch(Exception e){
    		
    	}
    	return vo;
    }
    	

    @Override
    public ArrayList<DonationListVo> getDonationListLine(int midx){
	// TODO Auto-generated method stub
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		ArrayList<DonationListVo> list = new ArrayList<DonationListVo>();
    	
		try{
		String sql = "select * "
                     + "from (select rownum rnum,dl.dlidx,dl.dlgroup2,dl.dlplace,dl.dlarea,dl.dlwdate,dl.dldeletest,tm.mid " 
                     + "from table_donationlist dl,table_member tm "
                     + "where dl.midx = tm.midx order by dlidx desc) "
                     + "where rnum <= 20 "
                     + "and rnum >= 1 ";

		pstmt = con.prepareStatement(sql);

		
		rs = pstmt.executeQuery();
			
           
			while(rs.next()){
        	   DonationListVo vo = new DonationListVo();
        	   vo.setDlidx(rs.getInt("dlidx"));
        	   vo.setDlgroup2(rs.getString("dlgroup2"));
        	   vo.setDlplace(rs.getString("dlplace"));
        	   vo.setDlarea(rs.getString("dlarea"));
        	   vo.setDlwdate(rs.getDate("dlwdate"));
        	   vo.setDldeletest(rs.getString("dldeletest"));
        	   vo.setDlid(rs.getString("mid"));
        	   list.add(vo);
           }
    	}catch(Exception e){
    		
    	}finally {
    		DBClose.close(con,pstmt,rs);
    		
    	}
    	return list;
    }

  

    @Override
    public DonationListVo modifyDonationList(int dlidx) {
	// TODO Auto-generated method stub
    	Connection con = dbconnect.getConnection();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	DonationListVo vo = new DonationListVo();
    	
    	try{
    		sql = "select dl.dlidx, dl.dlimage, dl.dlplace, dl.dlarea ,dl.dlcontent, dl.dlgroup1, dl.dlgroup2, dl.dlwdate, dl.dlmdate, dl.midx, tm.mid " 
       			 + "from table_donationlist dl, table_member tm " 
       			 + "where dl.midx = tm.midx " 
       			 + "and dl.dlidx = ?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, dlidx);
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()){
    			vo = new DonationListVo();
    			vo.setDlidx(rs.getInt("dlidx"));
    			vo.setDlimage(rs.getString("dlimage"));
    			vo.setDlplace(rs.getString("dlplace"));
    			vo.setDlarea(rs.getString("dlarea"));
    			vo.setDlcontent(rs.getString("dlcontent"));
    			vo.setDlgroup1(rs.getString("dlgroup1"));
    			vo.setDlgroup2(rs.getString("dlgroup2"));
    			vo.setDlwdate(rs.getDate("dlwdate"));
    			vo.setDlmdate(rs.getDate("dlmdate"));
    			vo.setDlid(rs.getString("mid"));
    			vo.setMidx(rs.getShort("midx"));
    		}
    		rs.close();
    		pstmt.close();
    		
    	}catch(Exception e){
    		
    	}
    	return vo;
    }
    @Override
    public int modifyDonationWrite(DonationListVo vo){
    	Connection con = dbconnect.getConnection();
    	PreparedStatement pstmt = null;
    	int row = 0;
    	
    	try{
    		sql = "update table_donationlist "
                + "set dlimage = ?, dlplace = ?, dlarea = ?, dlcontent = ?, "
    			+ "dlgroup1=?, dlgroup2=?, dlmdate=sysdate " 
                + "where dlidx = ?";
    		pstmt=con.prepareStatement(sql);
    		pstmt.setString(1, vo.getDlimage());
    		pstmt.setString(2, vo.getDlplace());
    		pstmt.setString(3, vo.getDlarea());
    		pstmt.setString(4, vo.getDlcontent());
    		pstmt.setString(5, vo.getDlgroup1());
    		pstmt.setString(6, vo.getDlgroup2());
    		pstmt.setInt(7, vo.getDlidx());
    		
    		row = pstmt.executeUpdate();
    		
    	}catch(Exception e){
    		
    	}finally{
    		DBClose.close(con,pstmt);
    	}
    	return row;
    }

    @Override
    public int deleteDonationList(int dlidx) {
	// TODO Auto-generated method stub
    Connection con = dbconnect.getConnection();
    PreparedStatement pstmt = null;
    int row = 0;
    
    try{
    sql = "update table_donationlist set dldeletest = 'Y' where dlidx=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, dlidx);
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
    Connection con = dbconnect.getConnection();
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	int page_cnt = 0;
	try{
	String sql = "select count(*) from from table_donationlist";
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
	page_cnt = Values.CNT_PER_PAGE;
	if(Values.CNT_PER_PAGE > 0){
		page_cnt++;
	}
		
    
	}catch(Exception e){
    	
    }finally{
    	DBClose.close(con,pstmt,rs);
    }

	return page_cnt;
    }
    
}

