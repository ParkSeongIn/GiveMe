package service.talentboard;

import java.util.ArrayList;

public interface TalentBoardService {
	
	int insertTalentBoard(TalentBoardVo tvo);
	TalentBoardVo getTalentBoard(int tbidx); // con
	ArrayList<TalentBoardVo> getTalentBoardList(); // list
	TalentBoardVo TalentBoardmodifySe(int tbidx); // 게시글 수정 폼
	int modifyTalentBoard(TalentBoardVo tvo,int tbidx); // 수정
	int deleteTalentBoard(int tbidx);
	
	int updateTalentBoardHit(int tbidx);
	int getPaging();
	int modifyTalentBoardState(int tbidx); // 신청하기
	int modifyTalentBoardConfirm(int tbidx); // 신청자 확인
	
	int modifyTalentBoardEtime(int tbidx); // 관리자 매칭 확인
	int modifyTalentBoardCancle(int midx); // 신청 취소
	ArrayList<TalentBoardVo> TalentBoardMyList(int midx); // 마이페이지 재능기부 내역
	
	int TalentBoardDeleteCancle(int tbidx); // 작성자 제공 취소
	
	int replyTalentBoard(TalentBoardVo tvo);  // 답글
	TalentBoardVo TalentBoardModifyReplySe(int tbidx); // 답글 수정 폼 내용 뿌려주는곳
	int modifyTalentBoardReply(TalentBoardVo tvo, int tbidx); // 답글 수정 내용 작성 후 넘겨주는곳
}