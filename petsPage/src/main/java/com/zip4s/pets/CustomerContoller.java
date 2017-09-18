package com.zip4s.pets;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.zip4s.pets.dao.*;
import com.zip4s.pets.dto.CustomerDTO;

@Controller
public class CustomerContoller {
	
	@Autowired
	public static SqlSession sqlSession;

	@RequestMapping(value = "/loginChk", method = RequestMethod.POST)
	public String loginChk(CustomerDTO customer, Model model, HttpSession session) {
		String id = customer.getId();
		String pw = customer.getPw();
		//interface IDao와 매핑. 매핑은 xml로 작성
		IDao dao = sqlSession.getMapper(IDao.class);
		//마이바티스를 사용하여 customer 속성 반환
		model.addAttribute("customer", dao.getCustomerDao(id, pw));
		session.setAttribute("login_info", dao);
		return "index";
	}
	
	@RequestMapping(value = "/signinChk", method = RequestMethod.POST)
	public String signinChk(CustomerDTO customer) {
		//interface IDao와 매핑. 매핑은 xml로 작성
		IDao dao = sqlSession.getMapper(IDao.class);
		//마이바티스를 사용하여 customer 속성 반환
		dao.addCustomerDao(customer.getId(), 
							customer.getPw(), 
							customer.getCname(), 
							customer.getPhone(), 
							customer.getAddr());
		return "index";
	}
}