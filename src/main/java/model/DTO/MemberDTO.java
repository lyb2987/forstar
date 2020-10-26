package model.DTO;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO implements Serializable{
	Integer memberNum;
	String memberId ;
	String memberPw  ; 
	String memberName;
	Timestamp memberBirth;
	String memberGender;
	String memberAddr;
	String memberTel;
	String memberEmail;
	Timestamp memberRegist;
	Long memberPoint;

	
}
