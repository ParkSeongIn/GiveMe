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
import service.question.QuestionVo; 


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
    public ArrayList<QuestionVo> getAdQuestionList() {
    	Connection con = dbconnect.getConnection();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	ArrayList<QuestionVo> aqlist = new ArrayList<QuestionVo>();
    	try { 
    		sql = " select * from ("
					+ "select * from ("
					+ 	"select rownum rn, AA.*from ("
					+ 		"select tq.qidx, tq.qcategory, tq.qtitle, tq.qstate, tq.qwdate, tq.qdeletest "
					+ 		"from table_member tm, table_question tq "
					+ 		"where tm.midx = tq.midx "
					+ 		")AA order by AA.qidx desc) where rn <=20 ) where rn >=1";
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			QuestionVo vo = new QuestionVo();
    			
    			vo.setQidx(rs.getInt("qidx"));
    			vo.setQcategory(rs.getString("qcategory"));
    			vo.setQtitle(rs.getString("qtitle"));
   // 			vo.setMname(rs.getString("mname"));
    			vo.setQstate(rs.getString("qstate"));
    			vo.setQwdate(rs.getDate("qwdate"));
    			vo.setQdeletest(rs.getString("qdeletest"));
    			
    			aqlist.add(vo);
    		}
    	}catch(Exception e) {
    		System.out.println(e.getMessage());
    	}finally {
    		DBClose.close(con,pstmt,rs);
    	}
    	return aqlist;
    }
    
    @Override
    public QuestionVo getAdQuestion(int qidx) {
    	Connection con = dbconnect.getConnection();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	QuestionVo qv = null;
    	try {
    		sql = "select tq.qidx, tq.qtitle, tm.midx, tq.qcategory, tm.mname, tq.qwdate, tq.qcontent, tq.qrecontent "
					+ "from table_member tm, table_question tq where tm.midx = tq.midx and tq.qidx = ?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, qidx);
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()) {
    			qv = new QuestionVo();
    			qv.setQidx(rs.getInt("qidx"));
				qv.setQtitle(rs.getString("qtitle"));
				qv.setMidx(rs.getInt("midx"));
				qv.setQcategory(rs.getString("qcategory"));
	//			qv.setMname(rs.getString("mname"));
				qv.setQwdate(rs.getDate("qwdate"));
				qv.setQcontent(rs.getString("qcontent"));
				qv.setQrecontent(rs.getString("qrecontent"));
    		}
    	}catch(Exception e) {
    		System.out.println(e.getMessage());
    	}finally {
    		DBClose.close(con,pstmt,rs);
    	}
    	return qv;
    }
    
    @Override
    public int modifyWriteAdQuestion(QuestionVo qv) {
    	Connection con = dbconnect.getConnection();
    	PreparedStatement pstmt = null;
    	int row = 0;
    	try {
    		sql = "update table_question set qrecontent = ?, qmdate = sysdate where qidx = ?";
    	pstmt = con.prepareStatement(sql);
    	pstmt.setString(1, (qv.getQrecontent()));
    	pstmt.setInt(2, (qv.getQidx()));
    	
    	row = pstmt.executeUpdate();
    	}catch(Exception e) {
    		System.out.println(e.getMessage());
    	}finally {
    		DBClose.close(con,pstmt);
    	}
    	return row;
    }
    
//    @Override
//    public int insertAdQuestion(QuestionVo vo) {
//    	Connection con = dbconnect.getConnection();
//    	PreparedStatement pstmt = null;
//    	int row = 0;
//    	try {
//    		sql = "insert into table_question (qrecontent, qwdate, qdbdate) values(?, sysdate, sysdate)";
//    		
//    		pstmt = con.prepareStatement(sql);
//    		pstmt.setString(1, vo.getQrecontent());
//    		row = pstmt.executeUpdate();
//    	
//    	}catch(Exception e) {
//    		System.out.println(e.getMessage());
//    	}finally {
//    		DBClose.close(con,pstmt);
//    	}
//    	return row;
//    }
    
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

