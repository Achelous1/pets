package com.zip4s.pets;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zip4s.pets.dao.IDao;
import com.zip4s.pets.dto.BoardDTO;

@Controller
public class BoardContoller {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, Model model) {
		
		int page = Integer.parseInt(request.getParameter("page"));
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<BoardDTO> board_list = dao.getBoardListDao(page);
		
		model.addAttribute("board_list");
		return "list";
	}
}
