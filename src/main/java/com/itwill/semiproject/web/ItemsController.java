package com.itwill.semiproject.web;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.semiproject.repository.Items;
import com.itwill.semiproject.service.ItemsService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/reservation")
public class ItemsController {

	private final ItemsService reservationService;
	
	@GetMapping("/item")
	public String getItems(Model model) {
		List<Items> items = reservationService.getAllItems();
		log.debug("itmes()", items);
		
		model.addAttribute("items", items);
		return "/reservation/item";
	}
	

	@GetMapping("/order")
	public String order() {
		log.debug("order()");
		
		return "/reservation/order";
	}

}
