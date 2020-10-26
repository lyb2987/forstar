package controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {

	@RequestMapping("AdminHome")
	public String adminHome() {
		return "Admin/Admin_Home";
	}
}
