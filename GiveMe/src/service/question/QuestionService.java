package service.question;

import java.util.ArrayList;

public interface QuestionService {
	
	int getPaging();
	int insertQuestion(QuestionVo vo);
	ArrayList<QuestionVo> getQuestionList(int midx);
	int modifyWriteQuestion(QuestionVo qv);
	QuestionVo getQuestion(int qidx, int midx);
//	int deleteQuestion(int qidx);
	int deleteQuestion(int qidx, int midx);

}
