package com.itwill.semiproject.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.semiproject.dto.ReservationDetailDto;
import com.itwill.semiproject.repository.Items;
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
	public String order() {
		log.debug("order()");
		
		return "/reservation/order";
	}
	
	@GetMapping("/reservationConfirm")
	public String reservationConfirm() {
		log.debug("reservationConfirm()");
		
		return "/reservation/reservationConfirm";
	}
	
	// 예약 정보 생성
	@PostMapping("/create")
	public ResponseEntity<String> createReservation(@ModelAttribute ReservationDetailDto dto) {
	    int result = reservationService.create(dto);
	    if (result == 1) {
	        return ResponseEntity.ok("Reservation created successfully");
	    } else {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to create reservation");
	    }
	}
	
	// 다음 단계 버튼 클릭 시 호출되는 함수
    @PostMapping("/createReservation")
    public ResponseEntity<String> createReservation(@RequestBody List<ReservationDetailDto> reservationDetails) {
        int successCount = 0;
        for (ReservationDetailDto dto : reservationDetails) {
            int result = reservationService.create(dto);
            if (result == 1) {
                successCount++;
            }
        }

        if (successCount == reservationDetails.size()) {
            return ResponseEntity.ok("All reservations created successfully");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to create reservations");
        }
    }
	


}
