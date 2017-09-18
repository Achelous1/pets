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
		//���̹�Ƽ���� ����Ͽ� customer �Ӽ� ��ȯ
		model.addAttribute("customer", dao.getCustomerDao(id, pw));
		session.setAttribute("login_info", dao);
		return "index";
	}
}