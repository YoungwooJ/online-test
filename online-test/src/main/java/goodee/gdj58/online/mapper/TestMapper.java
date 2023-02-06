package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Test;

@Mapper
public interface TestMapper {
	int selectTestCount(String searchWord);
	int deleteTest(int testNo);
	int updateTest(Test test);
	int insertTest(String testTitle);
	Test selectTestOne(int testNo);
	List<Test> selectTestList(Map<String, Object> paramMap);
}
