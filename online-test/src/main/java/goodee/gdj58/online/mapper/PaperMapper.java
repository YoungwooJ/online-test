package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Paper;

@Mapper
public interface PaperMapper {
	int selectPaperCount();
	int deletePaper(int paperNo);
	int updatePaper(Paper paper);
	int insertPaper(Paper paper);
	List<Map<String, Object>> selectPaperOne(Map<String, Object> paramMap);
	List<Map<String, Object>> selectPaperList(Map<String, Object> paramMap);
}
