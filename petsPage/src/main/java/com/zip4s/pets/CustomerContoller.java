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
	private SqlSession sqlSession;

	@RequestMapping(value = "/loginChk", method = RequestMethod.POST)
	public String loginChk(CustomerDTO customer, HttpSession session) {
		String id = customer.getId();
		String pw = customer.getPw(); 
		IDao dao = sqlSession.getMapper(IDao.class);
		
		customer = dao.getCustomerDao(id, pw);	
		session.setAttribute("customer_info", customer);
		return "index";
	}
	
	@RequestMapping(value = "/signupChk", method = RequestMethod.POST)
	public String signupChk(CustomerDTO customer) {
		
		System.out.println(customer);
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.addCustomerDao(customer.getId(), 
							customer.getPw(), 
							customer.getCname(), 
							customer.getPhone(), 
							customer.getAddr());
		
		return "index";
	}
	
	@RequestMapping("/logout")
	public String logout() {

		return "logout";
	}

}