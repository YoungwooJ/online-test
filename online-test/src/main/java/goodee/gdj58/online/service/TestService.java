package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TestMapper;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
public class TestService {
	@Autowired private TestMapper testMapper;
	
	public int getTestCount(String searchWord) {
		return testMapper.selectTestCount(searchWord);
	}
	
	public int removeTest(int testNo) {
		return testMapper.deleteTest(testNo);
	}
	
	public int modifyTest(int testNo, String testTitle) {
		Test test = new Test();
		test.setTestNo(testNo);
		test.setTestTitle(testTitle);
		return testMapper.updateTest(test);
	}
	
	public int addTest(String testTitle) {
		return testMapper.insertTest(testTitle);
	}
	
	public Test getTestOne(int testNo) {
		return testMapper.selectTestOne(testNo);
	}
	
	public List<Test> getTestList(String searchWord, int currentPage, int rowPerPage){
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return testMapper.selectTestList(paramMap);
	}
}