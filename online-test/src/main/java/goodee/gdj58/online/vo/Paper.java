package goodee.gdj58.online.vo;

import lombok.Data;

@Data
public class Paper {
	private int paperNo;
	private int studentNo;
	private int testNo;
	private int questionNo;
	private String answer;
	private int submit;
}

