package com.itwill.semiproject.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.semiproject.dto.ItemsDto;
import com.itwill.semiproject.service.ReservationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reservation")
public class ReservationController {

	private final ReservationService reservationService;
	
	@GetMapping("/item")
	public String item() {
		log.debug("/item");
		
		return "/reservation/item";			
	}
	
	@GetMapping("/sales")
	public String sales() {
		log.debug("/sales");
		
		return "/reservation/sales";
	}
	
	 @Autowired
	    public ReservationController(ReservationService reservationService) {
	        this.reservationService = reservationService;
	    }
	 
	 @GetMapping("/item/detail")
	    public String showItemDetail(Model model, @RequestParam Integer itemId) {
	        ItemsDto itemDto = reservationService.selectItemById(itemId);
	        if (itemDto != null) {
	            model.addAttribute("item", itemDto);
	            return "itemDetailPage"; // 실제 JSP 페이지 이름에 맞게 수정 필요
	        } else {
	            // 아이템을 찾지 못한 경우 처리
	            return "itemNotFoundPage"; // 적절한 오류 처리 페이지로 리다이렉트 또는 포워드
	        }
	    }
}
