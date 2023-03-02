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

import net.codejava.model.Laptop;
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
	
	
	public List<User> getAllUser() {
        List<User> users = new ArrayList<>();
        
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM user");
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
            	int id = resultSet.getInt("id");
            	String email = resultSet.getString("email");
            	String password = resultSet.getString("password");
            	String role = resultSet.getString("role");
               
            	users.add(new User(id, email, password, role) );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return users;
    }
	
	public void saveUserManager(String email, String password, String role) {
        String sql = "insert into user(email, password, role) values \r\n"
        		+ "(?,?,?);";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, role);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	
	public User getUserDelete(String idUser) {
        User userDel = null;
        try (Connection conn = dataSource.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select * from user where id = ? limit 1" )) {
	           stmt.setString(1, idUser);
	           ResultSet resultSet = stmt.executeQuery();
	           while (resultSet.next()) {
	        	   	int id = resultSet.getInt("id");
	            	String email = resultSet.getString("email");
	            	String password = resultSet.getString("password");
	            	String role = resultSet.getString("role");
	            	userDel =  new User(id, email, password, role);
	           }
	       } catch (SQLException ex) {
	           // handle exception
	       }
        return userDel;
    }
	
	
	public void deleteUser(String id) {
		String sql = "delete from user where id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	
	public void updateUser(String email, String password) {
		String sql = "update user set password = ? where email = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, password);
            ps.setString(2, email);
            System.out.println(sql);
            System.out.println(conn);
            System.out.println(ps);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
