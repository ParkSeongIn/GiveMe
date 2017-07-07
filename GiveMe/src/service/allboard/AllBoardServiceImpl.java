package service.allboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBConnect;
import common.DBClose;


public class AllBoardServiceImpl implements AllBoardService{

    DBConnect dbconnect = null; 
    String sql="";
    
    public AllBoardServiceImpl(){
	dbconnect = new DBConnect();
    }
    
    @Override
    public ArrayList<AllBoardVo> getAllBoardList(String abtype) {
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AllBoardVo> ablist = new ArrayList<AllBoardVo>();
		try {
			String sql = "select * from ("
							+ "select * from ("
								+ "select rownum rnum, AA.* "
								+ "from ( select tb.abidx,tb.abimage,tb.abtitle,tb.abhit,tb.midx,tb.abwdate,tb.abdeletest,tb.abcontent "
									+ "from table_allboard tb,table_member tm "
									+ "where tb.midx = tm.midx and tb.abtype = ? and tb.abdeletest = 'N' "
									+ "order by tb.abidx asc"
									+ ") AA "
									+ ") where rnum <= 5"
									+ ") where rnum >= 1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, abtype);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AllBoardVo avo = new AllBoardVo();
				
				avo.setAbidx(rs.getInt(2));
				avo.setAbimage(rs.getString(3));
				avo.setAbtitle(rs.getString(4));
				avo.setAbhit(rs.getInt(5));
				avo.setMidx(rs.getInt(6));
				avo.setAbwdate(rs.getDate(7));
				avo.setAbdeletest(rs.getString(8));
				avo.setAbcontent(rs.getString(9));
				ablist.add(avo);
			}
			
		}	catch(Exception e) { 
				
		}	finally {
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
			String sql = "select tb.abtitle, tm.midx, tb.abhit, tb.abwdate, tb.abmdate,tb.abimage,tb.abcontent from table_allboard tb,table_member tm where tb.midx = tm.midx and tb.abidx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, abidx);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				avo = new AllBoardVo();
				
				avo.setAbtitle(rs.getString(1));
				avo.setMidx(rs.getInt(2));
				avo.setAbhit(rs.getInt(3));
				avo.setAbwdate(rs.getDate(4));
				avo.setAbmdate(rs.getDate(5));
				avo.setAbimage(rs.getString(6));
				avo.setAbcontent(rs.getString(7));
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
    public int getPaging(String abtype) {
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
    	int p = 0;
    	try {
    		String sql = "select Count(*) from table_allboard where abdeletest = 'N' and abtype = ?";
    		pstmt = con.prepareStatement(sql);
			pstmt.setString(1, abtype);
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
}
