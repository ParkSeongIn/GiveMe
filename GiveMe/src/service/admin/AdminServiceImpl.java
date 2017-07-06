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
	Connection con = dbconnect.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<MemberVo> list = new ArrayList<MemberVo>();
	
	try{
	    String sql="select * from "
	    	+ "(select rownum rnum,midx,mname,mid,mmail,menter,mvalue "
		+ "from table_member order by midx desc)"
	    	+ " where rnum <= 20 and rnum >= 1";
	    
//	    String sql="select midx,mname,mid,mmail,menter,mvalue from table_member order by midx desc";
	    pstmt = con.prepareStatement(sql);
	    rs=pstmt.executeQuery();	    
	    System.out.println(sql);
	    while(rs.next()){
		MemberVo vo = new MemberVo();
		
		vo.setMidx(rs.getInt("midx"));
		vo.setMname(rs.getString("mname"));
		vo.setMid(rs.getString("mid"));
		vo.setMmail(rs.getString("mmail"));
		vo.setMenter(rs.getDate("menter"));
		vo.setMvalue(rs.getString("mvalue"));
		list.add(vo);
	    }
	}catch(Exception e){
	    System.out.println(e.getMessage());
	}finally{
	    DBClose.close(con, pstmt, rs);
	}
		
	return list;	//list로 값 반환.
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
    public int insertDonationList(DonationListVo dl) {
	// TODO Auto-generated method stub
    	Connection con = dbconnect.getConnection();
    	PreparedStatement pstmt = null;
    	int row = 0;
    	try{
    		sql = "insert into table_donationlist "
    			 + "(dlidx,dlgroup1,dlgroup2,dlimage,dlplace,dlarea,dlcontent,dldeletest,dlwdate, dlmdate,dldbdate)"	
                 + "values(seq_dlidx.nextval,?,?,?,?,?,?,'N',sysdate,sysdate,sysdate)";
    		 
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, dl.getDlgroup1());
    		pstmt.setString(2, dl.getDlgroup2());
    		pstmt.setString(3, dl.getDlimage());
    		pstmt.setString(4, dl.getDlplace());
    		pstmt.setString(5, dl.getDlarea());
    		pstmt.setString(6, dl.getDlcontent());
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
    	DonationListVo dl = null;
    	
    	try{
    		sql = "select dlidx, dlimage, dlplace, dlarea ,dlcontent, dlgroup1, dlgroup2, dlwdate, dlmdate " 
    			 + "from table_donationlist " 
    			 + "where dlidx = ?"; 
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, dlidx);
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()){
    			dl = new DonationListVo();
    			dl.setDlidx(rs.getInt("dlidx"));
    			dl.setDlimage(rs.getString("dlimage"));
    			dl.setDlplace(rs.getString("dlplace"));
    			dl.setDlarea(rs.getString("dlarea"));
    			dl.setDlcontent(rs.getString("dlcontent"));
    			dl.setDlgroup1(rs.getString("dlgroup1"));
    			dl.setDlgroup2(rs.getString("dlgroup2"));
    			dl.setDlwdate(rs.getDate("dlwdate"));
    			dl.setDlmdate(rs.getDate("dlmdate"));
    		}
    		rs.close();
    		pstmt.close();
    		
    	}catch(Exception e){
    		
    	}
    	return dl;
    }
    	

    @Override
    public ArrayList<DonationListVo> getDonationListLine(){
	// TODO Auto-generated method stub
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		ArrayList<DonationListVo> list = new ArrayList<DonationListVo>();
    	
		try{
		String sql = "select * "
                     + "from (select rownum rnum,dlidx,dlgroup2,dlplace,dlarea,dlwdate,dldeletest " 
                     + "from table_donationlist "
                     + "order by dlidx desc) "
                     + "where rnum <= 20 "
                     + "and rnum >= 1 ";

		pstmt = con.prepareStatement(sql);

		
		rs = pstmt.executeQuery();
			
           
			while(rs.next()){
        	   DonationListVo dl = new DonationListVo();
        	   dl.setDlidx(rs.getInt("dlidx"));
        	   dl.setDlgroup2(rs.getString("dlgroup2"));
        	   dl.setDlplace(rs.getString("dlplace"));
        	   dl.setDlarea(rs.getString("dlarea"));
        	   dl.setDlwdate(rs.getDate("dlwdate"));
        	   dl.setDldeletest(rs.getString("dldeletest"));
        	   list.add(dl);
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
    	
    	DonationListVo dl = new DonationListVo();
    	
    	try{
    		sql = "select dlidx, dlimage,dlplace, dlarea ,dlcontent, dlgroup1, dlgroup2, dlwdate, dlmdate" 
       			 + "from table_donationlist" 
       			 + "where dlidx = ?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, dlidx);
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()){
    			dl = new DonationListVo();
    			dl.setDlidx(rs.getInt("dlidx"));
    			dl.setDlimage(rs.getString("dlimage"));
    			dl.setDlplace(rs.getString("dlplace"));
    			dl.setDlarea(rs.getString("dlarea"));
    			dl.setDlcontent(rs.getString("dlcontent"));
    			dl.setDlgroup1(rs.getString("dlgroup1"));
    			dl.setDlgroup2(rs.getString("dlgroup2"));
    			dl.setDlwdate(rs.getDate("dlwdate"));
    			dl.setDlmdate(rs.getDate("dlmdate"));
    		}
    		rs.close();
    		pstmt.close();
    		
    	}catch(Exception e){
    		
    	}
    	return dl;
    }
    @Override
    public int modifyDonationWrite(DonationListVo dl){
    	Connection con = dbconnect.getConnection();
    	PreparedStatement pstmt = null;
    	int row = 0;
    	
    	try{
    		sql = "update table_donationlist "
                + "set dlimage = ?, dlplace = ?, dlarea = ?, dlcontent = ?, "
    			+ "dlgroup1=?, dlgroup2=?, dlmdate=sysdate " 
                + "where dlidx = ?";
    		pstmt=con.prepareStatement(sql);
    		pstmt.setString(1, dl.getDlimage());
    		pstmt.setString(2, dl.getDlplace());
    		pstmt.setString(3, dl.getDlarea());
    		pstmt.setString(4, dl.getDlcontent());
    		pstmt.setString(5, dl.getDlgroup1());
    		pstmt.setString(6, dl.getDlgroup2());
    		pstmt.setInt(7, dl.getDlidx());
    		
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

