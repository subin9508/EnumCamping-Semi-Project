package com.itwill.semiproject.web;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

public class Weather {
	
	public void findWeather() {

		
		
		
		
		
	}
	
	
	public String findTime() {
		
		//현재 날짜, 시간
		LocalDateTime now = LocalDateTime.now();
		
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyyMMdd");
		DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("hhmm");
		SimpleDateFormat dtformat = new SimpleDateFormat("hhmm");  
		Calendar cal = Calendar.getInstance();
		
		String formattedDate = now.format(dateFormat);
		String formattedTime = now.format(timeFormat);
		int minute = formattedTime.charAt(formattedTime.length()-2);
		String changedTime = "";
		if (minute<=51) { //십의자리가 0,1,2,3
			cal.add(cal.HOUR, -1);
			String hourBefore= dtformat.format(cal.getTime());
			changedTime = hourBefore.substring(0,hourBefore.length()-2)+"00";
		} else {
			changedTime = formattedTime.substring(0,formattedTime.length()-2)+"00";
		}

		return formattedDate+changedTime; //날짜, 정각 시간 리턴
		
	}
	
	//http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst

}
