package com.itwill.semiproject.repository;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserDao {

	User selectByUserid(String userId);

	int insert(User user);

	User selectByUseridAndPassword(User user);

	User selectByUserEmail(String userEmail);

	@Update("update users set user_password = #{userPassword}, user_phone = #{userPhone} where user_id = #{userId}")
	int updateUser(User user);

	@Update("UPDATE users SET profile_picture_url = #{profilePictureUrl} WHERE user_id = #{userId}")
	int updateProfilePicture(User user);

	String findIdByNameAndEmail(@Param("user_name") String name, @Param("user_email") String email);

	String findPasswordByNameAndEmailAndId(@Param("user_name") String name, @Param("user_email") String email,
			@Param("user_id") String id);

}