package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;

@Mapper
public interface EmployeeMapper {
	int selectEmployeeCount(String searchWord);
	int updateEmployeePw(Map<String, Object> paramMap);
	Employee login(Employee employee);
	int deleteEmployee(int empNo);
	int insertEmployee(Employee employee);
	public String selectEmployeeId(String empId);
	List<Employee> selectEmployeeList(Map<String, Object> paramMap);
}