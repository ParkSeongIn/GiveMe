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
    public ArrayList<MemberVo> getMemberList(String keyField, String keyWord, int page_num) {
	// TODO Auto-generated method stub
	Connection con = dbconnect.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<MemberVo> list = new ArrayList<MemberVo>();
	
	try{
	    String sql="select * from "
	    	+ "(select rownum rnum, midx, mname, mid, mmail, menter, mvalue, mgrade "
	    	+ "from table_member order by midx desc) "
	    	+ "where rnum >= ? and rnum <= ?";
	    
	    int min = ((page_num - 1) * Values.CNT_PER_PAGE) + 1;
		int max = min + Values.CNT_PER_PAGE - 1;
		
	    if(keyWord != null && !keyWord.equals("") ){
		sql +=" and "+keyField.trim()+" like '%"+keyWord.trim()+"%' order by midx desc";
	    }else{
		sql +=" order by midx desc";
	    }
	    

	    pstmt = con.prepareStatement(sql);
	    pstmt.setInt(1, min);
		pstmt.setInt(2, max);
		
	    rs=pstmt.executeQuery();	    
	    while(rs.next()){
		MemberVo vo = new MemberVo();
		
		vo.setMidx(rs.getInt("midx"));
		vo.setMname(rs.getString("mname"));
		vo.setMid(rs.getString("mid"));
		vo.setMmail(rs.getString("mmail"));
		vo.setMenter(rs.getDate("menter"));
		vo.setMvalue(rs.getInt("mvalue"));
		vo.setMgrade(rs.getString("mgrade"));
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
    public int insertAllBoard(AllBoardVo avo) {
	// TODO Auto-generated method stub
    	Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null;
		int iab = 0;
		
		try { 
			sql = "insert into table_allboard (abid,abtype,abidx,abtitle,abhit,abwdate,abcontent,abmdate,abdbdate,abdeletest,abimage) "
					+ "values(?,?,seq_abidx.nextval,?,0,sysdate,?,'',sysdate,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, avo.getAbid());
		pstmt.setString(2, avo.getAbtype());
		pstmt.setString(3, avo.getAbtitle());
		pstmt.setString(4, avo.getAbcontent());
		pstmt.setInt(5, Values.NON_DEL);
		pstmt.setString(6, avo.getAbimage());
		
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
		String sql = "select tb.abtitle, tb.abwdate, tb.abcontent "
				+ "from table_allboard tb where tb.abidx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,abidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				avo = new AllBoardVo(); 
			
			avo.setAbtitle(rs.getString(1));
			avo.setAbwdate(rs.getDate(2));
			avo.setAbcontent(rs.getString(3));

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
			sql ="update table_allboard set abtitle = ? , abcontent = ? , abmdate=sysdate where abidx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, avo.getAbtitle());
			pstmt.setString(2, avo.getAbcontent());
			pstmt.setInt(3, abidx);
			
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
    public int insertDonationList(DonationListVo dl) {
	// TODO Auto-generated method stub
    	Connection con = dbconnect.getConnection();
    	PreparedStatement pstmt = null;
    	int row = 0;
    	try{
    		sql = "insert into table_donationlist "
    			 + "(dlidx,dlgroup1,dlgroup2,dlgroup3,dlimage,dlplace,dlarea,dlcontent,dldeletest,dlwdate, dlmdate,dldbdate)"	
                 + "values(seq_dlidx.nextval,?,?,?,?,?,?,?,?,sysdate,sysdate,sysdate)";
    		 
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, dl.getDlgroup1());
    		pstmt.setString(2, dl.getDlgroup2());
    		pstmt.setString(3, dl.getDlgroup3());
    		pstmt.setString(4, dl.getDlimage());
    		pstmt.setString(5, dl.getDlplace());
    		pstmt.setString(6, dl.getDlarea());
    		pstmt.setString(7, dl.getDlcontent());
    		pstmt.setInt(8, Values.NON_DEL);
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
    		sql = "select dlidx, dlimage, dlplace, dlarea ,dlcontent, dlgroup1, dlgroup2, dlgroup3,dlwdate, dlmdate " 
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
    			dl.setDlgroup3(rs.getString("dlgroup3"));
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
    public ArrayList<DonationListVo> getDonationListLine(String keyField, String keyWord, int page_num){
	// TODO Auto-generated method stub
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		ArrayList<DonationListVo> list = new ArrayList<DonationListVo>();
    	
		try{
			String sql = "select * from "
				+ "(select rownum rnum, dlidx, dlgroup1, dlgroup2, dlgroup3, dlplace, dlarea, dlwdate, dldeletest from "
				+ "table_donationlist order by dlidx desc) "
				+ "where rnum >= ? and rnum <= ?";
		
		int min = ((page_num - 1) * Values.CNT_PER_PAGE) + 1;
		int max = min + Values.CNT_PER_PAGE - 1;
		
		if(keyWord != null && !keyWord.equals("") ){
			sql +=" and "+keyField.trim()+" like '%"+keyWord.trim()+"%' order by dlidx";
		}else{
			sql +=" order by dlidx";
		}
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, min);
		pstmt.setInt(2, max);
		
		rs = pstmt.executeQuery();
           
		while(rs.next()){
        	   DonationListVo dl = new DonationListVo();
        	   dl.setDlidx(rs.getInt("dlidx"));
        	   dl.setDlgroup1(rs.getString("dlgroup1"));
        	   dl.setDlgroup2(rs.getString("dlgroup2"));
        	   dl.setDlgroup3(rs.getString("dlgroup3"));
        	   dl.setDlplace(rs.getString("dlplace"));
        	   dl.setDlarea(rs.getString("dlarea"));
        	   dl.setDlwdate(rs.getDate("dlwdate"));
        	   dl.setDldeletest(rs.getInt("dldeletest"));
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
    		sql = "select dlidx, dlplace, dlarea ,dlcontent, dlgroup1, dlgroup2, dlgroup3, dlwdate, dlmdate "
    				+ " from table_donationlist "
    				+ " where dlidx = ? ";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, dlidx);
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()){
    			dl = new DonationListVo();
    			dl.setDlidx(rs.getInt("dlidx"));
    			dl.setDlplace(rs.getString("dlplace"));
    			dl.setDlarea(rs.getString("dlarea"));
    			dl.setDlcontent(rs.getString("dlcontent"));
    			dl.setDlgroup1(rs.getString("dlgroup1"));
    			dl.setDlgroup2(rs.getString("dlgroup2"));
    			dl.setDlgroup3(rs.getString("dlgroup3"));
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
                + "set dlplace = ?, dlarea = ?, dlcontent = ?, "
    			+ "dlgroup1=?, dlgroup2=?, dlgroup3=?, dlmdate=sysdate " 
                + "where dlidx = ?";
    		pstmt=con.prepareStatement(sql);
    		pstmt.setString(1, dl.getDlplace());
    		pstmt.setString(2, dl.getDlarea());
    		pstmt.setString(3, dl.getDlcontent());
    		pstmt.setString(4, dl.getDlgroup1());
    		pstmt.setString(5, dl.getDlgroup2());
    		pstmt.setString(6, dl.getDlgroup3());
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
    sql = "update table_donationlist set dldeletest = ? where dlidx=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, Values.DEL);
    pstmt.setInt(2, dlidx);
    row = pstmt.executeUpdate();
   
    }catch(Exception e){
    	
    }finally{
    	DBClose.close(con,pstmt);
    }
    return row;
    }

    @Override
    public ArrayList<QuestionVo> getAdQuestionList(String keyField, String keyWord, int page_num) {
    	Connection con = dbconnect.getConnection();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	ArrayList<QuestionVo> aqlist = new ArrayList<QuestionVo>();
    	try { 
    		sql = "select a2.* from "
    			+ "(select a1.*, rownum as rnum from "
    			+ "(select tq.qidx, tq.qcategory, tq.qtitle, tm.mid, tq.qstate, tq.qwdate, tq.qdeletest from "
    			+ "			table_member tm, table_question tq where tm.midx = tq.midx and tq.qdeletest=? order by tq.qidx desc "
    			+ ") a1 ) a2 "
    			+ "where a2.rnum >=? and a2.rnum <=?";
    		
    		int min = ((page_num - 1) * Values.CNT_PER_PAGE) + 1;
    		int max = min + Values.CNT_PER_PAGE - 1;
    		
    		if(keyWord != null && !keyWord.equals("") ){
    		    sql +=" and "+keyField.trim()+" like '%"+keyWord.trim()+"%' order by qidx desc";
    		}else{
    		    sql +=" order by qidx desc";
    		}
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, Values.NON_DEL);
    		pstmt.setInt(2, min);
    		pstmt.setInt(3, max);
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			QuestionVo vo = new QuestionVo();
    			
    			vo.setQidx(rs.getInt("qidx"));
    			vo.setQcategory(rs.getString("qcategory"));
    			vo.setQtitle(rs.getString("qtitle"));
    			vo.setMid(rs.getString("mid"));
    			vo.setQstate(rs.getString("qstate"));
    			vo.setQwdate(rs.getTimestamp("qwdate"));
    			vo.setQdeletest(rs.getInt("qdeletest"));
    			
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
    		sql = "select tq.qidx, tq.qtitle, tm.midx, tq.qcategory, tm.mid, tq.qwdate, tq.qcontent, tq.qrecontent "
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
				qv.setMid(rs.getString("mid"));
				qv.setQwdate(rs.getTimestamp("qwdate"));
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
    		sql = "update table_question set qrecontent = ?, qrewdate = sysdate, qstate = '답변완료' where qidx = ?";
    	pstmt = con.prepareStatement(sql);
    	pstmt.setString(1, (qv.getQrecontent()));
    	pstmt.setInt(2, (qv.getQidx()));
    	
    	System.out.println(qv.getQrewdate());
    	row = pstmt.executeUpdate();
    	}catch(Exception e) {
    		System.out.println(e.getMessage());
    	}finally {
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
	String sql = "select count(*) from table_donationlist where dldeletest=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Values.NON_DEL);
	rs = pstmt.executeQuery();
	rs.next();
	page_cnt = rs.getInt(1)/Values.CNT_PER_PAGE;
	if(rs.getInt(1) % Values.CNT_PER_PAGE > 0){
		page_cnt++;
	}
		
    
	}catch(Exception e){
    	
    }finally{
    	DBClose.close(con,pstmt,rs);
    }

	return page_cnt;
    }
    
    @Override
    public int getPaging1() {
	// TODO Auto-generated method stub
    Connection con = dbconnect.getConnection();
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	int page_cnt = 0;
	try{
	String sql = "select count(*) from table_question where qdeletest=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Values.NON_DEL);
	rs = pstmt.executeQuery();
	rs.next();
	page_cnt = rs.getInt(1)/Values.CNT_PER_PAGE;
	if(rs.getInt(1) % Values.CNT_PER_PAGE > 0){
		page_cnt++;
	}
		
    
	}catch(Exception e){
    	
    }finally{
    	DBClose.close(con,pstmt,rs);
    }

	return page_cnt;
    }
    @Override
    public int getPagingM() {
	// TODO Auto-generated method stub
    Connection con = dbconnect.getConnection();
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	int page_cnt = 0;
	try{
	String sql = "select count(*) from table_member ";
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
	page_cnt = Values.CNT_PER_PAGE;
	page_cnt++;
	
		
    
	}catch(Exception e){
    	
    }finally{
    	DBClose.close(con,pstmt,rs);
    }

	return page_cnt;
    }
    
}

