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
    		@RequestParam(value = "searchingPage", required = false) String searchInputValue,
    		@RequestParam(value = "deleteLaptopSuccess", required = false) String deleteLaptopSuccess,
    		@RequestParam(value = "editProductStatus", required = false) String editProductStatus
    		) {
    	
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
    	if(deleteLaptopSuccess != null) {
    		map.addAttribute("deleteLaptopSuccessOk", "Xóa thành công");
    	}
    	if(editProductStatus != null) {
    		map.addAttribute("editProductStatus", "Chỉnh sửa thành công");
    	}
    	
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
    
    
    @RequestMapping("/admin_page_logout")
    public String AdminPageLogout(ModelMap map, HttpServletRequest request) {
    	HttpSession session = request.getSession();
        String isAdmin = (String) session.getAttribute("isAdmin");
        if(isAdmin != null) {
        	session.invalidate();
        }
        
        return "redirect:/";
    }
    
    
    @RequestMapping("/admin_user_dashboard")
    public String AdminUserDashboard(ModelMap map,
    		@RequestParam(value = "deleteUserSuccess", required = false) String deleteUserSuccess,
    		@RequestParam(value = "editUserSuccess", required = false) String editUserSuccess) {
    	
    	List<User> listUser = userDAO.getAllUser();
    	map.addAttribute("adminUser", listUser.get(0));
    	listUser.remove(0);
    	map.addAttribute("listUser", listUser);
    	
    	if(deleteUserSuccess != null) {
    		map.addAttribute("deleteUserSuccessOk", "Xóa User thành công");
    	}
    	if(editUserSuccess != null) {
    		map.addAttribute("editUserSuccessOk", "Chỉnh sửa thông tin User thành công");
    	}
    	
    	return "admin_user_dashboard";
    }
    
    @RequestMapping("/admin_user_dashboard_add")
    public String AdminUserDashboardAdd(ModelMap map) {
    	
    	return "admin_user_dashboard_add";
    }
    
    @RequestMapping(value = "/admin_user_add", method = RequestMethod.POST)
    public String AdminUserDashboardAddPost(ModelMap map,
    		@RequestParam("email") String email,
    		@RequestParam("password") String password) {
    	
    	userDAO.saveUserManager(email, password, "manager");
    	map.addAttribute("addUserStatus", "Thêm tài khoản User thành công");
    	
    	return "admin_user_dashboard_add";
    }
    
    
    @RequestMapping("/admin_user_dashboard_delete")
    public String AdminUserDashboardDelete(ModelMap map,
    		@RequestParam("id") String id) {
    	
    	User userDel = userDAO.getUserDelete(id);
    	map.addAttribute("userDel", userDel);
    	
    	return "admin_user_dashboard_delete";
    }
    
    @RequestMapping("/admin_user_dashboard_edit")
    public String AdminUserDashboardEdit(ModelMap map,
    		@RequestParam("id") String id) {
    	
    	User userEdit = userDAO.getUserDelete(id);
    	map.addAttribute("userEdit", userEdit);
    	
    	return "admin_user_dashboard_edit";
    }
    
    
    @RequestMapping("/admin_user_edit")
    public String AdminUserDashboardEditConfirm(ModelMap map,
    		@RequestParam("id") String id,
    		@RequestParam("email") String email,
    		@RequestParam("password") String password) {
    	
    	userDAO.updateUser(email, password);
    	
    	map.addAttribute("editUserSuccess", "Chỉnh sửa User thành công");
    	
    	return "redirect:/admin_user_dashboard";
    }
    
    @RequestMapping("/admin_user_dashboard_delete_confirm")
    public String AdminUserDashboardDeleteConfirm(ModelMap map,
    		@RequestParam("id") String id) {
    	
    	userDAO.deleteUser(id);
    	map.addAttribute("deleteUserSuccess", "Xóa User thành công");
    	
    	return "redirect:/admin_user_dashboard";
    }
    
    
    
}
