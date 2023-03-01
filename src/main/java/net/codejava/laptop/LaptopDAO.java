package net.codejava.laptop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.codejava.model.Laptop;
import net.codejava.model.LaptopDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


@Repository
public class LaptopDAO {
	@Autowired
    private DataSource dataSource;
	
	
	public List<Laptop> getAllLaptops() {
        List<Laptop> laptop = new ArrayList<>();
        
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM laptop");
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
            	int id = resultSet.getInt("id");
            	String name = resultSet.getString("name");
            	String price = resultSet.getString("price");
            	int price_real = resultSet.getInt("price_real");
            	String series = resultSet.getString("series");
            	String past_price = resultSet.getString("past_price");
            	String cpu = resultSet.getString("cpu");
            	String cpu_compact = resultSet.getString("cpu_compact");
            	String ram = resultSet.getString("ram");
            	String ram_compact = resultSet.getString("ram_compact");
            	String memory_compact = resultSet.getString("memory_compact");
            	String card = resultSet.getString("card");
            	String screen = resultSet.getString("screen");
            	String screen_compact = resultSet.getString("screen_compact");
            	String link_img = resultSet.getString("link_img");
            	String trademark_id = resultSet.getString("trademark_id");
               
                laptop.add(new Laptop(id, name, price, price_real, series, past_price, cpu,
            			cpu_compact, ram, ram_compact, memory_compact, card, screen,
            			screen_compact, link_img, trademark_id) );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return laptop;
    }
	
