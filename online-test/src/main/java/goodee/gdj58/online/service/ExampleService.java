package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.ExampleMapper;
import goodee.gdj58.online.vo.Example;

@Service
@Transactional
public class ExampleService {
	@Autowired private ExampleMapper exampleMapper;
	
	public int getExampleCount() {
		return exampleMapper.selectExampleCount();
	}
	
	public int removeExample(int exampleNo) {
		return exampleMapper.deleteExample(exampleNo);
	}
	
	public int modifyExample(int exampleNo, int exampleIdx, String exampleTitle, String exampleOx) {
		Example example = new Example();
		example.setExampleNo(exampleNo);
		example.setExampleIdx(exampleIdx);
		example.setExampleTitle(exampleTitle);
		example.setExampleOx(exampleOx);
		return exampleMapper.updateExample(example);
	}
	
	public int addExample(int questionNo, int exampleIdx, String exampleTitle, String exampleOx) {
		Example example = new Example();
		example.setQuestionNo(questionNo);
		example.setExampleIdx(exampleIdx);
		example.setExampleTitle(exampleTitle);
		example.setExampleOx(exampleOx);
		return exampleMapper.insertExample(example);
	}
	
	public Example getExampleOne(int exampleNo) {
		return exampleMapper.selectExampleOne(exampleNo);
	}
	
	public List<Example> getExampleList(int questionNo, int currentPage, int rowPerPage){
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("questionNo", questionNo);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return exampleMapper.selectExampleList(paramMap);
	}
}