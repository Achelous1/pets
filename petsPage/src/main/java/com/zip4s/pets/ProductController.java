package com.zip4s.pets;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zip4s.pets.dao.IDao;
import com.zip4s.pets.dto.ProductDTO;

@Controller
public class ProductController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/shopping")
	public String products(Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		model.addAttribute("product_list", dao.getProductListDao());
		
		System.out.println(dao.getProductListDao());
		
		return "shopping";
	}
	
	@RequestMapping("/iteminfo")
	public String productDdtail(Model model, HttpServletRequest request) {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		IDao dao = sqlSession.getMapper(IDao.class);
		model.addAttribute("item_info", dao.getProductDao(pno));
		
		return "iteminfo";
	}
	
	@RequestMapping("/search")
	public String search(Model model, HttpServletRequest request) {
		
		ArrayList<ProductDTO> product_info = null;
		String searchStr = request.getParameter("searchStr");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		product_info = dao.searchProductDao(searchStr);
		
		model.addAttribute("product_info", product_info);
		
		return "searchItemList";
	}

}