package goodee.gdj58.online.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.service.EmployeeService;

@RestController
public class EmployeeRestController {
	
	@Autowired EmployeeService employeeService;
	
	@GetMapping("/employeeIdck")
	public String employeeIdck(@RequestParam(value = "empId") String empId) {
		return employeeService.getEmployeeId(empId);
	}
}
