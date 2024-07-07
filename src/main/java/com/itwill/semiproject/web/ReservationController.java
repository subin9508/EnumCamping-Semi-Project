package com.itwill.semiproject.web;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.semiproject.dto.ReservationDetailCreateDto;
import com.itwill.semiproject.repository.Items;
import com.itwill.semiproject.repository.ReservationDetail;
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
	public String getItems(Model model) {
		List<Items> items = reservationService.getAllItems();
		log.debug("itmes()", items);
		
		model.addAttribute("items", items);
		return "/reservation/item";
	}
	

	@GetMapping("/order")
	public String getReservationDetail(Model model) {
		List<ReservationDetail> reservationDetail = reservationService.getReservationDeatil(); 
		log.debug("order()", reservationDetail);
		
		model.addAttribute("reservationDetail", reservationDetail);
		return "/reservation/order";
	}
	
	@GetMapping("/reservationConfirm")
	public String reservationConfirm() {
		log.debug("reservationConfirm()");
		
		return "/reservation/reservationConfirm";
	}
	
	
	@PostMapping("/item")
	public ResponseEntity<String> create(@RequestBody List<ReservationDetailCreateDto> dtos) {
	    log.debug("create(dtos={})", dtos);
	    
	    try {
	        reservationService.createBatch(dtos);
	        return ResponseEntity.ok("success");
	    } catch (Exception e) {
	        log.error("Error creating reservation details", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error");
	    }
	}

}
