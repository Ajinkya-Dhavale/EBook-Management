package com.DAO;

import com.entity.Contact;
import com.entity.user;

public interface UserDAO {
	public boolean userResister(user us);
	public user login(String email,String password);
	public boolean checkPassword(int id,String password);
	public boolean userUpdate(user u);
	public boolean checkingRegistrationEmail(String email);
	
	public boolean ContactUs(Contact c);
}
