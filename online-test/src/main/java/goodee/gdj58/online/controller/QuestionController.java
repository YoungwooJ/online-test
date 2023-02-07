package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.ExampleService;
import goodee.gdj58.online.service.QuestionService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {
	@Autowired QuestionService questionService;
	@Autowired ExampleService exampleService;
	
	// 삭제
	@GetMapping("/question/removeQuestion")
	public String removeQuestion(Model model
								, @RequestParam(value="testNo", required = true) int testNo
								, @RequestParam("questionNo") int questionNo) {
		questionService.removeQuestion(questionNo);
		return "redirect:/question/questionList?testNo="+testNo;
	}
	
	// 수정 폼
	@GetMapping("/question/modifyQuestion")
	public String modifyQuestion(Model model
								, @RequestParam(value="testNo", required = true) int testNo
								, @RequestParam(value="questionNo", required = true) int questionNo) {
		Question question = questionService.getQuestionOne(questionNo);
		model.addAttribute("question", question);
		model.addAttribute("testNo", testNo);
		return "question/modifyQuestion";
	}
	// 수정 액션
	@PostMapping("/question/modifyQuestion")
	public String modifyQuestion(Model model
								, @RequestParam(value="testNo", required = true) int testNo
								, @RequestParam(value="questionNo", required = true) int questionNo
								, @RequestParam(value="questionIdx", required = true) int questionIdx
								, @RequestParam(value="questionTitle", required = true) String questionTitle) {
		questionService.modifyQuestion(questionNo, questionIdx, questionTitle);
		
		return "redirect:/question/questionList?testNo="+testNo;
	}
	
	// 입력
	@GetMapping("/question/addQuestion")
	public String addQuestion(Model model
							, @RequestParam(value="testNo", required = true) int testNo) {	
		model.addAttribute("testNo", testNo);
		return "question/addQuestion";
	}
	@PostMapping("/question/addQuestion")
	public String addQuestion(Model model
							, @RequestParam(value="testNo", required = true) int testNo
							, @RequestParam(value="questionIdx", required = true) int questionIdx
							, @RequestParam(value="questionTitle", required = true) String questionTitle) {
		int row = questionService.addQuestion(testNo, questionIdx, questionTitle);
		// row == 1 이면 입력성공
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템에러로 등록실패하였습니다.");
			return "question/addQuestion";
		}
		return "redirect:/question/questionList?testNo="+testNo;
	}
	
	// question, example 리스트, add paper
	@GetMapping("/question/questionList")
	public String questionList(Model model
							, HttpSession session
							, @RequestParam(value="testNo", required = true) int testNo
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue= "10") int rowPerPage) { 
							// int currentPage = request.getParameter("currentPage");
		log.debug("\u001B[31m"+currentPage+"<-- currentPage");
		log.debug("\u001B[31m"+rowPerPage+"<-- rowPerPage");
		List<Question> qList = questionService.getQuestionList(testNo, currentPage, rowPerPage);
		int questionNo = 0;
		for(Question q : qList) {
			questionNo = q.getQuestionNo();
			List<Example> exList = exampleService.getExampleList(questionNo, currentPage, rowPerPage);
			model.addAttribute("exList", exList);
		}
		/*
		List<Example> exList = exampleService.getExampleList(questionNo, currentPage, rowPerPage);
		model.addAttribute("exList", exList);
		*/
		if(session.getAttribute("loginStudent") != null) {
			Student student = (Student)session.getAttribute("loginStudent");
			int studentNo = student.getStudentNo();
			model.addAttribute("studentNo", studentNo);
		}
		if(session.getAttribute("loginTeacher") != null) {
			Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
			model.addAttribute("loginTeacher", loginTeacher);
		}
		
		model.addAttribute("qList", qList);
		model.addAttribute("testNo", testNo);
		model.addAttribute("currentPage", currentPage);
		
		int count = questionService.getQuestionCount();
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
}
