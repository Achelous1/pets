package com.zip4s.pets;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zip4s.pets.dao.IDao;
import com.zip4s.pets.dto.CartDTO;
import com.zip4s.pets.dto.CustomerDTO;
import com.zip4s.pets.dto.ProductDTO;

@Controller
public class CartController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/addCart")
	public String addCart(HttpServletRequest request, ProductDTO product, CustomerDTO customer) {
		
		//Cart 테이블에 pno와 cno, qty를 넣는 코드
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.addToCartDao(product.getPno(), 
						customer.getCno(), 
						Integer.parseInt(request.getParameter("qty")));
		
		return "cartcheck";
	}
	
	@RequestMapping("/cart")
	public String cart(HttpServletRequest request, Model model) {
		
		String param = request.getParameter("cno");
		int cno = Integer.parseInt(param);
		
		//Cart 테이블에서 장바구니 정보 가지고 오는 코드
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<CartDTO> cartList = dao.getCartList(cno);
		
		model.addAttribute("list_cart", cartList);
		
		return "cart";
	}
	
	@RequestMapping("/cartDelete")
	public String cartDelete(HttpServletRequest request, Model model) {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		//Cart 테이블에서 장바구니 정보 지우는 코드
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.deleteCartItemDao(pno, cno);
		
		
		return "cart";
	}
	
	
}
