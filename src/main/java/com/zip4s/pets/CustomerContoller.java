package com.zip4s.pets;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.zip4s.pets.dao.*;

@Controller
public class CustomerContoller {

	@RequestMapping(value = "/loginChk", method = RequestMethod.POST)
	public String loginChk(Model model, HttpSession session) {
		//interface IDAO�� ����. ������ xml�� �ۼ�
		IDao dao = sqlSession.getMapper(IDao.class);
		//���̹�Ƽ���� ����Ͽ� list �Ӽ� ��ȯ
		model.addAttribute("customer", dao.listDao());
		return "index";
	}
 	
	
}
