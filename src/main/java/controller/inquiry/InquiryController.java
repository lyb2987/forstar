package controller.inquiry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.InquiryCommand;
import service.inquiry.InquiryDeleteService;
import service.inquiry.InquiryDetailService;
import service.inquiry.InquiryInsertService;
import service.inquiry.InquiryListService;
import service.inquiry.InquiryModifyService;
import validator.InquiryCommandValidator;

@Controller
@RequestMapping("Inquiry")
public class InquiryController {
	
	@Autowired
	private InquiryInsertService inquiryInsertService; 
	
	@Autowired
	private InquiryListService inquiryListService;
	
	@Autowired
	private InquiryDetailService inquiryDetailService;

	@Autowired
	private InquiryDeleteService inquiryDeleteService;
	
	@Autowired
	private InquiryModifyService inquiryModifyService;
	
	// 문의 리스트
	@RequestMapping("InquiryList")
	public String InquiryList(@RequestParam(value = "page" , defaultValue = "1") Integer page,	Model model) {
		inquiryListService.inquiryListSelcet(page, model);
		return "Inquiry/Inquiry_List";
	}
	
	// 문의 작성폼
	@RequestMapping("InquiryForm")
	public String InquiryForm(InquiryCommand inquiryCommand) {
		return "Inquiry/Inquiry_Form";
	}
	
	// 문의 작성
	@RequestMapping("InquiryInsert")
	public String inquiryInsert(InquiryCommand inquiryCommand, Errors errors, HttpSession session, HttpServletRequest request) {
		new InquiryCommandValidator().validate(inquiryCommand, errors);
		if(errors.hasErrors()) {
			return "Inquiry/Inquiry_Form";
		}
		inquiryInsertService.inquiryInsert(inquiryCommand, session, request);
		return "redirect:/Inquiry/InquiryList";
	}
	
	// 문의 조회
	@RequestMapping("InquiryDetail")
	public String inquiryDetail(@RequestParam(value="inquiryNum") Long inquiryNum, @RequestParam(value = "page" , defaultValue = "1") Integer page,	Model model) {
		inquiryDetailService.inquirySelect(inquiryNum, page, model);
		return "Inquiry/Inquiry_Detail";
	}
	
	// 문의 삭제
	@RequestMapping("InquiryDelete")
	public String inquiryDelete(@RequestParam(value="inquiryNum") Integer inquiryNum) {
		inquiryDeleteService.inquiryDelete(inquiryNum);
		return "redirect:/Inquiry/InquiryList";
	}
	
	// 문의 수정 페이지 이동
	@RequestMapping("InquiryModifyForm")
	public String inquiryModifyForm(@RequestParam(value="inquiryNum") Long inquiryNum, @RequestParam(value = "page" , defaultValue = "1") Integer page,	Model model) {
		inquiryDetailService.inquirySelect(inquiryNum, page, model);
		return "Inquiry/Inquiry_Modify";
	}
	
	// 문의 수정
	@RequestMapping("InquiryModify")
	public String inquiryModify(@RequestParam(value="inquiryNum") Integer inquiryNum, @RequestParam(value="inquiryContent") String inquiryContent) {
		inquiryModifyService.inquiryModify(inquiryNum, inquiryContent);
		return "redirect:/Inquiry/InquiryDetail?inquiryNum=" + Integer.toString(inquiryNum);
	}
}
