package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Contact;
import com.entity.user;

public class UserDAOImpl implements UserDAO 
{
	Connection conn;
	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userResister(user us) {
		boolean b=false;
		try {
			String sql="insert into user(name,email,phone,address,password) values(?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,us.getName());
			ps.setString(2,us.getEmail());
			ps.setString(3,us.getPhone());
			ps.setString(4,us.getAddress());
			ps.setString(5,us.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				b=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public user login(String email, String password) {
		user us=null;
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,password);
			
			ResultSet set=ps.executeQuery();
			
			while(set.next())
			{
				us=new user();
				us.setId(set.getInt(1));
				us.setName(set.getString(2));
				us.setEmail(set.getString(3));
				us.setPhone(set.getString(4));
				us.setPassword(set.getString(5));
				us.setAddress(set.getString(6));			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	@Override
	public boolean checkPassword(int id, String password) {
		boolean f=false;
		try {
			String sql="select * from user where id=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, password);
			
			ResultSet set=ps.executeQuery();
			while(set.next())
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	@Override
	public boolean userUpdate(user u)
	{
		boolean f=false;
		try {
			String sql="update user set name=?,email=?,phone=?,address=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,u.getName());
			ps.setString(2,u.getEmail());
			ps.setString(3,u.getPhone());
			ps.setString(4,u.getAddress());
			ps.setInt(5,u.getId());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean checkingRegistrationEmail(String email) {
		boolean f=true;
		
		try {
			String sql="select * from user where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
	
			ResultSet set=ps.executeQuery();
			while(set.next())
			{
				f=false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public boolean ContactUs(Contact c) {
		boolean f=false;
			
		try {
			String sql="insert into contact(user_name,user_email,user_phone,message) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, c.getUser_name());
			ps.setString(2, c.getUser_email());
			ps.setString(3, c.getUser_phone());
			ps.setString(4, c.getUser_message());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			else {
				f=false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	

}
