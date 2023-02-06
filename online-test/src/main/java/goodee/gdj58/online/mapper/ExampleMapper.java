package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Example;

@Mapper
public interface ExampleMapper {
	int selectExampleCount();
	int deleteExample(int exampleNo);
	int updateExample(Example example);
	int insertExample(Example example);
	Example selectExampleOne(int exampleNo);
	List<Example> selectExampleList(Map<String, Object> paramMap);
}
