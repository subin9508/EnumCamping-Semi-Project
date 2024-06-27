package com.itwill.semiproject.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserDao {
	
	@Update("update users set user_password = #{userpassword}, user_phone = #{userphone} where user_id = #{userid}")	
	int updateUser(User user);
	
	@Select("select * from users where user_id = #{userid}")
	User selectByUserId(String userid);
}
