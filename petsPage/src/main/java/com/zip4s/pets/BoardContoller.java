package com.zip4s.pets;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BoardContoller {
	
	@Autowired
	public static SqlSession sqlSession;
}
