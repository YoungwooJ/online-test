package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.vo.Employee;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	@Autowired IdService idService;
	
	// pw수정 폼
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw() {
		return "employee/modifyEmpPw";
	}
	// pw수정 액션
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session
							, @RequestParam(value="oldPw", required = true) String oldPw
							, @RequestParam(value="newPw", required = true) String newPw) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		employeeService.modifyEmployeePw(loginEmp.getEmpNo(), oldPw, newPw);
		
		return "redirect:/employee/empList";
	}
	
	// 로그인 폼
	@GetMapping("/loginEmp")
	public String loginEmp() {
		log.debug("\u001B[31m"+"loginEmp Form");
		return "/employee/loginEmp";
	}
	// 로그인 액션
	@PostMapping("/loginEmp")
	public String loginEmp(HttpSession session, Employee emp) {
		Employee resultEmp= employeeService.login(emp);
		session.setAttribute("loginEmp", resultEmp);
		log.debug("\u001B[31m"+"loginEmp Action");
		return "redirect:/employee/empList";
	}
	
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginEmp";
	}
	
	/*
	 *	로그인 후에 사용가능한 기능 
	 */
	
	// 삭제
	@GetMapping("/employee/removeEmp")
	public String removeEmp(@RequestParam("empNo") int empNo) {
		employeeService.removeEmployee(empNo);
		return "redirect:/employee/empList"; // 리스트로 리다이렉트
	}
	
	// 입력
	@GetMapping("/employee/addEmp")
	public String addEmp() {
		return "employee/addEmp"; // forward
	}
	@PostMapping("/employee/addEmp")
	public String addEmp(Model model, Employee employee) {
		String idCheck = idService.getIdCheck(employee.getEmpId());
		if(idCheck != null) {
			model.addAttribute("errorMsg", "중복된ID입니다.");
			return "employee/addEmp";
		}
		
		int row = employeeService.addEmployee(employee);
		// row == 1 이면 입력성공
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템에러로 등록실패하였습니다.");
			return "employee/addEmp";
		}
		return "redirect:/employee/empList"; // sendRedirect , CM -> C
	}
	
	// 리스트
	@GetMapping("/employee/empList")
	public String empList(Model model
							, @RequestParam(value="search", required = false) String search
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue= "10") int rowPerPage) { 
							// int currentPage = request.getParameter("currentPage");
		
		List<Employee> list = employeeService.getEmployeeList(search, currentPage, rowPerPage);
		// request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		return "employee/empList";
	}
}
