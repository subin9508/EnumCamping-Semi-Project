package com.itwill.semiproject.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserDao {
	
	@Update("update users set user_password = #{userPassword}, user_phone = #{userPhone} where user_id = #{userId}")	
	int updateUser(User user);
	
	@Select("select * from users where user_id = #{userId}")
	User selectByUserId(String userId);
	
	@Select("select * from users where user_id = #{userId} and user_password = #{userPassword}")
	User selectByUseridAndPassword(User user);
	
	@Update("UPDATE users SET profile_picture_url = #{profilePictureUrl} WHERE user_id = #{userId}")
    int updateProfilePicture(User user);
	
}
