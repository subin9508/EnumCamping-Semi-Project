package com.itwill.semiproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reservation")
public class ReservationController {
	
	@GetMapping("/calendar")
	public void reservationCalendar() {
		log.debug("GET : calendar");
	}
}
