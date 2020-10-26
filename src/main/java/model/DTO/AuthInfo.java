package model.DTO;

import lombok.Data;

@Data
// 로그인시 필요한 사용자 정보 저장하기 위한 class
public class AuthInfo {
	private String id;
	private Integer memberNum;
	private Integer employeeNum;
	private String email;
	private String name;
	private String pw;
	
	public AuthInfo(String id, Integer memberNum, String email, String name) {
		this.id = id;
		this.memberNum = memberNum;
		this.email = email;
		this.name = name;
	}
	
	public AuthInfo(Integer employeeNum, String id, String email, String name) {
		this.id = id;
		this.employeeNum = employeeNum;
		this.email = email;
		this.name = name;
	}
	
}
