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
    public ArrayList<AllBoardVo> getAllBoardList(String keyField, String keyWord) {
    	Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AllBoardVo> ablist = new ArrayList<AllBoardVo>();
		try {
			String sql = "select * from "
				+ 	"(select * from "
				+ 		"(select rownum rnum, AA.* from "
				+ 			"(select abtype, abidx, abimage, abtitle, abhit, abwdate, abdeletest, abcontent, abid from "
				+ 			"table_allboard where abdeletest='N' order by abidx desc) AA) "
				+ 		"where rnum <= 10) "
				+ 	"where rnum >= 1";
			
			if(keyWord != null && !keyWord.equals("") ){
				sql +=" and "+keyField.trim()+" like '%"+keyWord.trim()+"%' order by abidx desc";
			}else{
			//	alert("검색 키워드와 일치한 내용을 찾지 못했습니다.");	
				sql +=" order by abidx desc";
			}
			
			pstmt = con.prepareStatement(sql);
				
	//		pstmt.setString(1, abtype);
				System.out.println("A");
	//		pstmt.setString(2, keyField);
				System.out.println("C");
	//		pstmt.setString(3, keyWord);
			rs = pstmt.executeQuery();
				System.out.println(sql);
			
			while(rs.next()) {
				AllBoardVo avo = new AllBoardVo();
				//	System.out.println("나오냐");
					
				avo.setAbtype(rs.getString("abtype"));
				avo.setAbidx(rs.getInt("abidx"));
				avo.setAbimage(rs.getString("abimage"));
				avo.setAbtitle(rs.getString("abtitle"));
				avo.setAbhit(rs.getInt("abhit"));
				avo.setAbwdate(rs.getDate("abwdate"));
				avo.setAbdeletest(rs.getString("abdeletest"));
				avo.setAbcontent(rs.getString("abcontent"));
				avo.setAbid(rs.getString("abid"));
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
