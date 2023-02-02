package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Student;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired IdService idService;
	
	// pw수정 폼
	@GetMapping("/student/modifyStudentPw")
	public String modifyStudentPw() {
		return "student/modifyStudentPw";
	}
	// pw수정 액션
	@PostMapping("/student/modifyStudentPw")
	public String modifyStudentPw(HttpSession session
							, @RequestParam(value="oldPw", required = true) String oldPw
							, @RequestParam(value="newPw", required = true) String newPw) {
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		studentService.modifyStudentPw(loginStudent.getStudentNo(), oldPw, newPw);
		
		return "redirect:/loginStudent";
	}
	
	// 로그인 폼
	@GetMapping("/loginStudent")
	public String loginStudent() {
		log.debug("\u001B[31m"+"loginStudent Form");
		return "/student/loginStudent";
	}
	// 로그인 액션
	@PostMapping("/loginStudent")
	public String loginStudent(HttpSession session, Student student) {
		Student resultStudent = studentService.login(student);
		session.setAttribute("loginStudent", resultStudent);
		log.debug("\u001B[31m"+"loginStudent Action");
		return "redirect:/loginStudent";
	}
	
	@GetMapping("/student/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginStudent";
	}
	
	/*
	 *	로그인 후에 사용가능한 기능 
	 */
	
	// 삭제
	@GetMapping("/employee/student/removeStudent")
	public String removeStudent(@RequestParam("studentNo") int studentNo) {
		studentService.removeStudent(studentNo);
		return "redirect:/employee/student/studentList"; // 리스트로 리다이렉트
	}
	
	// 입력
	@GetMapping("/employee/student/addStudent")
	public String addStudent() {	
		return "employee/student/addStudent"; // forward
	}
	@PostMapping("/employee/student/addStudent")
	public String addStudent(Model model, Student student) {
		String idCheck = idService.getIdCheck(student.getStudentId());
		if(idCheck != null) {
			model.addAttribute("errorMsg", "중복된ID입니다.");
			return "employee/student/addStudent";
		}
		
		int row = studentService.addStudent(student);
		// row == 1 이면 입력성공
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템에러로 등록실패하였습니다.");
			return "employee/student/addStudent";
		}
		return "redirect:/employee/student/studentList"; // sendRedirect , CM -> C
	}
	
	// 리스트
	@GetMapping("/employee/student/studentList")
	public String studentList(Model model
							, @RequestParam(value="searchWord", defaultValue = "") String searchWord
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue= "10") int rowPerPage) { 
							// int currentPage = request.getParameter("currentPage");
		log.debug("\u001B[31m"+currentPage+"<-- currentPage");
		log.debug("\u001B[31m"+rowPerPage+"<-- rowPerPage");
		log.debug("\u001B[31m"+searchWord+"<-- searchWord");
		List<Student> list = studentService.getStudentList(searchWord, currentPage, rowPerPage);
		// request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("serachWord", searchWord);
		
		int count = studentService.getStudentCount();
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
		return "employee/student/studentList";
	}
}
