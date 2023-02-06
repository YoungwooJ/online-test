package goodee.gdj58.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.TestService;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	@Autowired TestService testService;
	
	// 삭제
	@GetMapping("/test/removeTest")
	public String removeTest(@RequestParam("testNo") int testNo) {
		testService.removeTest(testNo);
		return "redirect:/test/testList"; // 리스트로 리다이렉트
	}
	
	// 수정 폼
	@GetMapping("/test/modifyTest")
	public String modifyTest(int testNo) {
		testService.getTestOne(testNo);
		
		return "test/modifyTest";
	}
	// 수정 액션
	@PostMapping("/test/modifyTest")
	public String modifyTest(@RequestParam(value="testNo", required = true) int testNo
							, @RequestParam(value="testTitle", required = true) String testTitle) {
		testService.modifyTest(testNo, testTitle);
		
		return "redirect:/test/modifyTest";
	}
	
	// 입력
	@GetMapping("/test/addTest")
	public String addTest() {	
		return "test/addTest"; // forward
	}
	@PostMapping("/test/addTest")
	public String addTest(Model model
							, @RequestParam(value="testTitle", required = true) String testTitle) {
		int row = testService.addTest(testTitle);
		// row == 1 이면 입력성공
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템에러로 등록실패하였습니다.");
			return "test/addTest";
		}
		return "redirect:/test/testList";
	}
	
	// 리스트
	@GetMapping("/test/testList")
	public String testList(Model model
							, @RequestParam(value="searchWord", defaultValue = "") String searchWord
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue= "10") int rowPerPage) { 
							// int currentPage = request.getParameter("currentPage");
		log.debug("\u001B[31m"+currentPage+"<-- currentPage");
		log.debug("\u001B[31m"+rowPerPage+"<-- rowPerPage");
		log.debug("\u001B[31m"+searchWord+"<-- searchWord");
		List<Test> list = testService.getTestList(searchWord, currentPage, rowPerPage);
		// request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		
		int count = testService.getTestCount(searchWord);
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
		return "test/testList";
	}
}