	public List<LaptopDetail> get3LaptopDetailsInHomepage(String tm_name) {
        List<LaptopDetail> laptopdetails = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select lt.*, tm.trademark_name from laptop lt inner join trademark tm on tm.id = lt.trademark_id where tm.trademark_name = ?")) {
	           stmt.setString(1, tm_name);
	           ResultSet resultSet = stmt.executeQuery();
	           while (resultSet.next()) {
	        	   int id = resultSet.getInt("id");
	            	String name = resultSet.getString("name");
	            	String price = resultSet.getString("price");
	            	int price_real = resultSet.getInt("price_real");
	            	String series = resultSet.getString("series");
	            	String past_price = resultSet.getString("past_price");
	            	String cpu = resultSet.getString("cpu");
	            	String cpu_compact = resultSet.getString("cpu_compact");
	            	String ram = resultSet.getString("ram");
	            	String ram_compact = resultSet.getString("ram_compact");
	            	String memory_compact = resultSet.getString("memory_compact");
	            	String card = resultSet.getString("card");
	            	String screen = resultSet.getString("screen");
	            	String screen_compact = resultSet.getString("screen_compact");
	            	String link_img = resultSet.getString("link_img");
	            	String trademark_id = resultSet.getString("trademark_id");
	            	String trademark_name = resultSet.getString("trademark_name");
	               
	            	laptopdetails.add(new LaptopDetail(id, name, price, price_real, series, past_price, cpu,
	            			cpu_compact, ram, ram_compact, memory_compact, card, screen,
	            			screen_compact, link_img, trademark_id, trademark_name) );
	           }
	       } catch (SQLException ex) {
	           // handle exception
	       }
        return laptopdetails;
    }
	
	public List<LaptopDetail> getTrademarkLaptop(String tm_name, String tm_series) {
		String defaultValue = "default";
		String sttm;
		if(tm_series.equals(" ")) {
			 sttm = "select lt.*, tm.trademark_name from laptop lt inner join trademark tm on tm.id = lt.trademark_id where tm.trademark_name = ? or lt.series = ?";
		}else {
			 sttm = "select lt.*, tm.trademark_name from laptop lt inner join trademark tm on tm.id = lt.trademark_id where tm.trademark_name = ? and lt.series = ?";
		}
        List<LaptopDetail> laptopdetails = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sttm)) {
	           stmt.setString(1, tm_name);
	           stmt.setString(2, tm_series);
	           ResultSet resultSet = stmt.executeQuery();
	           while (resultSet.next()) {
	        	   int id = resultSet.getInt("id");
	            	String name = resultSet.getString("name");
	            	String price = resultSet.getString("price");
	            	int price_real = resultSet.getInt("price_real");
	            	String series = resultSet.getString("series");
	            	String past_price = resultSet.getString("past_price");
	            	String cpu = resultSet.getString("cpu");
	            	String cpu_compact = resultSet.getString("cpu_compact");
	            	String ram = resultSet.getString("ram");
	            	String ram_compact = resultSet.getString("ram_compact");
	            	String memory_compact = resultSet.getString("memory_compact");
	            	String card = resultSet.getString("card");
	            	String screen = resultSet.getString("screen");
	            	String screen_compact = resultSet.getString("screen_compact");
	            	String link_img = resultSet.getString("link_img");
	            	String trademark_id = resultSet.getString("trademark_id");
	            	String trademark_name = resultSet.getString("trademark_name");
	               
	            	laptopdetails.add(new LaptopDetail(id, name, price, price_real, series, past_price, cpu,
	            			cpu_compact, ram, ram_compact, memory_compact, card, screen,
	            			screen_compact, link_img, trademark_id, trademark_name) );
	           }
	       } catch (SQLException ex) {
	           // handle exception
	       }
        return laptopdetails;
    }
	
	
	public LaptopDetail getLaptopDetail(String laptop_id) {
        LaptopDetail laptopdetails = new LaptopDetail();
        try (Connection conn = dataSource.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select lt.*, tm.trademark_name from laptop lt inner join trademark tm on tm.id = lt.trademark_id where lt.id = ?" )) {
	           stmt.setString(1, laptop_id);
	           ResultSet resultSet = stmt.executeQuery();
	           while (resultSet.next()) {
	        	   int id = resultSet.getInt("id");
	            	String name = resultSet.getString("name");
	            	String price = resultSet.getString("price");
	            	int price_real = resultSet.getInt("price_real");
	            	String series = resultSet.getString("series");
	            	String past_price = resultSet.getString("past_price");
	            	String cpu = resultSet.getString("cpu");
	            	String cpu_compact = resultSet.getString("cpu_compact");
	            	String ram = resultSet.getString("ram");
	            	String ram_compact = resultSet.getString("ram_compact");
	            	String memory_compact = resultSet.getString("memory_compact");
	            	String card = resultSet.getString("card");
	            	String screen = resultSet.getString("screen");
	            	String screen_compact = resultSet.getString("screen_compact");
	            	String link_img = resultSet.getString("link_img");
	            	String trademark_id = resultSet.getString("trademark_id");
	            	String trademark_name = resultSet.getString("trademark_name");
	               
	            	return new LaptopDetail(id, name, price, price_real, series, past_price, cpu,
	            			cpu_compact, ram, ram_compact, memory_compact, card, screen,
	            			screen_compact, link_img, trademark_id, trademark_name);
	           }
	       } catch (SQLException ex) {
	           // handle exception
	       }
        return laptopdetails;
    }
	
	
	public List<LaptopDetail> getLaptopWithConfiguration(String sttm) {
		List<LaptopDetail> laptopWithConfiguration = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sttm)) {
	           ResultSet resultSet = stmt.executeQuery();
	           while (resultSet.next()) {
	        	   int id = resultSet.getInt("id");
	            	String name = resultSet.getString("name");
	            	String price = resultSet.getString("price");
	            	int price_real = resultSet.getInt("price_real");
	            	String series = resultSet.getString("series");
	            	String past_price = resultSet.getString("past_price");
	            	String cpu = resultSet.getString("cpu");
	            	String cpu_compact = resultSet.getString("cpu_compact");
	            	String ram = resultSet.getString("ram");
	            	String ram_compact = resultSet.getString("ram_compact");
	            	String memory_compact = resultSet.getString("memory_compact");
	            	String card = resultSet.getString("card");
	            	String screen = resultSet.getString("screen");
	            	String screen_compact = resultSet.getString("screen_compact");
	            	String link_img = resultSet.getString("link_img");
	            	String trademark_id = resultSet.getString("trademark_id");
	            	String trademark_name = resultSet.getString("trademark_name");
	               
	            	laptopWithConfiguration.add(new LaptopDetail(id, name, price, price_real, series, past_price, cpu,
	            			cpu_compact, ram, ram_compact, memory_compact, card, screen,
	            			screen_compact, link_img, trademark_id, trademark_name) );
	           }
	       } catch (SQLException ex) {
	           // handle exception
	       }
        return laptopWithConfiguration;
    }
	
	
	public List<LaptopDetail> getSearchLaptops(String sttm) {
		List<LaptopDetail> searchLaptops = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sttm)) {
        	ResultSet resultSet = stmt.executeQuery();
	           while (resultSet.next()) {
	        	   int id = resultSet.getInt("id");
	            	String name = resultSet.getString("name");
	            	String price = resultSet.getString("price");
	            	int price_real = resultSet.getInt("price_real");
	            	String series = resultSet.getString("series");
	            	String past_price = resultSet.getString("past_price");
	            	String cpu = resultSet.getString("cpu");
	            	String cpu_compact = resultSet.getString("cpu_compact");
	            	String ram = resultSet.getString("ram");
	            	String ram_compact = resultSet.getString("ram_compact");
	            	String memory_compact = resultSet.getString("memory_compact");
	            	String card = resultSet.getString("card");
	            	String screen = resultSet.getString("screen");
	            	String screen_compact = resultSet.getString("screen_compact");
	            	String link_img = resultSet.getString("link_img");
	            	String trademark_id = resultSet.getString("trademark_id");
	            	String trademark_name = resultSet.getString("trademark_name");
	               
	            	searchLaptops.add(new LaptopDetail(id, name, price, price_real, series, past_price, cpu,
	            			cpu_compact, ram, ram_compact, memory_compact, card, screen,
	            			screen_compact, link_img, trademark_id, trademark_name) );
	           }
	       } catch (SQLException ex) {
	           // handle exception
	       }
        return searchLaptops;
    }
	
	public void saveLaptopProduct(String name, String price, int price_real,String series,String past_price,String cpu,String cpu_compact,String ram,String ram_compact,String memory_compact,String card,String screen,String screen_compact,String link_img,int trademark_id) {
        String sql = "insert into laptop(name, price, price_real, series, past_price, cpu, cpu_compact, ram, ram_compact, memory_compact, card, screen, screen_compact, link_img, trademark_id) values \r\n"
        		+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setInt(3, price_real);
            ps.setString(4, series);
            ps.setString(5, past_price);
            ps.setString(6, cpu);
            ps.setString(7, cpu_compact);
            ps.setString(8, ram);
            ps.setString(9, ram_compact);
            ps.setString(10, memory_compact);
            ps.setString(11, card);
            ps.setString(12, screen);
            ps.setString(13, screen_compact);
            ps.setString(14, link_img);
            ps.setInt(15, trademark_id);
            System.out.println(ps);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
