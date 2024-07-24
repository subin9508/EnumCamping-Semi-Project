package com.itwill.semiproject.repository;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserDao {

	User selectByUserid(String userId); // userId로 사용자 조회

	int insert(User user); // 사용자 데이터 베이스 삽입

	User selectByUseridAndPassword(User user); // 사용자 아이디 비밀번호 조회

	User selectByUserEmail(String userEmail); // 이메일로 사용자 조회

	@Update("update users set user_password = #{userPassword}, user_phone = #{userPhone} where user_id = #{userId}")
	int updateUser(User user);

	String findIdByNameAndEmail(@Param("user_name") String name, @Param("user_email") String email);

	String findPasswordByNameAndEmailAndId(@Param("user_name") String name, @Param("user_email") String email,
			@Param("user_id") String id);
	
	
	Integer checkPassword(Integer userKey, String userPassword); // 비밀번호 확인 메서드
	
	int deactivateUser(Integer userKey); // 회원 비활성화 메서드
	
    int insertDeletedUser(Integer userKey); // 탈퇴 회원 정보 저장 메서드
    
    User selectUserById(Integer userKey); // 사용자 ID로 사용자 정보 조회 메서드
    
    Integer checkUserIsActive(String userId); // 회원 활성 확인 여부 메서드
    
    Integer checkDeactivationPeriod(String userId); // 비활성화 기간 확인 메서드
    
    int updateProfileImage(User user);
}