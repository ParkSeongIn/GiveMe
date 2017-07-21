package service.question;

import java.sql.*;
import java.util.ArrayList;

import common.DBConnect;
import common.Values;
import common.DBClose;

public class QuestionServiceImpl implements QuestionService{

	 DBConnect dbconnect = null; 
	    String sql="";
	    
	 public QuestionServiceImpl(){	
	    dbconnect = new DBConnect();
	    }
	
	@Override
	public ArrayList<QuestionVo> getQuestionList(int midx,int page_num) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<QuestionVo> qlist = new ArrayList<QuestionVo>();
		try {
			String sql = "select * from "
			         + "(select rownum rnum,  tq.qidx, tq.qcategory, tq.qtitle, tm.mid, tq.qstate, tq.qwdate from "
					 + "table_member tm, table_question tq "
					 + "where tm.midx = tq.midx and tm.midx=? order by qidx desc) "
					 + "where rnum>=? and rnum <=?";
			int min = ((page_num - 1) * Values.CNT_PER_PAGE) + 1;
			int max = min + Values.CNT_PER_PAGE - 1;
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, midx);
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
				
				qlist.add(vo);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return qlist;
	}

	@Override
	public int insertQuestion(QuestionVo vo) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		int row = 0;
		try { 
			sql = "insert into table_question "
            + "(qidx,qcategory,qtitle,qcontent,qwdate,qrewdate,qstate,qmdate,qdbdate,midx, "
            + "qdeletest) "
            + "values(seq_qidx.nextval,?,?,?,sysdate,sysdate,'답변대기',sysdate,sysdate,?,2)";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, vo.getQcategory());
		pstmt.setString(2, vo.getQtitle());
		pstmt.setString(3, vo.getQcontent());
		pstmt.setInt(4, vo.getMidx());	
		row = pstmt.executeUpdate();
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DBClose.close(con,pstmt);
		}
		return row;
	}

	@Override
	public QuestionVo getQuestion(int qidx, int midx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QuestionVo qv = null;
		try {
			sql = "select tq.qidx, tq.qtitle, tm.midx, tq.qcategory, tm.mid, tq.qwdate, tq.qcontent, tq.qrecontent "
					+ "from table_member tm, table_question tq where tm.midx = tq.midx and tq.qidx = ? and tm.midx = ?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qidx);
			pstmt.setInt(2, midx);
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

//	@Override
//	public QuestionVo modfiyQuestion(int qidx) {
//		
//		return null;
//	}

	@Override
	public int modifyWriteQuestion(QuestionVo qv) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			sql = "update table_question set qtitle = ?, qcontent = ?, qmdate = sysdate "
					+ "where qidx = ? and midx = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, (qv.getQtitle()));
		pstmt.setString(2, (qv.getQcontent()));
		pstmt.setInt(3, (qv.getQidx()));
		pstmt.setInt(4, (qv.getMidx()));
		
		row = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DBClose.close(con,pstmt);
		}
		return row;
	}
	
	@Override
	public int deleteQuestion(int qidx, int midx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			sql = "update table_question set qdeletest = 'Y' "
					+ "where qidx = ? and midx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qidx);
			pstmt.setInt(2, midx);
			row = pstmt.executeUpdate();
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally { 
			DBClose.close(con, pstmt);
		}
		
		return row;
	}

	@Override
    public int getPaging() {
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
    	int page_cnt = 0;
    	try {
    		String sql = "select count(*) from table_question where qdeletest = ?";
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

}
