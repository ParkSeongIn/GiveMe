package service.question;

import java.util.ArrayList;

public interface QuestionService {
	
//	int insertQuestion();
//	QuestionVo getQuestion();
//	ArrayList<QuestionVo> getQuestionList();
	QuestionVo modfiyQuestion();
	int deleteQuestion();
	int getPaging();
	int insertQuestion(QuestionVo vo);
	ArrayList<QuestionVo> getQuestionList(int midx);
	QuestionVo getQuestion(int midx);
}
