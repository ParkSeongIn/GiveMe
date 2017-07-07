package service.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.plaf.synth.SynthSeparatorUI;

import common.DBClose;
import common.DBConnect;
import common.Values;

public class MemberServiceImpl implements MemberService{
    
    // 싱글톤 패턴
    private static MemberServiceImpl instance = new MemberServiceImpl();
    
    public static MemberServiceImpl getInstance(){
        if(instance==null)
            instance=new MemberServiceImpl();
        return instance;
    }

    DBConnect dbconnect = null;	
    String sql="";	
    
    public MemberServiceImpl(){	
	dbconnect = new DBConnect();	
    }
    
    // 회원가입 처리
    @Override
    public int insertMember(MemberVo vo) {		
	Connection con = dbconnect.getConnection();	
	PreparedStatement pstmt = null;	
	
	int row = 0;	
	
	try{
	    sql="insert into table_member (midx,mid,mpwd,mname,mbirth,mphone,mmail,mpost,maddr1,maddr2,"
	    	+ "mgrade, mvalue,mpoint, mcanclecash, menter, mmdate,mbreakdate,mdbdate)"
	    	+ "values(seq_midx.nextval,?,?,?,?,?,?,?,?,?,?,?,0,sysdate,sysdate,sysdate,sysdate,sysdate)";
	    pstmt = con.prepareStatement(sql);	
	    	    
	    pstmt.setString(1, vo.getMid());	
	    pstmt.setString(2, vo.getMpwd());
	    pstmt.setString(3, vo.getMname());
	    pstmt.setInt(4, vo.getMbirth());
	    pstmt.setInt(5, vo.getMphone());
	    pstmt.setString(6, vo.getMmail());
	    pstmt.setInt(7, vo.getMpost());
	    pstmt.setString(8, vo.getMaddr1());
	    pstmt.setString(9, vo.getMaddr2());
	    pstmt.setString(10, Values.grade_guest);	
	    pstmt.setString(11, Values.value_in);	
	    row=pstmt.executeUpdate();	//execute를 실행한 후 값을 row에 담는다.
	
	}catch(Exception e){
	    System.out.println(e.getMessage());
	}finally{
	    DBClose.close(con, pstmt);	
	}
	return row;
    }   
	   
