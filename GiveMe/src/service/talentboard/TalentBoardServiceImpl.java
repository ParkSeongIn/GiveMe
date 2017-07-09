package service.talentboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBConnect;
import service.allboard.AllBoardVo;
import common.DBClose;


public class TalentBoardServiceImpl implements TalentBoardService{
	
	DBConnect dbconnect = null; 
    String sql="";
    
    public TalentBoardServiceImpl(){
    	dbconnect = new DBConnect();
        }

	@Override
	public int insertTalentBoard(TalentBoardVo tvo) { // grp +1씩 증가하게 만들어야 함
		Connection con = dbconnect.getConnection(); 
		PreparedStatement pstmt = null;
		int itb = 0;
			try {
				sql = "insert into table_talentboard "
					+ "(tbidx,tbtitle,tbhit,tbwdate,tbcategory1,tbcategory2,tbpeople,"
					+ "tbhdate,tbtime,tbarea1,tbarea2,tbcontent,tbfile,tbetime,tbstate,"
					+ "tbcancle,tbpoint,tbhconfirm,tbmdate,tbdbdate,tbgrp,"
					+ "tbseq,tbdepth,midx,tbdeletest,tbpeoplecnt,tbapply) "
					+ "Values(seq_tbidx.nextval,?,0,sysdate,?,?,?,?,?,?,?,?,'',"
					+ "sysdate,'W','N',0,'N',sysdate,sysdate,seq_tbidx.nextval,0,0,?,'N',?,'N')";
				
				System.out.println(sql);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, tvo.getTbtitle());
				pstmt.setString(2, tvo.getTbcategory1());
				pstmt.setString(3, tvo.getTbcategory2());
				pstmt.setString(4, tvo.getTbpeople());
				pstmt.setInt(5, tvo.getTbhdate());
				pstmt.setString(6, tvo.getTbtime());
				pstmt.setString(7, tvo.getTbarea1());
				pstmt.setString(8, tvo.getTbarea2());
				pstmt.setString(9, tvo.getTbcontent());
				pstmt.setInt(10, tvo.getMidx());
				pstmt.setInt(11, tvo.getTbpeoplecnt());

//				pstmt.setString(10, tvo.getTbstate());
//				pstmt.setString(11, tvo.getTbcancle());
//				pstmt.setString(14, tvo.getTbapply());
				
				itb = pstmt.executeUpdate();	
			
			}catch(Exception e) {
				
			}finally {
				DBClose.close(con,pstmt);
			}
		return itb;
	}

	@Override
	public TalentBoardVo getTalentBoard(int tbidx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TalentBoardVo tvo = null;
		try {
			
			sql = "select tt.tbidx,tt.tbpeople,tt.tbcategory1 || '-' || tt.tbcategory2 as category, tt.tbtitle,tt.tbhdate,tt.tbtime,tt.tbarea1 || '-' || tt.tbarea2 as area,tt.tbpeoplecnt,tt.tbcontent,tt.midx from table_talentboard tt,table_member tm where tt.midx = tm.midx and tt.tbidx = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tbidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				tvo = new TalentBoardVo();
				
				tvo.setTbidx(rs.getInt(1));
				tvo.setTbpeople(rs.getString(2));
				tvo.setTbcategory1(rs.getString(3));
				tvo.setTbcategory2(rs.getString(4));
				tvo.setTbtitle(rs.getString(5));
				tvo.setTbhdate(rs.getInt(6));
				tvo.setTbtime(rs.getString(7));
				tvo.setTbarea1(rs.getString(8));
				tvo.setTbarea2(rs.getString(9));
				tvo.setTbpeoplecnt(rs.getInt(10));
				tvo.setTbcontent(rs.getString(11));
				tvo.setMidx(rs.getInt(12));
				
			}
			
		}catch(Exception e){
			
		}finally{
			DBClose.close(con,pstmt,rs);
			}
		return tvo;
	}

	@Override
	public ArrayList<TalentBoardVo> getTalentBoardList() {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<TalentBoardVo> tblist = new ArrayList<TalentBoardVo>();
		
		try {
			sql = "select * from ("
					+ "select * from ("
						+ "select rownum rnum, AA.* "
						+ "from ( select tt.tbidx,tt.tbpeople,tt.tbtitle,tt.midx,tt.tbhit,tt.tbwdate "
							+ "from table_talentboard tt,table_member tm "
							+ "where tt.midx = tm.midx and tt.tbdeletest = 'N' "
								+ "order by tt.tbgrp asc,tt.tbseq asc,tt.tbidx asc"
								+ ") AA "
									+ ") where rnum <= 10"
									+ ") where rnum >= 1";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TalentBoardVo tvo = new TalentBoardVo();
				
				tvo.setTbidx(rs.getInt("tbidx"));
				tvo.setTbpeople(rs.getString("tbpeople"));
				tvo.setTbtitle(rs.getString("tbtitle"));
				tvo.setMidx(rs.getInt("midx"));
				tvo.setTbhit(rs.getInt("tbhit"));
				tvo.setTbwdate(rs.getDate("tbwdate"));
				tblist.add(tvo);
			}
			
		} catch(Exception e) { 
			
		}	finally {
			DBClose.close(con,pstmt,rs);
		}
		
		return tblist;
	}
	
	@Override
	public TalentBoardVo TalentBoardmodifySe(int tbidx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TalentBoardVo tvo = null;
		
		try {
			sql = "select tt.tbpeople, tt.tbcategory1, tt.tbcategory2, tt.tbtitle, tt.tbhdate, tt.tbtime, tt.tbpeoplecnt, tt.tbarea1, tt.tbarea2, tt.tbfile, tt.tbcontent "
					+ "from table_talentboard tt,table_member tm where tt.midx = tm.midx and tt.tbidx = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,tbidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				tvo = new TalentBoardVo();
				
				tvo.setTbpeople(rs.getString(1));
				tvo.setTbcategory1(rs.getString(2));
				tvo.setTbcategory2(rs.getString(3));
				tvo.setTbtitle(rs.getString(4));
				tvo.setTbhdate(rs.getInt(5));
				tvo.setTbtime(rs.getString(6));
				tvo.setTbpeoplecnt(rs.getInt(7));
				tvo.setTbarea1(rs.getString(8));
				tvo.setTbarea2(rs.getString(9));
				tvo.setTbfile(rs.getString(10));
				tvo.setTbcontent(rs.getString(11));
				
			}
			
		}catch (Exception e) {
			
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return tvo;
	}

	@Override
	public int modifyTalentBoard(TalentBoardVo tvo, int tbidx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		int tbu = 0;
		try {
			sql ="update table_talentboard set tbpeople = ?, tbcategory1=?, tbcategory2 = ?, tbtitle = ?, tbhdate = ?, tbtime=?, "
					+ "tbpeoplecnt = ?, tbarea1 = ?, tbarea2 = ?, tbfile = ?, tbcontent = ?, tbmdate = sysdate where tbidx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tvo.getTbpeople());
			pstmt.setString(2, tvo.getTbcategory1());
			pstmt.setString(3, tvo.getTbcategory2());
			pstmt.setString(4, tvo.getTbtitle());
			pstmt.setInt(5, tvo.getTbhdate());
			pstmt.setString(6, tvo.getTbtime());
			pstmt.setInt(7, tvo.getTbpeoplecnt());
			pstmt.setString(8, tvo.getTbarea1());
			pstmt.setString(9, tvo.getTbarea2());
			pstmt.setString(10, tvo.getTbfile());
			pstmt.setString(11, tvo.getTbcontent());
			pstmt.setInt(12, tbidx);
			
			tbu = pstmt.executeUpdate();
			
		}	catch(Exception e){
			
		}	finally {
				DBClose.close(con,pstmt);
		}
		
		return tbu;
	}

	@Override
	public int deleteTalentBoard(int tbidx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		TalentBoardVo tvo = new TalentBoardVo();
		int dtb = 0;
		
		try {
			sql = "update table_talentboard set tbdeletest = 'Y' where tbidx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tbidx);
			dtb = pstmt.executeUpdate();
		}catch(Exception e) { 
			
		}finally { 
			DBClose.close(con,pstmt);
		}
		return dtb;
	}

	@Override
	public int updateTalentBoardHit(int tbidx) { // 조회수
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int hit = 0;
	
		try {
			String sql = "update table_talentboard set tbhit = tbhit + 1 where tbidx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tbidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				hit = rs.getInt(1);
			}
		}catch(Exception e) { 
			
		}	finally {
			DBClose.close(con,pstmt,rs);
		}
			return hit;
		}

	@Override
	public int getPaging() {
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
    	int p = 0;
    	try {
    		String sql = "Select count(*) from table_talentboard where tbdeletest = 'N'";
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
		
			if(rs.next()) {
				p = rs.getInt(1);
			}
    	}catch(Exception e){
    	}finally{
    		DBClose.close(con,pstmt,rs);
		}
    	return p;
	}

	@Override
	public int modifyTalentBoardState(int tbidx) { // 신청하기 눌렀을 때 바뀌는 쿼리 -- 미완
		Connection con = dbconnect.getConnection(); // 값 바뀌지만 로그인 안할때도 바뀜.
		PreparedStatement pstmt = null;
		TalentBoardVo tvo = new TalentBoardVo();
		int mtbs = 0;
		try {
			sql = "update table_talentboard set tbstate = 'I' ,tbcancle = 'N', tbapply = 'Y' where tbidx = ?";
			pstmt = con.prepareStatement(sql); // and midx = ?
			System.out.println(sql);
			pstmt.setInt(1, tbidx);
			mtbs = pstmt.executeUpdate();
		}catch(Exception e) { 

		}finally { 
			DBClose.close(con,pstmt);
		}
		return mtbs;
	}

	
	@Override
	public int modifyTalentBoardConfirm(int tbidx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		TalentBoardVo tvo = new TalentBoardVo();
		int mtbc = 0;
		try {
			sql = "update table_talentboard set tbhconfirm = 'Y', tbstate = 'C' where tbhconfirm = 'N' and tbstate = 'S' and tbidx = ?";
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setInt(1, tbidx);
			mtbc = pstmt.executeUpdate();
		}catch(Exception e) { 

		}finally { 
			DBClose.close(con,pstmt);
		}
		
		return mtbc;
	}
	
	
	///제공취소 쿼리 필요
	
	
	@Override
	public int modifyTalentBoardCancle(int midx){ // 사용자가 신청 취소했을 때 미완
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		TalentBoardVo tvo = new TalentBoardVo();
		int mcan = 0;
		try {
			sql ="update table_talentboard set tbstate = 'W', tbapply = 'N', tbcancle = 'Y' "
					+ " where tbstate = 'I' and tbapply='Y' and tbcancle='N' and midx = ?";
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setInt(1, midx);
			mcan = pstmt.executeUpdate();
		
		}catch(Exception e) { 

		}finally { 
			DBClose.close(con,pstmt);
		}

		return mcan;
	}
	
	
	@Override
	public int modifyTalentBoardEtime(int tbidx){ // 관리자 매칭 확인 버튼 눌렀을 시 -- 완
		Connection con = dbconnect.getConnection(); // 값이 안넘어가지만 sql 바뀜.
		PreparedStatement pstmt = null;
		TalentBoardVo tvo = new TalentBoardVo();
		int mtbe = 0;
		
		try {
			sql = "update table_talentboard set tbstate = 'S', tbetime=sysdate "
					+ "where Tbstate = 'I' and tbcancle='N' and tbdeletest ='N' and tbapply = 'Y' and tbidx = ?";
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setInt(1, tbidx);
			mtbe = pstmt.executeUpdate();
		
		}catch(Exception e) { 

		}finally { 
			DBClose.close(con,pstmt);
		}
		
		return mtbe;
	}
	

	@Override
	public ArrayList<TalentBoardVo> TalentBoardMyList(int midx) { // 마이페이지 재능내역 리스트 -- 완료
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<TalentBoardVo> tblist = new ArrayList<TalentBoardVo>();
		
		try {
			sql = "select * from ("
					+ "select * from ("
						+ "select rownum rnum, AA.* "
						+ "from ( select tt.midx,tt.tbcategory1,tt.tbcategory2,tt.tbpeople,tt.tbhdate,tt.tbstate "
							+ "from table_talentboard tt,table_member tm "
							+ "where tt.midx = tm.midx and tm.midx = ? and tt.tbdeletest = 'N' "
								+ "order by tt.tbgrp desc,tt.tbseq asc,tt.tbidx asc"
								+ ") AA "
									+ ") where rnum <= 5"
									+ ") where rnum >= 1";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TalentBoardVo tvo = new TalentBoardVo();
				
				tvo.setMidx(rs.getInt("midx"));
				tvo.setTbcategory1(rs.getString("tbcategory1"));
				tvo.setTbcategory2(rs.getString("tbcategory2"));
				tvo.setTbpeople(rs.getString("tbpeople"));
				tvo.setTbhdate(rs.getInt("tbhdate"));
				tvo.setTbstate(rs.getString("tbstate"));
				
				tblist.add(tvo);
			}
			
		}catch(Exception e){
			
		}finally{
			DBClose.close(con,pstmt,rs);
			}
		return tblist;
	}
	
	@Override
	public TalentBoardVo replyTalentBoard() { // 답글
		// TODO Auto-generated method stub
		return null;
	}
	
}
