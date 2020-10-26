package controller.totalpayment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.BHPaymentDTO;
import model.BHReservationDTO;
import model.TotalPaymentDTO;
import service.bhpayment.BHPaymentDeleteService;
import service.bhpayment.BHPaymentInsertService;
import service.bhpayment.BHPaymentSelectService;
import service.bhpayment.BHPaymentUpdateService;
import service.bhreservation.BHReservationStatusUpdateService;
import service.totalpayment.TotalPaymentDeleteService;
import service.totalpayment.TotalPaymentInsertService;
import service.totalpayment.TotalPaymentSelectService;

@Controller
@RequestMapping("TotalPayment")
public class TotalPaymentController {
	
	@Autowired
	private TotalPaymentSelectService totalPaymentSelectService;
	
	@Autowired
	private TotalPaymentInsertService totalPaymentInsertService;
	
	@Autowired
	private BHPaymentInsertService bHPaymentInsertService;
	
	@Autowired 
	private BHPaymentSelectService bHPaymentSelectService;
	
	@Autowired
	private BHReservationStatusUpdateService bHReservationStatusUpdateService;
	
	@Autowired
	private BHPaymentDeleteService bHPaymentDeleteService;
	
	@Autowired
	private TotalPaymentDeleteService totalPaymentDeleteService;
	
	@Autowired
	private BHPaymentUpdateService bHPaymentUpdateService;
	
	// 결제 생성
	@RequestMapping("TotalPaymentCreate")
	public String totalPayment(@RequestParam(value="bHReservationNum") Long bHReservationNum, 
			@RequestParam(value="bHReservationCharge") Long bHReservationCharge, Model model) {
		Long randNum=(long)0;
		int checkNum = 0;
		while(true) {
			randNum = (long)Math.floor(Math.random()*100000+1);
			checkNum = totalPaymentSelectService.totalPaymentNumCheck(randNum);
			System.out.println(randNum);
			if(randNum>9999 && checkNum == 0)
				break;
		}
		// 통합결제 할때 금액 다 합칠것
		totalPaymentInsertService.totalPaymentInsert(randNum, bHReservationCharge);
		
		// 고객번호 세션으로 받을것
		BHPaymentDTO bHPaymentDTO = new BHPaymentDTO(bHReservationNum, (long)11111, randNum, null, bHReservationCharge, null, "결제 대기중");
		bHPaymentInsertService.bHPaymentInsert(bHPaymentDTO);
		bHPaymentDTO = bHPaymentSelectService.bHPaymentSelect(randNum);
		TotalPaymentDTO totalPaymentDTO = totalPaymentSelectService.totalPaymentSelect(randNum);
		model.addAttribute("bhp", bHPaymentDTO);
		model.addAttribute("tp", totalPaymentDTO);
		
		BHReservationDTO bHReservationDTO = new BHReservationDTO();
		bHReservationDTO.setBHReservationNum(bHReservationNum);
		bHReservationDTO.setReservationStatus("결제 진행중");
		
		bHReservationStatusUpdateService.bHReservationStatusUpdate(bHReservationDTO);
		
		return "Total_Payment/Total_Payment_Detail";
	}
	

	// 결제 취소
	@RequestMapping("TotalPaymentCancel")
	public String totalPaymentCancel(@RequestParam(value="tpNum") Long tpNum, HttpServletResponse response) {

		BHPaymentDTO bHPaymentDTO = bHPaymentSelectService.bHPaymentSelect(tpNum);
	
		BHReservationDTO bHReservationDTO = new BHReservationDTO();
		bHReservationDTO.setBHReservationNum(bHPaymentDTO.getBHReservationNum());
		bHReservationDTO.setReservationStatus("결제 취소 / 결제 대기중");

		bHReservationStatusUpdateService.bHReservationStatusUpdate(bHReservationDTO);
		bHPaymentDeleteService.bHPaymentDelete(tpNum);
		totalPaymentDeleteService.totalPaymentDelete(tpNum);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<script>alert('결제가 취소되었습니다.'); location.href='../main '</script>");
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "";
	}
	
	// 결제
	@RequestMapping("TotalPayment")
	public String totalPayment(@RequestParam(value="tpNum") Long tpNum) {
		
		BHPaymentDTO bHPaymentDTO = bHPaymentSelectService.bHPaymentSelect(tpNum);
		
		BHReservationDTO bHReservationDTO = new BHReservationDTO();
		bHReservationDTO.setBHReservationNum(bHPaymentDTO.getBHReservationNum());
		bHReservationDTO.setReservationStatus("결제 완료");
		
		bHPaymentUpdateService.bHPaymentCompleUpdate(tpNum);
		bHReservationStatusUpdateService.bHReservationStatusUpdate(bHReservationDTO);
		
		return "redirect:/BHReservation/TotalReservationDetail?bHReservationNum="+bHPaymentDTO.getBHReservationNum();
	}
	
}
