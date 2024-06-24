package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.DB.DBConnect;
import com.entity.Address;
import com.entity.Book_order;

public class AddressDAOImpl implements AddressDAO {

	Connection conn;

	public AddressDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean save_address(Address o) {
		boolean f = false;

		try {
			// Check if address exists for the user
			PreparedStatement ps1 = conn.prepareStatement("select * from address where user_id=?");
			ps1.setInt(1, o.getUser_id());
			ResultSet set = ps1.executeQuery();

			if (set.next()) { // If address exists, update it
				String updateQuery = "UPDATE address SET user_name = ?, user_email = ?, user_address = ?, user_phone = ?, user_landmark = ?, user_state = ?, user_city = ?, user_pincode = ? WHERE user_id = ?";
				PreparedStatement ps2 = conn.prepareStatement(updateQuery);
				ps2.setString(1, o.getUserName());
				ps2.setString(2, o.getUserEmail());
				ps2.setString(3, o.getUserAddress());
				ps2.setString(4, o.getUserPhone());
				ps2.setString(5, o.getUserLandmark());
				ps2.setString(6, o.getUserState());
				ps2.setString(7, o.getUserCity());
				ps2.setString(8, o.getUserPincode());
				ps2.setInt(9, o.getUser_id());
				int i = ps2.executeUpdate();
				if (i == 1) {
					f = true;
				}
			} else { // If address doesn't exist, insert a new one
				String sql = "insert into address(user_id,user_name,user_email,user_address,user_phone,user_landmark,user_state,user_city,user_pincode) values(?,?,?,?,?,?,?,?,?)";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, o.getUser_id());
				ps.setString(2, o.getUserName());
				ps.setString(3, o.getUserEmail());
				ps.setString(4, o.getUserAddress());
				ps.setString(5, o.getUserPhone());
				ps.setString(6, o.getUserLandmark());
				ps.setString(7, o.getUserState());
				ps.setString(8, o.getUserCity());
				ps.setString(9, o.getUserPincode());
				int i = ps.executeUpdate();
				if (i == 1) {
					f = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public Address get_address(int user_id) {
	    Address address = null;
	    try {
	        // Prepare SQL query to select address based on user_id
	        String sql = "SELECT * FROM address WHERE user_id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, user_id);
	        
	        // Execute the query
	        ResultSet rs = ps.executeQuery();
	        
	        // Check if any address was found
	        if (rs.next()) {
	            // Create a new Address object and populate it with data from the ResultSet
	            address = new Address();
	            address.setUser_id(rs.getInt("user_id"));
	            address.setUserName(rs.getString("user_name"));
	            address.setUserEmail(rs.getString("user_email"));
	            address.setUserAddress(rs.getString("user_address"));
	            address.setUserPhone(rs.getString("user_phone"));
	            address.setUserLandmark(rs.getString("user_landmark"));
	            address.setUserState(rs.getString("user_state"));
	            address.setUserCity(rs.getString("user_city"));
	            address.setUserPincode(rs.getString("user_pincode"));
	        }
	        else {
				address=null;
			}
	        
	        // Close the ResultSet and PreparedStatement
	        rs.close();
	        ps.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return address;
	}

	

}
