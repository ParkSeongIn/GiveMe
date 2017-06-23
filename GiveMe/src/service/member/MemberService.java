package service.member;

public interface MemberService {
	
	int insertMember();
	MemberVo getMember();
	MemberVo modifyMember();
	boolean checkLogin();
	int totalPoint();
	int modifyMemberValue();
	
}
