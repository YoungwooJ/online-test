package goodee.gdj58.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.ExampleService;
import goodee.gdj58.online.vo.Example;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ExampleController {
	@Autowired ExampleService exampleService;
	
	// 삭제
	@GetMapping("/example/removeExample")
	public String removeExample(@RequestParam("exampleNo") int exampleNo) {
		exampleService.removeExample(exampleNo);
		return "redirect:/example/exampleList";
	}
	
	// 수정 폼
	@GetMapping("/example/modifyExample")
	public String modifyExample(Model model
			, @RequestParam(value="exampleNo", required = true) int exampleNo) {
		Example example = exampleService.getExampleOne(exampleNo);
		model.addAttribute("example", example);
		return "example/modifyExample";
	}
	// 수정 액션
	@PostMapping("/example/modifyExample")
	public String modifyExample(Example example) {
		exampleService.modifyExample(example);
		
		return "redirect:/example/modifyExample";
	}
	
	// 입력
	@GetMapping("/example/addExample")
	public String addExample(Model model
							, @RequestParam(value="questionNo", required = true) int questionNo) {
		model.addAttribute("questionNo", "questionNo");
		return "example/addExample";
	}
	@PostMapping("/example/addExample")
	public String addExample(Model model
							, @RequestParam(value="questionNo", required = true) int questionNo
							, @RequestParam(value="exampleIdx", required = true) int exampleIdx
							, @RequestParam(value="exampleTitle", required = true) String exampleTitle
							, @RequestParam(value="exampleOx", required = true) String exampleOx) {
		int row = exampleService.addExample(questionNo, exampleIdx, exampleTitle, exampleOx);
		// row == 1 이면 입력성공
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템에러로 등록실패하였습니다.");
			return "example/addExample";
		}
		return "redirect:/example/exampleList";
	}
	/*
	// 리스트
	@GetMapping("/example/exampleList")
	public String exampleList(Model model
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue= "5") int rowPerPage) { 
							// int currentPage = request.getParameter("currentPage");
		log.debug("\u001B[31m"+currentPage+"<-- currentPage");
		log.debug("\u001B[31m"+rowPerPage+"<-- rowPerPage");
		List<Example> exList = exampleService.getExampleList(currentPage, rowPerPage);
		// request.setAttribute("list", list);
		model.addAttribute("exList", exList);
		model.addAttribute("currentPage", currentPage);
		
		int count = exampleService.getExampleCount();
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
		return "question/questionList";
	}
	*/
}
