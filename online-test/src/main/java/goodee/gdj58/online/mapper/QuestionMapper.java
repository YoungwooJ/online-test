package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Question;

@Mapper
public interface QuestionMapper {
	int selectQuestionCount();
	int deleteQuestion(int questionNo);
	int updateQuestion(Question question);
	int insertQuestion(Question question);
	Question selectQuestionOne(int questionNo);
	List<Question> selectQuestionList(Map<String, Object> paramMap);
}
