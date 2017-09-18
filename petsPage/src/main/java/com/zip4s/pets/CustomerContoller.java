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
		IDao dao = sqlSession.getMapper(IDao.class);
		//ï¿½ï¿½ï¿½Ì¹ï¿½Æ¼ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Ï¿ï¿½ customer ï¿½Ó¼ï¿½ ï¿½ï¿½È¯
		model.addAttribute("customer", dao.getCustomerDao(id, pw));
		session.setAttribute("login_info", dao);
		return "index";
	}
	
	@RequestMapping(value = "/signinChk", method = RequestMethod.POST)
	public String signinChk(CustomerDTO customer) {
		//interface IDao¿Í ¸ÅÇÎ. ¸ÅÇÎÀº xml·Î ÀÛ¼º
		IDao dao = sqlSession.getMapper(IDao.class);
		//¸¶ÀÌ¹ÙÆ¼½º¸¦ »ç¿ëÇÏ¿© customer ¼Ó¼º ¹ÝÈ¯
		dao.addCustomerDao(customer.getId(), 
							customer.getPw(), 
							customer.getCname(), 
							customer.getPhone(), 
							customer.getAddr());
		return "index";
	}
}