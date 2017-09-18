package com.zip4s.pets.dao;

import java.util.ArrayList;

import com.zip4s.pets.dto.BoardDTO;
import com.zip4s.pets.dto.CustomerDTO;

public interface IDao {
	
	
	//회원 manipulation DAO
	public CustomerDTO getCustomerDao(String id, String pw);
	public void addCustomerDao(String id, String pw, String cname, String phone, String addr);
	public void deleteCustomerDao(String id);
	
	//게시판 manipulation DAO
	public ArrayList<BoardDTO> getBoardListDao();
	public void writeBoardDao();
	
	//장바구니
	
	//제품
	
	
/*	public ArrayList<ContentDto> listDao();
	public void writeDao(String mWriter, String mContent);
	public ContentDto viewDao(String strID);
	public void deleteDao(String bId);*/
}