    // idx를 이용해 회원정보 출력
    @Override
    public MemberVo getMember(int midx) {	//회원관리-Content
	// TODO Auto-generated method stub
	Connection con = dbconnect.getConnection();	// con은 dbconnect 파일에 있는 getconnection을 불러옴.
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	MemberVo vo = null;	// 리턴값 vo가 메소드 내 지역변수이므로 가장 위로 빼서 맞춰줌
	
	try{
	    String sql = "select mgrade, midx, mid, "
	    	+ "mpwd, mname, mbirth, mphone, mmail, mpost, "
	    	+ "maddr1, maddr2, menter, mmdate, mbreakdate, mpoint "
	    	+ "from table_member where midx = ?";
	    
	    pstmt=con.prepareStatement(sql);
	    pstmt.setInt(1, midx);
	    rs=pstmt.executeQuery();
	    
	   
	    
	    if(rs.next()){	// next = 쿼리를 실행해서 다음의 값이 있는지 확인
		vo = new MemberVo();
		
		vo.setMgrade(Values.grade_guest);
		vo.setMidx(rs.getInt("midx"));
		vo.setMid(rs.getString("mid"));
		vo.setMpwd(rs.getString("mpwd"));
		vo.setMname(rs.getString("mname"));
		vo.setMbirth(rs.getInt("mbirth"));
		vo.setMphone(rs.getInt("mphone"));
		vo.setMmail(rs.getString("mmail"));
		vo.setMpost(rs.getInt("mpost"));
		vo.setMaddr1(rs.getString("maddr1"));
		vo.setMaddr2(rs.getString("maddr2"));
		vo.setMenter(rs.getDate("menter"));
		vo.setMmdate(rs.getDate("mmdate"));
		vo.setMbreakdate(rs.getDate("mbreakdate"));
		vo.setMpoint(rs.getInt("mpoint"));
		
	    }
	}catch(Exception e){
	    System.out.println(e.getMessage());
	}finally{
	    DBClose.close(con, pstmt, rs);
	}
	
	return vo;
    }
    @Override
    public MemberVo getMember(String mid){
    	Connection con = dbconnect.getConnection();	// con은 dbconnect 파일에 있는 getconnection을 불러옴.
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	MemberVo vo = null;	// 리턴값 vo가 메소드 내 지역변수이므로 가장 위로 빼서 맞춰줌
    	
    	try{
    	    String sql = "select mgrade, midx, mid, "
    	    	+ "mpwd, mname, mbirth, mphone, mmail, mpost, "
    	    	+ "maddr1, maddr2, menter, mmdate, mbreakdate, mpoint "
    	    	+ "from table_member where mid = ?";
    	    
    	    pstmt=con.prepareStatement(sql);
    	    pstmt.setString(1, mid);
    	    rs=pstmt.executeQuery();
    	    
    	   
    	    
    	    if(rs.next()){	// next = 쿼리를 실행해서 다음의 값이 있는지 확인
    		vo = new MemberVo();
    		
    		vo.setMgrade(rs.getString("mgrade"));
    		vo.setMidx(rs.getInt("midx"));
    		vo.setMid(rs.getString("mid"));
    		vo.setMpwd(rs.getString("mpwd"));
    		vo.setMname(rs.getString("mname"));
    		vo.setMbirth(rs.getInt("mbirth"));
    		vo.setMphone(rs.getInt("mphone"));
    		vo.setMmail(rs.getString("mmail"));
    		vo.setMpost(rs.getInt("mpost"));
    		vo.setMaddr1(rs.getString("maddr1"));
    		vo.setMaddr2(rs.getString("maddr2"));
    		vo.setMenter(rs.getDate("menter"));
    		vo.setMmdate(rs.getDate("mmdate"));
    		vo.setMbreakdate(rs.getDate("mbreakdate"));
    		vo.setMpoint(rs.getInt("mpoint"));
    		
    	    }
    	}catch(Exception e){
    	    System.out.println(e.getMessage());
    	}finally{
    	    DBClose.close(con, pstmt, rs);
    	}
    	
    	return vo;
    }
    @Override
    public MemberVo modifyMember(int midx) {//개인정보수정에서 불러올 정보 메소드
	// TODO Auto-generated method stub
	Connection con = dbconnect.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	MemberVo vo = null;	
	
	try{
	    String sql="select midx, mid, "
		+ "mpwd, mname, mbirth, mphone, mmail, mpost, "
		+ "maddr1, maddr2, menter, mmdate, mbreakdate, mpoint "
		+ "from table_member where midx = ?";
	    
	    pstmt=con.prepareStatement(sql);
	    pstmt.setInt(1, midx);
	    rs=pstmt.executeQuery();
	    
	    if(rs.next()){	// next = 쿼리를 실행해서 다음의 값이 있는지 확인
		vo = new MemberVo();
		
		vo.setMidx(rs.getInt("midx"));
		vo.setMid(rs.getString("mid"));
		vo.setMpwd(rs.getString("mpwd"));
		vo.setMname(rs.getString("mname"));
		vo.setMbirth(rs.getInt("mbirth"));
		vo.setMphone(rs.getInt("mphone"));
		vo.setMmail(rs.getString("mmail"));
		vo.setMpost(rs.getInt("mpost"));
		vo.setMaddr1(rs.getString("maddr1"));
		vo.setMaddr2(rs.getString("maddr2"));
		vo.setMenter(rs.getDate("menter"));
		vo.setMmdate(rs.getDate("mmdate"));
		vo.setMbreakdate(rs.getDate("mbreakdate"));
		vo.setMpoint(rs.getInt("mpoint"));
		
	    }    
	    
	}catch(Exception e){
	    System.out.println(e.getMessage());
	}finally{
	    DBClose.close(con,pstmt, rs);
	}	
	return vo;
    }
    
    @Override
    public int modifyupdateMember(MemberVo vo) {
	// TODO Auto-generated method stub
	Connection con = dbconnect.getConnection();
	PreparedStatement pstmt = null;
	
	int row = 0;
	try{
	    String sql="update table_member "
	    	+ "set  mpwd=?, "
	    	+ "mphone=?, mmail=?, mpost=?, "
	    	+ "maddr1=?, maddr2=?, mmdate=sysdate, "
	    	+ "mbreakdate=sysdate "
	    	+ "where midx=?";
	    
	    pstmt=con.prepareStatement(sql);
	    
	    pstmt.setString(2, vo.getMpwd());
	    pstmt.setInt(3, vo.getMphone());
	    pstmt.setString(4, vo.getMmail());
	    pstmt.setInt(5, vo.getMpost());
	    pstmt.setString(6, vo.getMaddr1());
	    pstmt.setString(7, vo.getMaddr2());	    
	    pstmt.setInt(8, vo.getMidx());
	    
	    row = pstmt.executeUpdate();
	    
	}catch(Exception e){
	    System.out.println(e.getMessage());
	}finally{
	    DBClose.close(con, pstmt);
	}	
	return row;
    }
    
    
    @Override	//로그인 시 아이디, 비밀번호 체크 메소드.
    public int checkLogin(String mid, String mpwd) {
	// TODO Auto-generated method stub
	Connection con = dbconnect.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	int result = 0;
	try{  	    
	    String sql="select mpwd "
	    	+ "from table_member "
	    	+ "where mid=?";    	
	    
	    pstmt=con.prepareStatement(sql);
	    pstmt.setString(1, mid);	    
	    rs=pstmt.executeQuery();
	    
	    boolean chk = rs.next();
	    
	    if(chk == false){
	    	result = Values.login_fali_id;
	    }else{
	    	String get_pwd = rs.getString("mpwd");
	    
	    	if(get_pwd.equals(mpwd)){
	    	result = Values.login_success;
	    }else{
	    	result = Values.login_fail_pw;
	    }
	    }
	
	}catch(Exception e){
	    System.out.println("CheckLogin error" + e);
	}finally{
	    DBClose.close(con, pstmt, rs);
	}
	return result;
    }
    
