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
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TeacherController {
	@Autowired TeacherService teacherService;
	@Autowired IdService idService;
	
	// pw수정 폼
	@GetMapping("/teacher/modifyTeacherPw")
	public String modifyTeacherPw() {
		return "teacher/modifyTeacherPw";
	}
	// pw수정 액션
	@PostMapping("/teacher/modifyTeacherPw")
	public String modifyTeacherPw(HttpSession session
							, @RequestParam(value="oldPw", required = true) String oldPw
							, @RequestParam(value="newPw", required = true) String newPw) {
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		teacherService.modifyTeacherPw(loginTeacher.getTeacherNo(), oldPw, newPw);
		
		return "redirect:/loginTeacher";
	}
	
	// 로그인 폼
	@GetMapping("/loginTeacher")
	public String loginTeacher() {
		log.debug("\u001B[31m"+"loginTeacher Form");
		return "/teacher/loginTeacher";
	}
	// 로그인 액션
	@PostMapping("/loginTeacher")
	public String loginTeacher(HttpSession session, Teacher teacher) {
		Teacher resultTeacher= teacherService.login(teacher);
		session.setAttribute("loginTeacher", resultTeacher);
		log.debug("\u001B[31m"+"loginTeacher Action");
		return "redirect:/loginTeacher";
	}
	
	@GetMapping("/teacher/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginTeacher";
	}
	
	/*
	 *	로그인 후에 사용가능한 기능 
	 */
	
	// 삭제
	@GetMapping("/employee/teacher/removeTeacher")
	public String removeTeacher(@RequestParam("teacherNo") int teacherNo) {
		teacherService.removeTeacher(teacherNo);
		return "redirect:/employee/teacher/teacherList"; // 리스트로 리다이렉트
	}
	
	// 입력
	@GetMapping("/employee/teacher/addTeacher")
	public String addTeacher() {
		return "employee/teacher/addTeacher"; // forward
	}
	@PostMapping("/employee/teacher/addTeacher")
	public String addTeacher(Model model, Teacher teacher) {
		
		String idCheck = idService.getIdCheck(teacher.getTeacherId());
		if(idCheck != null) {
			model.addAttribute("errorMsg", "중복된ID입니다.");
			return "employee/teacher/addTeacher";
		}
		
		int row = teacherService.addTeacher(teacher);
		// row == 1 이면 입력성공
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템에러로 등록실패하였습니다.");
			return "employee/teacher/addTeacher";
		}
		return "redirect:/employee/teacher/teacherList"; // sendRedirect , CM -> C
	}
	
	// 리스트
	@GetMapping("/employee/teacher/teacherList")
	public String teacherList(Model model
							, @RequestParam(value="searchWord", defaultValue = "") String searchWord
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue= "10") int rowPerPage) { 
							// int currentPage = request.getParameter("currentPage");
		log.debug("\u001B[31m"+currentPage+"<-- currentPage");
		log.debug("\u001B[31m"+rowPerPage+"<-- rowPerPage");
		log.debug("\u001B[31m"+searchWord+"<-- searchWord");
		List<Teacher> list = teacherService.getTeacherList(searchWord, currentPage, rowPerPage);
		// request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		
		int count = teacherService.getTeacherCount(searchWord);
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
		return "employee/teacher/teacherList";
	}
}
