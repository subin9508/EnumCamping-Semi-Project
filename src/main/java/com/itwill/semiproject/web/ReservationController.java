package com.itwill.semiproject.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.semiproject.repository.ItemsPrice;
import com.itwill.semiproject.service.ReservationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
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
	
	@GetMapping("/items")
    public String getItems(Model model) {
        List<ItemsPrice> items = reservationService.getAllItems();
        model.addAttribute("items", items);
        return "items";
    }
	

}
