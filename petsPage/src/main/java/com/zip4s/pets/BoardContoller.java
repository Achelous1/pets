package com.zip4s.pets;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardContoller {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value = "/list")
	public String list() {
		return "list";
	}
}
