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
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;

@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired IdService idService;
	/*
	 *	로그인 후에 사용가능한 기능 
	 */
	
	// 삭제
	@GetMapping("/employee/student/removeStudent")
	public String removeEmp(HttpSession session, @RequestParam("studentNo") int studentNo) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		studentService.removeStudent(studentNo);
		return "redirect:/employee/student/studentList"; // 리스트로 리다이렉트
	}
	
	// 입력
	@GetMapping("/employee/student/addStudent")
	public String addEmp(HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		return "employee/student/addStudent"; // forward
	}
	@PostMapping("/employee/student/addStudent")
	public String addEmp(HttpSession session, Model model, Student student) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
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
	public String empList(HttpSession session, Model model
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue= "10") int rowPerPage) { 
							// int currentPage = request.getParameter("currentPage");
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		List<Student> list = studentService.getStudentList(currentPage, rowPerPage);
		// request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		return "employee/student/studentList";
	}
}
