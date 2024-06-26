package com.itwill.semiproject.repository;

public interface UserDao {
	
	User selectByUserid(String user_id);
    int insert(User user);
    User selectByUseridAndPassword(User user);
    User selectByUserEmail(String user_email);
}
