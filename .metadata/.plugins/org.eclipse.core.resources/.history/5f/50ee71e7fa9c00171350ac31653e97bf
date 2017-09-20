package com.zip4s.pets;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zip4s.pets.dao.IDao;

@Controller
public class ProductController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/productDetail")
	public String productDtail(Model model, HttpServletRequest request) {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		IDao dao = sqlSession.getMapper(IDao.class);
		model.addAttribute("productDetail", dao.getProductDao(pno));
		
		return "productDetail";
	}

}
