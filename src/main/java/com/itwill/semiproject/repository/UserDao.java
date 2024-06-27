package com.itwill.semiproject.repository;

public interface UserDao {
	User selectByUseridAndPassword(User user);
}
