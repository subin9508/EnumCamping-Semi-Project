package com.itwill.semiproject.web;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

public class test {

	public static void main(String[] args) {
		LocalDateTime now = LocalDateTime.now();
		
		DateTimeFormatter Format = DateTimeFormatter.ofPattern("yyyyMMddhhmm");
		SimpleDateFormat dtformat = new SimpleDateFormat("yyyyMMddhhmm");  
		Calendar cal = Calendar.getInstance();
		
		String formattedDate = now.format(Format);
		int minute = formattedDate.charAt(formattedDate.length()-2);
		String changedTime = "";
		if (minute<=51) { //십의자리가 0,1,2,3
			cal.add(cal.HOUR, -1);
			String hourBefore= dtformat.format(cal.getTime());
			changedTime = hourBefore.substring(0,hourBefore.length()-2)+"00";
		} else {
			changedTime = formattedDate.substring(0,formattedDate.length()-2)+"00";
		}

		System.out.println(changedTime);
		
		
	}

}
