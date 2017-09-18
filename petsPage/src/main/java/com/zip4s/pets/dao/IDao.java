package com.zip4s.pets.dao;

import com.zip4s.pets.dto.CustomerDTO;

public interface IDao {
	public CustomerDTO getCustomerDao(String id, String pw);
/*	public ArrayList<ContentDto> listDao();
	public void writeDao(String mWriter, String mContent);
	public ContentDto viewDao(String strID);
	public void deleteDao(String bId);*/
}
