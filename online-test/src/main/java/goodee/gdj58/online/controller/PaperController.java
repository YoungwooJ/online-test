package goodee.gdj58.online.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.ExampleService;
import goodee.gdj58.online.service.PaperService;
import goodee.gdj58.online.vo.Example;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaperController {
	@Autowired PaperService paperService;
	@Autowired ExampleService exampleService;
	
	// 삭제
	@GetMapping("/paper/removePaper")
	public String removePaper(Model model
								, @RequestParam(value="paperNo", required = true) int paperNo
								, @RequestParam(value="studentNo", required = true) int studentNo) {
		paperService.removePaper(paperNo);
		return "redirect:/paper/paperList?studentNo="+studentNo;
	}
	
	// 수정 폼
	@GetMapping("/paper/modifyPaper")
	public String modifyPaper(Model model
								, @RequestParam(value="paperNo", required = true) int paperNo) {
		// Paper paper = paperService.getPaperOne(paperNo);
		// model.addAttribute("paper", paper);
		return "paper/modifyPaper";
	}
	// 수정 액션
	@PostMapping("/paper/modifyPaper")
	public String modifyPaper(Model model
								, @RequestParam(value="paperNo", required = true) int paperNo
								, @RequestParam(value="studentNo", required = true) int studentNo
								, @RequestParam(value="testNo", required = true) int testNo
								, @RequestParam(value="questionNo", required = true) int questionNo
								, @RequestParam(value="answer", required = true) String answer) {
		paperService.modifyPaper(paperNo, studentNo, testNo, questionNo, answer);
		
		return "redirect:/paper/paperList?studentNo="+studentNo;
	}
	
	// 입력
	@GetMapping("/paper/addPaper")
	public String addPaper() {	
		return "paper/addPaper";
	}
	@PostMapping("/paper/addPaper")
	public String addPaper(Model model
							, @RequestParam(value="studentNo", required = true) int studentNo[]
							, @RequestParam(value="testNo", required = true) int testNo[]
							, @RequestParam(value="questionNo", required = true) int questionNo[]
							, @RequestParam(value="answer", required = true) String answer[]
							, @RequestParam(value="submit", required = true) int submit[]) {
		int row = 0;
		int score = 0;
		String grade = "D";
		for(int i=0; i<studentNo.length; i++ ) {
			if(answer[i].equals("정답")) {
				score += 5;
			}
			row = paperService.addPaper(studentNo[i], testNo[i], questionNo[i], answer[i], submit[i]);
		}
		if(score >= 90) {
			grade = "A";
		} else if(score >= 80) {
			grade = "B";
		} else if(score >= 70) {
			grade = "C";
		} 
		// row != 0 이면 입력성공
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템에러로 등록실패하였습니다.");
			return "test/testList";
		}
		return "redirect:/score/addScore?studentNo="+studentNo[0]+"&testNo="+testNo[0]+"&score="+score+"&grade="+grade;
	}
	
	// 답안지 상세정보
	@GetMapping("/paper/paperOne")
	public String paperOne(Model model
							, @RequestParam(value="studentNo", required = false) int studentNo
							, @RequestParam(value="testNo", required = false) int testNo
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue= "20") int rowPerPage) { 
							// int currentPage = request.getParameter("currentPage");
		log.debug("\u001B[31m"+currentPage+"<-- currentPage");
		log.debug("\u001B[31m"+rowPerPage+"<-- rowPerPage");
		List<Map<String, Object>> list = paperService.getPaperOne(studentNo, testNo, currentPage, rowPerPage);
		
		int questionNo = 0;
		List<List<Example>> exList = new ArrayList<>();
		for(Map<String, Object> q : list) {
			questionNo = (Integer)q.get("questionNo");
			log.debug("questionNo : "+questionNo);
			List<Example> eList = exampleService.getExampleList(questionNo, currentPage, rowPerPage);
			exList.add(eList);
		}
		model.addAttribute("exList", exList);
		
		String testTitle = null;
		String studentName = null;
		int score = 0;
		String grade = null;
		for(Map<String, Object> m : list) {
			// System.out.println(m);
			testTitle = (String)(m.get("testTitle"));
			studentName = (String)(m.get("studentName"));
			score = (int)(m.get("score"));
			grade = (String)(m.get("grade"));
		}
		model.addAttribute("testTitle", testTitle);
		model.addAttribute("studentName", studentName);
		model.addAttribute("score", score);
		model.addAttribute("grade", grade);
		model.addAttribute("list", list);
		model.addAttribute("studentNo", studentNo);
		model.addAttribute("testNo", testNo);
		model.addAttribute("currentPage", currentPage);
		
		int count = paperService.getPaperCount();
		int endPage = (int)Math.ceil((double)count / (double)rowPerPage);
		// 블록 페이지
		// 현재 페이지가 속한 block의 시작 번호, 끝 번호를 계산
		int blockNum = (int)Math.floor((currentPage-1)/rowPerPage);
		int blockStartNum = (rowPerPage*blockNum) + 1;
		int blockLastNum = blockStartNum + (rowPerPage-1);
		
		model.addAttribute("startPage", 1);
		model.addAttribute("endPage", endPage);
		model.addAttribute("blockStartNum", blockStartNum);
		model.addAttribute("blockLastNum", blockLastNum);
		return "paper/paperOne";
	}
	
	// 리스트
	@GetMapping("/paper/paperList")
	public String paperList(Model model
							, @RequestParam(value="studentNo", defaultValue = "0") int studentNo
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue= "10") int rowPerPage) { 
							// int currentPage = request.getParameter("currentPage");
		log.debug("\u001B[31m"+currentPage+"<-- currentPage");
		log.debug("\u001B[31m"+rowPerPage+"<-- rowPerPage");
		List<Map<String, Object>> list = paperService.getPaperList(studentNo, currentPage, rowPerPage);
		model.addAttribute("list", list);
		if(studentNo != 0) {
			model.addAttribute("studentNo", studentNo);
		}
		model.addAttribute("currentPage", currentPage);
		
		int count = paperService.getPaperCount();
		int endPage = (int)Math.ceil((double)count / (double)rowPerPage);
		// 블록 페이지
		// 현재 페이지가 속한 block의 시작 번호, 끝 번호를 계산
		int blockNum = (int)Math.floor((currentPage-1)/rowPerPage);
		int blockStartNum = (rowPerPage*blockNum) + 1;
		int blockLastNum = blockStartNum + (rowPerPage-1);
		
		model.addAttribute("startPage", 1);
		model.addAttribute("endPage", endPage);
		model.addAttribute("blockStartNum", blockStartNum);
		model.addAttribute("blockLastNum", blockLastNum);
		return "paper/paperList";
	}
}
