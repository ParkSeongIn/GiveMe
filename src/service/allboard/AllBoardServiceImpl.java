package service.allboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import common.DBConnect;
import common.Values;
import common.DBClose;


public class AllBoardServiceImpl implements AllBoardService{

    DBConnect dbconnect = null; 
    String sql="";
    
    public AllBoardServiceImpl(){
	dbconnect = new DBConnect();
    }
    
    @Override
    public ArrayList<AllBoardVo> getAllBoardList(String keyField, String keyWord, int page_num) {
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<AllBoardVo> ablist = new ArrayList<AllBoardVo>();
		
		try {
			String sql = "select * from "
					+ "(select rownum rnum,  abtype, abidx, abimage, abtitle, abhit, abwdate, abdeletest, abcontent, abid from "
					+ "table_allboard order by abidx desc) "
					+ "where rnum >= ? and rnum <= ?";

			int min = ((page_num - 1) * Values.CNT_PER_PAGE) + 1;
			int max = min + Values.CNT_PER_PAGE - 1;
			
			if(keyWord != null && !keyWord.equals("") ){
				sql +=" and "+keyField.trim()+" like '%"+keyWord.trim()+"%' order by abidx desc";
			}else{
				sql +=" order by abidx desc";
			}
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, min);
			pstmt.setInt(2, max);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AllBoardVo avo = new AllBoardVo();
				avo.setAbtype(rs.getString("abtype"));
				avo.setAbidx(rs.getInt("abidx"));
				avo.setAbimage(rs.getString("abimage"));
				avo.setAbtitle(rs.getString("abtitle"));
				avo.setAbhit(rs.getInt("abhit"));
				avo.setAbwdate(rs.getDate("abwdate"));
				avo.setAbcontent(rs.getString("abcontent"));
				avo.setAbid(rs.getString("abid"));
				avo.setAbdeletest(rs.getInt("abdeletest"));
				ablist.add(avo);
			}
			
		}catch(Exception e) { 
			
		}finally {
			DBClose.close(con,pstmt,rs);
		}
			return ablist;
		}
    	
    
    
    @Override
    public ArrayList<AllBoardVo> getAllBoardMainList() {
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AllBoardVo> ablist = new ArrayList<AllBoardVo>();
		try {
			String sql = "select * from "
				+ 	"(select * from "
				+ 		"(select rownum rnum, AA.* from "
				+ 			"(select abtype, abidx, abtitle, abdeletest, abwdate from "
				+ 			"table_allboard where abdeletest=? order by abidx desc) AA) "
				+ 		"where rnum <= 5) "
				+ 	"where rnum >= 1";
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Values.NON_DEL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AllBoardVo avo = new AllBoardVo();
					
				avo.setAbtype(rs.getString("abtype"));
				avo.setAbidx(rs.getInt("abidx"));
				avo.setAbtitle(rs.getString("abtitle"));
				avo.setAbdeletest(rs.getInt("abdeletest"));
				avo.setAbwdate(rs.getDate("abwdate"));
				ablist.add(avo);
			}
			
		}catch(Exception e) { 
			
		}finally {
			DBClose.close(con,pstmt,rs);
		}
			return ablist;
		}
    
    
    @Override
    public AllBoardVo getAllBoard(int abidx) {
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AllBoardVo avo = null;
		try {
			String sql = "select tb.abtitle, tb.abhit, tb.abwdate, tb.abmdate , tb.abimage ,tb.abcontent,tb.abid from table_allboard tb where tb.abidx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, abidx);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				avo = new AllBoardVo();
				
				avo.setAbtitle(rs.getString(1));
				avo.setAbhit(rs.getInt(2));
				avo.setAbwdate(rs.getDate(3));
				avo.setAbmdate(rs.getDate(4));
				avo.setAbimage(rs.getString(5));
				avo.setAbcontent(rs.getString(6));
				avo.setAbid(rs.getString(7));
				}
			}catch(Exception e) { 
			
			}finally {
				DBClose.close(con,pstmt,rs);
				}
			return avo;
    		}

    

    @Override
    public int updateAllBoardHit(int abidx) {
	    	Connection con = dbconnect.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int count = 0;
		
    	try {
    		String sql = "update table_allboard set abhit = abhit + 1 where abidx = ?";
    		pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, abidx);
			rs = pstmt.executeQuery();
			
    		if(rs.next()){
    			count =rs.getInt(1);
    		}
    	}catch(Exception e) { 
    		
    	}	finally {
			DBClose.close(con,pstmt,rs);
    	}
    		return count;
    }

    @Override
    public int getPaging() {
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
    	int page_cnt = 0;
    	try {
    		String sql = "select count(*) from table_allboard where abdeletest = ?";
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
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
    	int page_cnt = 0;
    	try {
    		String sql = "select count(*) from table_allboard where abdeletest = ?";
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
