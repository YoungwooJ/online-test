package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.StudentMapper;
import goodee.gdj58.online.vo.Student;

@Service
@Transactional
public class StudentService {
	@Autowired private StudentMapper studentMapper;
	
	public String getStudentId(String studentId) {
		// 사용가능한 ID면 "YES" 아니면 "NO" 반환
		String resultStr = "NO";
		if(studentMapper.selectStudentId(studentId) == null) {
			resultStr = "YES";
		}
		return resultStr;
	}
	
	public int getStudentCount(String searchWord) {
		return studentMapper.selectStudentCount(searchWord);
	}
	
	public int modifyStudentPw(int studentNo, String oldPw, String newPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("studentNo", studentNo);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		return studentMapper.updateStudentPw(paramMap);
	}
	
	public Student login(Student student) {
		return studentMapper.login(student);
	}
	
	public int removeStudent(int studentNo) {
		return studentMapper.deleteStudent(studentNo);
	}
	
	public int addStudent(Student student) {
		return studentMapper.insertStudent(student);
	}
	
	public List<Student> getStudentList(String searchWord, int currentPage, int rowPerPage){
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return studentMapper.selectStudentList(paramMap);
	}
}
