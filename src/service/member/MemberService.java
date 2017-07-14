package service.member;

public interface MemberService {
	
	int insertMember(MemberVo vo);	//회원가입 insert 메소드
	MemberVo getMember(int midx);	//회원정보(이용자+관리자) 불러오는 메소드
	MemberVo modifyMember(int midx);	//이용자 회원정보 수정 메소드
	MemberVo getMember(String mid);
	int modifyupdateMember(MemberVo vo);
	int checkLogin(String mid, String mpwd);	//boolean이었으나 데이터 타입을 int로 수정함.
	int totalPoint();
	int modifyMemberValue();
	boolean checkId(String mid);	//아이디 중복 검사 메소드.
	String findMid(MemberVo vo);
	MemberVo findMidGetCon(MemberVo vo); 
	boolean findMpwd(MemberVo vo);
	MemberVo findMpwdGetCon(MemberVo vo);
	int passwordupdateMember(String mid, String mpwd);
	int deleteMember(int midx);
	
	
	
	
	
}
