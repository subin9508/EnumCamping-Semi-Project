package com.itwill.semiproject.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserDao {
	
	int updateUser(User user);
	
	@Select("select * from users where user_id = #{userid}")
	User selectByUserId(String userid);
}
