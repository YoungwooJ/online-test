package goodee.gdj58.online.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.ScoreService;

@Controller
public class ScoreController {
	@Autowired ScoreService scoreService;
	
	// 입력
	@GetMapping("/score/addScore")
	public String addScore(Model model
							, @RequestParam(value="studentNo", required = true) int studentNo
							, @RequestParam(value="testNo", required = true) int testNo
							, @RequestParam(value="score", required = true) int score
							, @RequestParam(value="grade", required = true) String grade) {
		int row = scoreService.addScore(studentNo, testNo, score, grade);
		// row == 1 이면 입력성공
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템에러로 등록실패하였습니다.");
			return "test/testList";
		}
		return "redirect:/paper/paperList?studentNo="+studentNo;
	}
}
