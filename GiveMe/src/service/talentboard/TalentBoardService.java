package service.talentboard;

import java.util.ArrayList;

public interface TalentBoardService {
	
	int insertTalentBoard();
	TalentBoardVo getTalentBoard();
	ArrayList<TalentBoardVo> getTalentBoardList();
	TalentBoardVo modifyTalentBoard();
	int deleteTalentBoard();
	TalentBoardVo replyTalentBoard();
	int updateTalentBoardHit();
	int getPaging();
	int modifyTalentBoardState();
	int modifyYalentBoardConfirm();	
}
