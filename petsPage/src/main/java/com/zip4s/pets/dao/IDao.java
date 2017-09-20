package com.zip4s.pets.dao;

import java.util.ArrayList;

import com.zip4s.pets.dto.BoardDTO;
import com.zip4s.pets.dto.CartDTO;
import com.zip4s.pets.dto.CustomerDTO;
import com.zip4s.pets.dto.ProductDTO;

public interface IDao {
	
	
<<<<<<< HEAD
	//È¸¿ø manipulation DAO
=======
	//ìœ ì € DAO
>>>>>>> jin-dev
	public CustomerDTO getCustomerDao(String id, String pw);
	public void addCustomerDao(String id, String pw, String cname, String phone, String addr);
	public void deleteCustomerDao(String id);
	
<<<<<<< HEAD
	//°Ô½ÃÆÇ manipulation DAO
=======
	//ê²Œì‹œíŒ DAO
>>>>>>> jin-dev
	public ArrayList<BoardDTO> getBoardListDao();
	public void writeBoardDao(String subject, String id, String pw, String content);
	public BoardDTO getBoardDao(int bno);
	public void deleteBoardDao(int bno);
	public void updateBoardDao(int bno, String subject, String id, String pw, String content);
	
<<<<<<< HEAD
	//Àå¹Ù±¸´Ï
	public ArrayList<CartDTO> getCartList(int cno);
	public void deleteFromCart(int cno, int pno);
	
	//Á¦Ç°
=======
	//ì¹´íŠ¸ DAO
	public ArrayList<CartDTO> getCartList(int cno);
	public void deleteFromCart(int cno, int pno);
	public void addToCartDao(int pno, int cno, int qty);
	
	//ì œí’ˆ DAO
>>>>>>> jin-dev
	public ProductDTO getProductDao(int pno);
	public ArrayList<ProductDTO> getProductListDao();

}
