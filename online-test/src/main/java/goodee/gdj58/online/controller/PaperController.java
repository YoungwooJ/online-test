package goodee.gdj58.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.PaperService;
import goodee.gdj58.online.vo.Paper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaperController {
	@Autowired PaperService paperService;
	
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
		Paper paper = paperService.getPaperOne(paperNo);
		model.addAttribute("paper", paper);
		return "paper/modifyPaper";
	}
	// 수정 액션
	@PostMapping("/paper/modifyPaper")
	public String modifyPaper(Model model
								, @RequestParam(value="paperNo", required = true) int paperNo
								, @RequestParam(value="studentNo", required = true) int studentNo
								, @RequestParam(value="questionNo", required = true) int questionNo
								, @RequestParam(value="answer", required = true) int answer) {
		paperService.modifyPaper(paperNo, studentNo, questionNo, answer);
		
		return "redirect:/paper/paperList?studentNo="+studentNo;
	}
	
	// 입력
	@GetMapping("/paper/addPaper")
	public String addPaper() {	
		return "paper/addPaper";
	}
	@PostMapping("/paper/addPaper")
	public String addPaper(Model model
							, @RequestParam(value="studentNo", required = true) int studentNo
							, @RequestParam(value="questionNo", required = true) int questionNo
							, @RequestParam(value="answer", required = true) int answer) {
		int row = paperService.addPaper(studentNo, questionNo, answer);
		// row == 1 이면 입력성공
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템에러로 등록실패하였습니다.");
			return "question/questionList";
		}
		return "redirect:/paper/paperList?studentNo="+studentNo;
	}
	
	// 리스트
	@GetMapping("/paper/paperList")
	public String paperList(Model model
							, @RequestParam(value="studentNo", required = true) int studentNo
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue= "10") int rowPerPage) { 
							// int currentPage = request.getParameter("currentPage");
		log.debug("\u001B[31m"+currentPage+"<-- currentPage");
		log.debug("\u001B[31m"+rowPerPage+"<-- rowPerPage");
		List<Paper> list = paperService.getPaperList(studentNo, currentPage, rowPerPage);
		model.addAttribute("list", list);
		model.addAttribute("studentNo", studentNo);
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
