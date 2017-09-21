package com.zip4s.pets.dao;

import java.util.ArrayList;

import com.zip4s.pets.dto.BoardDTO;
import com.zip4s.pets.dto.CartDTO;
import com.zip4s.pets.dto.CustomerDTO;
import com.zip4s.pets.dto.ProductDTO;

public interface IDao {
	//유저 DAO
	public CustomerDTO getCustomerDao(String id, String pw);
	public void addCustomerDao(String id, String pw, String cname, String phone, String addr);
	public void deleteCustomerDao(String id);
	
	//게시판 DAO
	public ArrayList<BoardDTO> getBoardListDao();
	public void writeBoardDao(String subject, String id, String pw, String content);
	public BoardDTO getBoardDao(int bno);
	public void deleteBoardDao(int bno);
	public void updateBoardDao(int bno, String subject, String id, String pw, String content);
	
	//카트 DAO
	public ArrayList<CartDTO> getCartList(int cno);
	public void deleteCartItemDao(int pno, int cno);
	public void addToCartDao(int pno, int cno, int qty);
	
	//제품 DAO
	public ProductDTO getProductDao(int pno);
	public ArrayList<ProductDTO> getProductListDao();
	public ArrayList<ProductDTO> searchProductDao(String searchStr);
}
