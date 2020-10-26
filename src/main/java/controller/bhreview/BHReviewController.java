package controller.bhreview;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.BHReviewDTO;
import service.bhreview.BHReviewDeleteService;
import service.bhreview.BHReviewInsertService;
import service.bhreview.BHReviewModifyService;
import service.bhreview.BHReviewSelectService;

@Controller
@RequestMapping("BHReview")
public class BHReviewController {
	
	@Autowired
	private BHReviewInsertService bHReviewInsertService;
	
	@Autowired
	private BHReviewSelectService bHReviewSelectService;
	
	@Autowired
	private BHReviewModifyService bHReviewModifyService;
	
	@Autowired
	private BHReviewDeleteService bHReviewDeleteService;
	
	@RequestMapping("BHReviewForm")
	public String bHReviewForm(@RequestParam(value="bHReservationNum")Long bHReservationNum,
			@RequestParam(value="memberNum")Long memberNum, Model model) {
		model.addAttribute("bHReservationNum", bHReservationNum);
		model.addAttribute("memberNum", memberNum);
		return "BHReview/BHReview_Form";
	}
	
	@RequestMapping("BHReviewInsert")
	public String bHReviewInsert(BHReviewDTO dto) {
		bHReviewInsertService.bHReviewInsert(dto);
		return "BHReview/BHReview_List";
	}
	
	@RequestMapping("BHReviewList")
	public String bHReviewList(@RequestParam(value = "page" , defaultValue = "1") Integer page,	Model model) {
		bHReviewSelectService.bHReviewListSelect(page, model);
		return "BHReview/BHReview_List";
	}
	
	@RequestMapping("BHReviewDetail")
	public String bHReviewDetail(@RequestParam(value = "bHReviewNum") Long bHReviewNum, Model model) {
		Integer page = 1;
		bHReviewSelectService.bHReviewSelect(page, bHReviewNum, model);
		return "BHReview/BHReview_Detail";
	}
	
	@RequestMapping("BHReviewModifyForm")
	public String bHReviewModifyForm(@RequestParam(value = "bHReviewNum") Long bHReviewNum, Model model) {
		Integer page = 1;
		bHReviewSelectService.bHReviewSelect(page, bHReviewNum, model);
		return "BHReview/BHReview_Modify";
	}
	
	@RequestMapping("BHReviewModify")
	public String bHReviewModify(BHReviewDTO dto) {
		bHReviewModifyService.bHReviewModify(dto);
		return "redirect:/BHReview/BHReviewDetail?bHReviewNum="+dto.getBHReviewNum();
	}
	
	@RequestMapping("BHReviewDelete")
	public String bHReviewDelete(@RequestParam(value = "bHReviewNum") Long bHReviewNum) {
		bHReviewDeleteService.bHReviewDelete(bHReviewNum);
		return "redirect:/BHReview/BHReviewList";
	}
}