    @Override	//Id 중복체크 메소드
    public boolean checkId(String mid) {
	// TODO Auto-generated method stub
	Connection con = dbconnect.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	boolean x = true;
	
	try{
	    String sql="select mid "
		    	+ "from table_member "
		    	+ "where mid=?";
	    
	    pstmt=con.prepareStatement(sql);
	    pstmt.setString(1, mid);
	    rs=pstmt.executeQuery(); 
	    
	   x = rs.next();     
	    
	}catch(Exception e){
	    System.out.println(e.getMessage());
	}finally{
	    DBClose.close(con, pstmt, rs);
	}
	return x;	  
	
    }   


    @Override
    public int totalPoint() {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public int modifyMemberValue() {
	// TODO Auto-generated method stub
	return 0;
    }


    @Override
    public String findMid(MemberVo vo) {
	// TODO Auto-generated method stub
	Connection con = dbconnect.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String mid = null;
	
	try{  	    
	    String sql="select mid "
	    	+ "from table_member "
	    	+ "where mname=? and mphone=?";    	
	    
	    pstmt=con.prepareStatement(sql);
	    pstmt.setString(1, vo.getMname());
	    pstmt.setInt(2, vo.getMphone());
	    rs=pstmt.executeQuery();
	    
	    
	    if(rs.next()){
	    	mid = rs.getString("mid");
	    }
	}catch(Exception e){
	    System.out.println(e.getMessage());
	}finally{
	    DBClose.close(con, pstmt, rs);
	}
	return mid;	
    }

    @Override
    public MemberVo findMidGetCon(MemberVo vo) {
    	// TODO Auto-generated method stub
    	Connection con = dbconnect.getConnection();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	MemberVo mvo = new MemberVo();
    	
    	try{  	    
    	    String sql="select mid "
    	    	+ "from table_member "
    	    	+ "where mname=? and mphone=?";    	
    	    
    	    pstmt=con.prepareStatement(sql);
    	    pstmt.setString(1, vo.getMname());
    	    pstmt.setInt(2, vo.getMphone());
    	    rs=pstmt.executeQuery();
    	  
    	while(rs.next()){
    	    mvo.setMid(rs.getString("mid"));
    	}
    		
    	}catch(Exception e){
    	    System.out.println(e.getMessage());
    	}finally{
    	    DBClose.close(con, pstmt, rs);
    	}
    	return mvo;	
        }
   
    @Override
    public boolean findMpwd(MemberVo vo) {
	// TODO Auto-generated method stub
	Connection con = dbconnect.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	boolean chk= true;
	
	try{  	    
	    String sql="select mpwd, mid, mname, mphone "
	    	+ "from table_member "
	    	+ "where mid=? and mname=? and mphone=?";    	
	    
	    pstmt=con.prepareStatement(sql);
	    pstmt.setString(1, vo.getMid());
	    pstmt.setString(2, vo.getMname());
	    pstmt.setInt(3, vo.getMphone());
	    rs=pstmt.executeQuery();
	    	
	    chk = rs.next();
		
	}catch(Exception e){
	    System.out.println(e.getMessage());
	}finally{
	    DBClose.close(con, pstmt, rs);
	}
	return chk;	
    }


    @Override
    public MemberVo findMpwdGetCon(MemberVo vo) {
	// TODO Auto-generated method stub
	Connection con = dbconnect.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	MemberVo mvo = new MemberVo();
	
	try{  	    
	    String sql="select mpwd "
	    	+ "from table_member "
	    	+ "where mid=? and mname=? and mphone=?";    	
	    
	    pstmt=con.prepareStatement(sql);
	    pstmt.setString(1, vo.getMid());
	    pstmt.setString(2, vo.getMname());
	    pstmt.setInt(3, vo.getMphone());
	    rs=pstmt.executeQuery();
	  
	while(rs.next()){
	    mvo.setMpwd(rs.getString("mpwd"));
	}
		
	}catch(Exception e){
	    System.out.println(e.getMessage());
	}finally{
	    DBClose.close(con, pstmt, rs);
	}
	return mvo;	
    }
    @Override
    public int passwordupdateMember(String mid, String mpwd) {
	// TODO Auto-generated method stub
	Connection con = dbconnect.getConnection();
	PreparedStatement pstmt = null;
	int result = 0;
	
	try{
	    String sql="update table_member "
	    	+ "set mpwd=? "	    	
	    	+ "where mid=?";
	    
	    pstmt=con.prepareStatement(sql);
	    
	    pstmt.setString(1, mpwd);	    	    
	    pstmt.setString(2, mid);
	   	   
	 result=pstmt.executeUpdate();
	    
	}catch(Exception e){
	    System.out.println(e.getMessage());
	}finally{
	    DBClose.close(con, pstmt);
	}
	return result;
	
    }
	
	
	
	
	
   

}
