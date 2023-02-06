package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.QuestionMapper;
import goodee.gdj58.online.vo.Question;

@Service
@Transactional
public class QuestionService {
	@Autowired private QuestionMapper questionMapper;
	
	public int getQuestionCount() {
		return questionMapper.selectQuestionCount();
	}
	
	public int removeQuestion(int questionNo) {
		return questionMapper.deleteQuestion(questionNo);
	}
	
	public int modifyQuestion(int questionNo, int questionIdx, String questionTitle) {
		Question question = new Question();
		question.setQuestionNo(questionNo);
		question.setQuestionIdx(questionIdx);
		question.setQuestionTitle(questionTitle);
		return questionMapper.updateQuestion(question);
	}
	
	public int addQuestion(int testNo, int questionIdx, String questionTitle) {
		Question question = new Question();
		question.setTestNo(testNo);
		question.setQuestionIdx(questionIdx);
		question.setQuestionTitle(questionTitle);
		return questionMapper.insertQuestion(question);
	}
	
	public Question getQuestionOne(int questionNo) {
		return questionMapper.selectQuestionOne(questionNo);
	}
	
	public List<Question> getQuestionList(int testNo, int currentPage, int rowPerPage){
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return questionMapper.selectQuestionList(paramMap);
	}
}
