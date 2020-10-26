package controller.counseling;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.CounselingCommand;
import service.counseling.CounselingDeleteService;
import service.counseling.CounselingDetailService;
import service.counseling.CounselingInsertService;
import service.counseling.CounselingListService;
import service.counseling.CounselingModifyService;
import validator.CounselingCommandValidator;
import validator.InquiryCommandValidator;

@Controller
@RequestMapping("Counseling")
public class CounselingController {

	@Autowired
	private CounselingInsertService counselingInsertService;
	
	@Autowired
	private CounselingListService counselingListService;
	
	@Autowired
	private CounselingDetailService counselingDetailService;
	
	@Autowired
	private CounselingModifyService counselingModifyService;
	
	@Autowired
	private CounselingDeleteService counselingDeleteService;
	
	// 상담 일정 등록 폼
	@RequestMapping("CounselingForm")
	public String counselingForm(CounselingCommand counselingCommand, @RequestParam(value = "inquiryNum") Integer inquiryNum, @RequestParam(value = "memberNum") Integer memberNum, 
			Model model) {
		counselingCommand.setCounselingSubject(Integer.toString(memberNum)+"님의 상담일정 입니다.");
		counselingCommand.setCounselingContent(
				"상담 문의 번호 : " + Integer.toString(inquiryNum) + 
				"\n--------------------------------------------------------\n" + 
				"상담 진행 대기중.." );
		
		return "Counseling/Counseling_Form";
	}
	
	// 상담 일정 등록
	@RequestMapping("CounselingInsert")
	public String counselingInsert(CounselingCommand counselingCommand, Errors errors, HttpSession session) {
		new CounselingCommandValidator().validate(counselingCommand, errors);
		if(errors.hasErrors()) {
			return "Counseling/Counseling_Form";
		}
		counselingInsertService.counselingInsert(counselingCommand, session);
		return "main/main";
	}
	
	
	// 상담 리스트 (직원용)
	@RequestMapping("CounselingList")
	public String counselingList(@RequestParam(value="page" , defaultValue="1") Integer page,	Model model) {
		counselingListService.counselingListSelcet(page, model);
		return "Counseling/Counseling_EP_List";
	}

	// 상담 글 조회
	@RequestMapping(value="CounselingDetail", method=RequestMethod.GET)
	public String counselingDetail(@RequestParam(value="counselingNum") Long conunselingNum, 
			@RequestParam(value="page" , defaultValue="1") Integer page, Model model) {
		counselingDetailService.counselingSelect(conunselingNum, page, model);
		return "Counseling/Counseling_Detail";
	}
	
	// 상담 진행 (수정), 상담 수정 폼
	@RequestMapping("CounselingModifyForm")
	public String counselingModifyForm(@RequestParam(value="counselingNum") Long counselingNum,
			@RequestParam(value="page" , defaultValue="1") Integer page, HttpSession session, Model model) {
		counselingModifyService.counselingOngoingModify(counselingNum, session);
		counselingDetailService.counselingSelect(counselingNum, page, model);
		return "Counseling/Counseling_Modify";
	}
	
	// 상담 완료 (수정)
	@RequestMapping("CounselingModify")
	public String counselingModify(@RequestParam(value="counselingNum") Long counselingNum, 
			@RequestParam(value="counselingContent") String counselingContent,
			@RequestParam(value="counselingUniqueness") String counselingUniqueness) {
		counselingModifyService.counselingCompleModify(counselingNum, counselingContent, counselingUniqueness);
		return "redirect:/Counseling/CounselingDetail?counselingNum="+counselingNum;
	}
	

	// 상담 취소 (수정)
	@RequestMapping("CounselingModifyCancle")
	public String counselingModifyCancle(@RequestParam(value="counselingNum") Long counselingNum) {
		counselingModifyService.counselingCancleModify(counselingNum);
		return "redirect:/Counseling/CounselingDetail?counselingNum="+counselingNum;
	}
	
	// 상담 삭제 
	@RequestMapping("CounselingDelete")
	public String counselingDelete(@RequestParam(value="counselingNum") Long counselingNum) {
		counselingDeleteService.counselingDelete(counselingNum);
		return "redirect:/Counseling/CounselingList";
	}
	
	// 예약 중단
	@RequestMapping(value = "CounselingReserveStop", method = RequestMethod.GET)
	public String counselingReserveStop(@RequestParam(value="counselingNum") Long counselingNum) {
		counselingModifyService.counselingReserveCancleModify(counselingNum);
		return "redirect:/Counseling/CounselingDetail?counselingNum="+counselingNum;
	}
}
