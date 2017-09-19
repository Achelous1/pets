package com.zip4s.pets;

import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zip4s.pets.dao.IDao;
import com.zip4s.pets.dto.BoardDTO;
import com.zip4s.pets.dto.CustomerDTO;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/board")
	public String board(Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		model.addAttribute("board_list", dao.getBoardListDao());
		
		return "list";
	}
	
	@RequestMapping(value = "/join")
	public String join() {
		return "join";
	}
	
	@RequestMapping(value = "/cart")
	public String cart() {
		return "cart";
	}
}