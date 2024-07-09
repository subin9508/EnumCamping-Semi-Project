package com.itwill.semiproject.web;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.semiproject.repository.ReservationDetail;
import com.itwill.semiproject.repository.ReservationMaster;
import com.itwill.semiproject.service.ReservationService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/reservation")
public class ReservationController {
	
	private final ReservationService reservationService;
	
	@GetMapping("/calendar")
	public void reservationCalendar() {
		log.debug("GET : calendar");
	}
	
	
	@GetMapping("/calendar/{date}")
	@ResponseBody
	public List<Integer> reservationCalendar(@PathVariable("date") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date) {
		log.debug("GET: calendar with date {}", date);
		
		 // 해당 날짜에 예약된 구역 ID 목록을 가져옵니다.
        List<Integer> reservedAreaIds = reservationService.readReservedAreas(date);
        return reservedAreaIds;
	}
	
	@GetMapping("/calendar/{date}/{area}")
	public ResponseEntity<List<ReservationMaster>> reservationCalendar(@PathVariable("date") String date, @PathVariable("area") int area) {
		LocalDate checkInDate = LocalDate.parse(date);
		log.debug("GET: calendar with date and area {}, {}", date, area);
		List<ReservationMaster> reservations = reservationService.readReservationMaster(checkInDate, area);
		
		return new ResponseEntity<>(reservations, HttpStatus.OK);
	}
	
	@GetMapping("/itemPrice/{itemId}") 
	public ResponseEntity<Integer> getItemPrice(@PathVariable("itemId") int itemId) {
		log.debug("GET: itemPrice with itemId {}", itemId);
		
		Integer itemPrice = reservationService.readItemPrice(itemId);
		if (itemPrice != null) {
			return new ResponseEntity<Integer>(itemPrice, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	@GetMapping("/reservationConfirm") 
	public void reservationConfirm() {
		log.debug("GET: reservationConfirm()");
	}
	
	@PostMapping("/reservationConfirm")
	public ResponseEntity<?> reservationConfirm(@RequestBody Map<String, Object> requestData, HttpSession session) {
	    log.debug("reservationList(requestData={})", requestData);

	    // 세션에서 사용자 정보 가져오기
	    String userId = (String) session.getAttribute("signedInUser");
	    log.debug("userId={}", userId);

	    // requestData에서 reservationMaster와 reservationDetail 추출
	    Map<String, Object> reservationMasterMap = (Map<String, Object>) requestData.get("reservationMaster");
	    Map<String, Object> reservationDetailMap = (Map<String, Object>) requestData.get("reservationDetail");

	    log.debug("reservationMasterMap={}", reservationMasterMap);
	    log.debug("reservationDetailMap={}", reservationDetailMap);
	    
	    if (reservationMasterMap == null || reservationDetailMap == null) {
	        log.error("reservationMasterMap or reservationDetailMap is null");
	        return new ResponseEntity<>("Invalid reservation data", HttpStatus.BAD_REQUEST);
	    }
	    
	    // ReservationMaster 객체 생성 및 설정
	    ReservationMaster reservationMaster = new ReservationMaster();
	    reservationMaster.setUserId(userId);
	    reservationMaster.setResCheckIn(LocalDate.parse((String) reservationMasterMap.get("resCheckIn")));
	    reservationMaster.setResCheckOut(LocalDate.parse((String) reservationMasterMap.get("resCheckOut")));
	    
	    // ReservationDetail 객체 생성 및 설정
	    
	    Object itemIdObj = reservationDetailMap.get("itemId");
	    Object itemAmountObj = reservationDetailMap.get("itemAmount");
	    
	    log.debug("itemIdObj={}, itemAmountObj={}", itemIdObj, itemAmountObj);

	    
	    if (itemIdObj == null || itemAmountObj == null) {
	        log.error("itemId or itemAmount is null");
	        return new ResponseEntity<>("Invalid reservation detail data", HttpStatus.BAD_REQUEST);
	    }
	    
	    ReservationDetail reservationDetail = new ReservationDetail();
	    reservationDetail.setItemId(Integer.parseInt(itemIdObj.toString()));
	    reservationDetail.setItemAmount(Integer.parseInt(itemAmountObj.toString()));
	    
	    reservationService.makeReservation(reservationMaster, reservationDetail);

	    return ResponseEntity.ok().build();
	}
	
}
