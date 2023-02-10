package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.PaperMapper;
import goodee.gdj58.online.vo.Paper;

@Service
@Transactional
public class PaperService {
	@Autowired private PaperMapper paperMapper;
	
	public int getPaperCount() {
		return paperMapper.selectPaperCount();
	}
	
	public int removePaper(int paperNo) {
		return paperMapper.deletePaper(paperNo);
	}
	
	public int modifyPaper(int paperNo, int studentNo, int testNo, int questionNo, String answer) {
		Paper paper = new Paper();
		paper.setPaperNo(paperNo);
		paper.setStudentNo(studentNo);
		paper.setQuestionNo(questionNo);
		paper.setTestNo(testNo);
		paper.setAnswer(answer);
		return paperMapper.updatePaper(paper);
	}
	
	public int addPaper(int studentNo, int testNo, int questionNo, String answer) {
		Paper paper = new Paper();
		paper.setStudentNo(studentNo);
		paper.setQuestionNo(questionNo);
		paper.setTestNo(testNo);
		paper.setAnswer(answer);
		return paperMapper.insertPaper(paper);
	}
	
	public List<Map<String, Object>> getPaperOne(int studentNo, int testNo, int currentPage, int rowPerPage) {
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("studentNo", studentNo);
		paramMap.put("testNo", testNo);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return paperMapper.selectPaperOne(paramMap);
	}
	
	public List<Map<String, Object>> getPaperList(int studentNo, int currentPage, int rowPerPage){
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("studentNo", studentNo);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return paperMapper.selectPaperList(paramMap);
	}
}