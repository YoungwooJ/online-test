package goodee.gdj58.online.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller()
public class HelloController {
	/*
	@GetMapping("/test")
	public String test() {
		System.out.println("test....");
		return "test"; // 뷰 이름
	}
	*/
	/*
	@RequestMapping(value="/test2", method=RequestMethod.GET)
	public String test2() {
		System.out.println("test2....");
		return "test"; // 뷰 이름
	}
	*/
	/*
	@GetMapping("/test")
	public void test() {
		System.out.println("test....");
	}
	*/
	@GetMapping("/test")
	public ModelAndView test() {
		System.out.println("ModelAndView test....");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("test");
		return mv;
	}
}
