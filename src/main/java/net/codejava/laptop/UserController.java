package net.codejava.laptop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.codejava.model.Laptop;
import net.codejava.model.LaptopDetail;
import net.codejava.model.User;

@Controller
public class UserController {
	
	@Autowired
    private UserDAO userDAO;
	
	@Autowired
    private LaptopDAO laptopdao;
	
	
	  
    @RequestMapping(value = "/user_login", method=RequestMethod.POST,  params = "email")
    public String userLogin(ModelMap map, HttpServletRequest request,
    		@RequestParam(value = "email", required = true) String email,
    		@RequestParam(value = "password", required = true) String password) {
		User userLogin = userDAO.getUserLoginFromDatabase(email);
		if (userLogin == null) {
			map.addAttribute("loginFailed", "Đăng nhập thất bại, email hoặc password không chính xác!");
			return "login";
		}
		if (!userLogin.getPassword().equals(password)) {
			map.addAttribute("loginFailed", "Đăng nhập thất bại, email hoặc password không chính xác!");
			return "login";
		}
		
		if(email.equals("admin")) {
			HttpSession session = request.getSession();
		    session.setAttribute("isAdmin", "True");
		} else {
			HttpSession session = request.getSession();
		    session.setAttribute("isAdmin", "False");
		}
		
		 return "redirect:/admin_dashboard";
	}
    
    
    @RequestMapping("/admin_dashboard")
    public String adminDashboard(ModelMap map, HttpServletRequest request,
    		@RequestParam(value = "searchingPage", required = false) String searchInputValue) {
    	
    	HttpSession session = request.getSession();
        String isAdmin = (String) session.getAttribute("isAdmin");
    	if(isAdmin != null) {
    		if(isAdmin.equals("True")) {
        		map.addAttribute("isAdmin", true);
        	} else {
        		map.addAttribute("isAdmin", false);
        	}
    	} else {
    		map.addAttribute("isAdmin", false);
    	}
    	
    	String sttm = "";
    	
    	if(searchInputValue == null) {
    		 sttm = "select lt.*, tm.trademark_name from laptop lt inner join trademark tm on tm.id = lt.trademark_id where LOWER(lt.name) like LOWER('%%')";
    	} else {
    		 sttm = "select lt.*, tm.trademark_name from laptop lt inner join trademark tm on tm.id = lt.trademark_id where LOWER(lt.name) like LOWER('%"+ searchInputValue +"%')";
    	}
    	List<LaptopDetail> listLaptop = laptopdao.getSearchLaptops(sttm);
    	
    	map.addAttribute("LaptopInAdminPage", listLaptop);
    	
    	return "admin_dashboard";
    }
    
    @RequestMapping(value = "/admin_dashboard", method = RequestMethod.POST, params = "searchingPageAdmin")
    public String adminDashboardPost(ModelMap map, HttpServletRequest request,
    		@RequestParam(value = "searchingPageAdmin", required = true) String searchingPageAdmin) {
    	System.out.println("Start admin");
    	HttpSession session = request.getSession();
        String isAdmin = (String) session.getAttribute("isAdmin");
    	if(isAdmin != null) {
    		if(isAdmin.equals("True")) {
        		map.addAttribute("isAdmin", true);
        	} else {
        		map.addAttribute("isAdmin", false);
        	}
    	} else {
    		map.addAttribute("isAdmin", false);
    	}
    	
    	String sttm = "";
    	
    	if(searchingPageAdmin == null) {
    		 sttm = "select lt.*, tm.trademark_name from laptop lt inner join trademark tm on tm.id = lt.trademark_id where LOWER(lt.name) like LOWER('%%')";
    	} else {
    		 sttm = "select lt.*, tm.trademark_name from laptop lt inner join trademark tm on tm.id = lt.trademark_id where LOWER(lt.name) like LOWER('%"+ searchingPageAdmin +"%')";
    	}
    	
    	System.out.println(sttm);
    	System.out.println(isAdmin);
    	
    	
    	List<LaptopDetail> listLaptop = laptopdao.getSearchLaptops(sttm);
    	System.out.println(listLaptop);
    	map.addAttribute("LaptopInAdminPage", listLaptop);
    	
    	return "admin_dashboard";
    }
    
    
    @RequestMapping("/admin_dashboard_add")
    public String adminDashboardAdd(ModelMap map, HttpServletRequest request) {
    	
    	HttpSession session = request.getSession();
        String isAdmin = (String) session.getAttribute("isAdmin");
    	if(isAdmin != null) {
    		if(isAdmin.equals("True")) {
        		map.addAttribute("isAdmin", true);
        	} else {
        		map.addAttribute("isAdmin", false);
        	}
    	} else {
    		map.addAttribute("isAdmin", false);
    	}
    	
    	return "admin_dashboard_add";
    }
    
    
    
}
