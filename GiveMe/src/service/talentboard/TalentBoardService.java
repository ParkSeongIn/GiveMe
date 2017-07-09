package service.talentboard;

import java.util.ArrayList;

public interface TalentBoardService {
	
	int insertTalentBoard(TalentBoardVo tvo);
	TalentBoardVo getTalentBoard(int tbidx);
	ArrayList<TalentBoardVo> getTalentBoardList();
	TalentBoardVo TalentBoardmodifySe(int tbidx);
	int modifyTalentBoard(TalentBoardVo tvo,int tbidx);
	int deleteTalentBoard(int tbidx);
	
	int replyTalentBoard(TalentBoardVo tvo);
	
	int updateTalentBoardHit(int tbidx);
	int getPaging();
	int modifyTalentBoardState(int tbidx);
	int modifyTalentBoardConfirm(int tbidx);
	
	int modifyTalentBoardEtime(int tbidx);
	int modifyTalentBoardCancle(int midx);
	ArrayList<TalentBoardVo> TalentBoardMyList(int midx);
}
