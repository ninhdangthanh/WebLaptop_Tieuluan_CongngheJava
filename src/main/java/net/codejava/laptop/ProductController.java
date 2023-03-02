package net.codejava.laptop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.codejava.model.LaptopDetail;

@Controller
public class ProductController {

	@Autowired
    private LaptopDAO laptopdao;
	
	@RequestMapping(value = "/admin_dashboard_add", method=RequestMethod.POST, params = "link_img")
    public String adminDashboardAddPost(ModelMap map,
    		@RequestParam(value = "trademark_name", required = false) String trademark_name,
    		@RequestParam(value = "series", required = false) String series,
    		@RequestParam(value = "name", required = false) String name,
    		@RequestParam(value = "price", required = false) int price,
    		@RequestParam(value = "past_price", required = false) int past_price,
    		@RequestParam(value = "cpu_compact", required = false) String cpu_compact,
    		@RequestParam(value = "ram_compact", required = false) String ram_compact,
    		@RequestParam(value = "memory_compact", required = false) String memory_compact,
    		@RequestParam(value = "screen_compact", required = false) String screen_compact,
    		@RequestParam(value = "link_img", required = false) String link_img,
    		 HttpServletRequest request) {
    	
		System.out.println("screen_compact");
		int trademark_id = 1;
		String cpu = "Intel " + cpu_compact + " - 3.7 Ghz up 4.6Ghz 4MB";
		
		
		if(trademark_name.equals("Dell")) {
			trademark_id = 1;
		} else if (trademark_name.equals("Asus")) {
			trademark_id = 2;
		} else if (trademark_name.equals("Acer")) {
			trademark_id = 3;
		}
		
    	
		laptopdao.saveLaptopProduct(name, Integer.toString(price), price, series, Integer.toString(past_price), cpu, cpu_compact, ram_compact + " 2133MHz LPDDR3", ram_compact, memory_compact, "NVIDIA Quadro T1000 2GB GDDR5", screen_compact + " HD+ ( 2560 x 1600 )", screen_compact, link_img, trademark_id);
		map.addAttribute("addProductStatus", "Thêm Laptop thành công");
//		System.out.println("Thêm Laptop thành công");
    	return "admin_dashboard_add";
    } 
	
	
	@RequestMapping("/admin_dashboard_delete")
    public String AdminDashboardDelete(ModelMap map, HttpServletRequest request,
    		@RequestParam(value = "id", required = true) String id) {
		
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
        
        LaptopDetail ltdt = laptopdao.getLaptopDetail(id);
        
        map.addAttribute("laptopDelete", ltdt);
        
        return "admin_dashboard_delete";
    }
	
	
	@RequestMapping("/admin_dashboard_delete_confirm")
    public String AdminDashboardDeleteConfirm(ModelMap map, HttpServletRequest request,
    		@RequestParam(value = "id", required = true) String id) {
		
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
        
        LaptopDetail ltdt = laptopdao.getLaptopDetail(id);
        laptopdao.deleteLaptopProduct(Integer.parseInt(id));
        
        map.addAttribute("deleteLaptopSuccess", "Xóa thành công");
        
        return "redirect:/admin_dashboard";
    }
	
	@RequestMapping("/admin_dashboard_edit")
    public String AdminDashboardEdit(ModelMap map, HttpServletRequest request,
    		@RequestParam(value = "id", required = true) String id) {
		
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
        
        LaptopDetail ltdt = laptopdao.getLaptopDetail(id);
        
        map.addAttribute("laptopEdit", ltdt);
        
        return "admin_dashboard_edit";
    }
	
	@RequestMapping(value = "/admin_dashboard_edit", method=RequestMethod.POST, params = "screen_compact")
    public String AdminDashboardEditPost(ModelMap map,
    		@RequestParam(value = "trademark_name", required = false) String trademark_name,
    		@RequestParam(value = "series", required = false) String series,
    		@RequestParam(value = "name", required = false) String name,
    		@RequestParam(value = "price", required = false) int price,
    		@RequestParam(value = "past_price", required = false) String past_price,
    		@RequestParam(value = "cpu_compact", required = false) String cpu_compact,
    		@RequestParam(value = "ram_compact", required = false) String ram_compact,
    		@RequestParam(value = "memory_compact", required = false) String memory_compact,
    		@RequestParam(value = "screen_compact", required = false) String screen_compact,
    		@RequestParam(value = "link_img", required = false) String link_img,
    		@RequestParam(value = "id", required = false) String id,
    		 HttpServletRequest request) {
    	
		System.out.println("screen_compact");
		int trademark_id = 1;
		String cpu = "Intel " + cpu_compact + " - 3.7 Ghz up 4.6Ghz 4MB";
		
		
		if(trademark_name.equals("Dell")) {
			trademark_id = 1;
		} else if (trademark_name.equals("Asus")) {
			trademark_id = 2;
		} else if (trademark_name.equals("Acer")) {
			trademark_id = 3;
		}
		
		laptopdao.saveEditLaptopProduct(name, Integer.toString(price), price, series, past_price, cpu, cpu_compact, ram_compact + " 2133MHz LPDDR3", ram_compact, memory_compact, "NVIDIA Quadro T1000 2GB GDDR5", screen_compact + " HD+ ( 2560 x 1600 )", screen_compact, link_img, trademark_id, Integer.valueOf(id));
		
		map.addAttribute("editProductStatus", "Chỉnh sửa Laptop thành công");
        
        return "redirect:/admin_dashboard";
    } 
	
}
