package service.question;

import java.sql.*;
import java.util.ArrayList;

import common.DBConnect;
import common.DBClose;

public class QuestionServiceImpl implements QuestionService{

	 DBConnect dbconnect = null; 
	    String sql="";
	    
	 public QuestionServiceImpl(){	
	    dbconnect = new DBConnect();
	    }
	
	@Override
	public ArrayList<QuestionVo> getQuestionList(int midx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<QuestionVo> qlist = new ArrayList<QuestionVo>();
		//System.out.println(midx);
		try {
			sql = " select * from (select * from (select rownum rn, AA.*from (select tq.qidx,tq.qcategory,tq.qtitle,tq.qstate, tq.qwdate from table_member tm, table_question tq where tm.midx = tq.midx and tm.midx = ? )AA order by AA.qidx desc) where rn <=5 ) where rn >=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();
			//System.out.println(sql);
		
			while(rs.next()) {
				QuestionVo vo = new QuestionVo();
				
				vo.setQidx(rs.getInt("qidx"));
				vo.setQcategory(rs.getString("qcategory"));
				vo.setQtitle(rs.getString("qtitle"));
			//	vo.setMname(rs.getString("mname"));
				vo.setQstate(rs.getString("qstate"));
				vo.setQwdate(rs.getDate("qwdate"));
				
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
            + "(qidx,qcategory,qtitle,qcontent,qwdate,qstate,qmdate,qdbdate,midx, "
            + "qdeletest, qrecontent) "
            + "values(seq_qidx.nextval,?,?,?,sysdate,'N',sysdate,sysdate,4,'N',?)";
		
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, vo.getQcategory());
		pstmt.setString(2, vo.getQtitle());
		pstmt.setString(3, vo.getQcontent());
	//	pstmt.setInt(4, vo.getMidx());
		pstmt.setString(4, vo.getQrecontent());
		row = pstmt.executeUpdate();
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DBClose.close(con,pstmt);
		}
		return row;
	}

	@Override
	public QuestionVo getQuestion(int midx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QuestionVo qv = null;
		
		try {
			sql = "select tq.qidx, tq.qtitle, tm.midx, tq.qcategory, tm.mname, tq.qwdate, tq.qcontent, tq.qrecontent from table_member tm, table_question tq where tm.midx = tq.midx and tm.midx = ?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				qv = new QuestionVo();
				qv.setQidx(rs.getInt("qidx"));
				qv.setQtitle(rs.getString("qtitle"));
				qv.setMidx(rs.getInt("midx"));
				qv.setQcategory(rs.getString("qcategory"));
	//			qv.setMname(rs.getString("mname"));
				qv.setQwdate(rs.getDate("qwdate"));
				qv.setQcontent(rs.getString("qcontent"));
	//			qv.setQrecontent(rs.getString("qrecontent"));
			}
		}catch(Exception e) {
				System.out.println(e.getMessage());
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return qv;
	}


	@Override
	public QuestionVo modfiyQuestion() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteQuestion() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getPaging() {
		// TODO Auto-generated method stub
		return 0;
	}

}
