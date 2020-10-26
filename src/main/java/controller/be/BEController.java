package controller.be;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import command.BECommand;
import model.BEDTO;
import model.EmployeeDTO;
import service.be.BEInsertService;
import service.be.BEListService;
import service.employee.EmployeeListService;

@Controller
@RequestMapping("BE")
public class BEController {

	@Autowired
	private EmployeeListService employeeListService;
	
	@Autowired
	private BEListService bEListService;

	@Autowired
	private BEInsertService bEInsertService;
	
	@RequestMapping("BEmployeeList")
	public String bEmployeeList() {
		return "BE/BE_List";
	}

	// 연회 인력 등록 폼, 이미 등록된 직원은 제거한 후 리스트를 제공
	@RequestMapping("BEForm")
	public String BEForm(BECommand bECommand, Model model) {
		List<EmployeeDTO> emplyoeeList = employeeListService.employeeListSelect();
		List<BEDTO> beList = bEListService.bEListSelect();
		for(int i=0; i<beList.size(); i++) {
			for(int j=0; j<emplyoeeList.size(); j++) {
				if(beList.get(i).getEmployeeNum().equals(emplyoeeList.get(j).getEmployeeNum())) {
					emplyoeeList.remove(j);
				}
			}
		}

		model.addAttribute("bECommand", bECommand);
		model.addAttribute("list", emplyoeeList);
		
		return "BE/BE_Form";
	}
	
	// 연회인력 등록
	@RequestMapping("BEInsert")
	public void bEInsert(BECommand bECommand, HttpServletResponse response) throws Exception{
		System.out.print("커맨드 값 : ");
		System.out.println(bECommand.getBENum() + ", " + bECommand.getBECharge());
		bEInsertService.bEInsert(bECommand);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('연회 인력이 등록되었습니다.'); location.href='BEmployeeList' </script>");
		out.flush();
		out.close();
	}
}
