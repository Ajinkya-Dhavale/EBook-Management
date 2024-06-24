package com.DAO;

import com.entity.Address;

public interface AddressDAO {
	public boolean save_address(Address o);
	public Address get_address(int user_id);
}
