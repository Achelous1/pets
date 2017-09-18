package com.zip4s.pets;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.zip4s.pets.dao.*;

@Controller
public class CustomerContoller {
	
	@Autowired
	public static SqlSession sqlSession;

	@RequestMapping(value = "/loginChk", method = RequestMethod.POST)
	public String loginChk(Model model, HttpSession session) {
		//interface IDAO와 매핑. 매핑은 xml로 작성
		IDao dao = sqlSession.getMapper(IDao.class);
		//마이바티스를 사용하여 list 속성 반환
		model.addAttribute("customer", dao.listDao());
		return "index";
	}
 	
	
}
