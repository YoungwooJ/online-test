package goodee.gdj58.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.ScoreMapper;
import goodee.gdj58.online.vo.Score;

@Service
@Transactional
public class ScoreService {
	@Autowired private ScoreMapper scoreMapper;
	
	public int addScore(int studentNo, int testNo, int score, String grade) {
		Score paramScore = new Score();
		paramScore.setStudentNo(studentNo);
		paramScore.setTestNo(testNo);
		paramScore.setScore(score);
		paramScore.setGrade(grade);
		return scoreMapper.insertScore(paramScore);
	}
	
	public Score getScoreOne(int studentNo, int testNo) {
		Score score = new Score();
		score.setStudentNo(studentNo);
		score.setTestNo(testNo);
		return scoreMapper.selectScoreOne(score);
	}
}
