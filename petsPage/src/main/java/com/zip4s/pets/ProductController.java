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
	public String products(Model model, HttpServletRequest request) {
		
		String item = request.getParameter("item");
		String viewPage = null;
		IDao dao = sqlSession.getMapper(IDao.class);
		
		if(item == null || item =="") {
			model.addAttribute("product_list", dao.getProductListDao());
			viewPage = "shopping";
		} else if(!item.isEmpty()) {
			model.addAttribute("product_list", dao.selectByItemDao(item));
			if(item.equals("toy")) { request.setAttribute("item", "장난감"); }
			else if(item.equals("clothes")) { request.setAttribute("item", "옷"); }
			else if(item.equals("snack")) { request.setAttribute("item", "간식"); }
			viewPage = "searchItemList";
		}
		return viewPage;
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
		
		String searchStr = request.getParameter("searchStr");
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<ProductDTO> product_list = dao.searchProductDao(searchStr);
		
		System.out.println(searchStr);
		System.out.println(product_list);
		
		request.setAttribute("item", searchStr);
		model.addAttribute("product_list", product_list);
		
		return "searchItemList";
	}

}