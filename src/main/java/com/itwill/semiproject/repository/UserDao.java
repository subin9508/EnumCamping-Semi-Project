package com.itwill.semiproject.repository;

import org.apache.ibatis.annotations.Param;

public interface UserDao {

    User selectByUserid(String userid);
    int insert(User user);
    User findIdByNameAndEmail(@Param("user_name")String name,@Param("user_email")String email);
}