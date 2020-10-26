package command.member;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberCommand {
	String memberId;
	String memberPw;
	String memberPwCon;
	String memberName;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	Date memberBirth;
	String memberGender;
	String memberEmail;
	String memberAddr;
	String memberTel;
	Integer employeeNum;
	public boolean isUserPwEqualToUserPwCon() {
		if(memberPw.equals(memberPwCon)) {
			return true;
		}
		return false;
	}
	
}
