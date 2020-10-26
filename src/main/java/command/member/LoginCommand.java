package command.member;

import lombok.Data;

@Data
public class LoginCommand {
	private String id1;
	private Boolean idStore;
	private Boolean autoLogin;
	private String pw;
	private String sortation;
	
	
}
