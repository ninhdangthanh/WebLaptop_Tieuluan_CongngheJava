package net.codejava.laptop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.codejava.model.LaptopDetail;
import net.codejava.model.User;


@Repository
public class UserDAO {
	@Autowired
    private DataSource dataSource;
	
	public User getUserLoginFromDatabase(String username) {
        User userFromDB = null;
        try (Connection conn = dataSource.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select * from user where email=? limit 1")) {
	           stmt.setString(1, username);
	           ResultSet resultSet = stmt.executeQuery();
	           while (resultSet.next()) {
	        	   	int id = resultSet.getInt("id");
	            	String email = resultSet.getString("email");
	            	String password = resultSet.getString("password");
	            	String role = resultSet.getString("role");
	            	userFromDB = new User(id, email, password, role);
	           }
	       } catch (SQLException ex) {
	           // handle exception
	       }
        return userFromDB;
    }
}
