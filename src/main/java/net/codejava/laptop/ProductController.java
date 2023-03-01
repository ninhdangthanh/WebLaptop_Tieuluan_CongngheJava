package net.codejava.laptop;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		System.out.println("Thêm Laptop thành công");
    	return "admin_dashboard_add";
    }
	
}
