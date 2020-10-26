package controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.member.LoginCommand;

@Controller
public class MainController {
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String mainPage(LoginCommand loginCommand) {
		return "main/main";
	}
}
