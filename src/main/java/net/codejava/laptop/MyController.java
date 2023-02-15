package net.codejava.laptop;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.codejava.model.LaptopDetail;

@Controller
public class MyController {
	
	@Autowired
    private LaptopDAO laptopdao;
	
	@RequestMapping("/")
    public String home(ModelMap map) {
		List<LaptopDetail> threeLaptopDell = new ArrayList<>();
		threeLaptopDell.add(laptopdao.get3LaptopDetailsInHomepage("Dell").get(0));
		threeLaptopDell.add(laptopdao.get3LaptopDetailsInHomepage("Dell").get(6));
		threeLaptopDell.add(laptopdao.get3LaptopDetailsInHomepage("Dell").get(12));
		map.addAttribute("threeLaptopDell", threeLaptopDell);
		
		List<LaptopDetail> threeLaptopAcer = new ArrayList<>();
		threeLaptopAcer.add(laptopdao.get3LaptopDetailsInHomepage("Acer").get(0));
		threeLaptopAcer.add(laptopdao.get3LaptopDetailsInHomepage("Acer").get(6));
		threeLaptopAcer.add(laptopdao.get3LaptopDetailsInHomepage("Acer").get(13));
		map.addAttribute("threeLaptopAcer", threeLaptopAcer);
		
		List<LaptopDetail> threeLaptopAsus = new ArrayList<>();
		threeLaptopAsus.add(laptopdao.get3LaptopDetailsInHomepage("Asus").get(0));
		threeLaptopAsus.add(laptopdao.get3LaptopDetailsInHomepage("Asus").get(6));
		threeLaptopAsus.add(laptopdao.get3LaptopDetailsInHomepage("Asus").get(12));
		map.addAttribute("threeLaptopAsus", threeLaptopAsus);
		
    	return "index";
    }
	
    @RequestMapping("/laptop_trademark")
    public String laptopTrademark(ModelMap map, 
    		@RequestParam("trademark") String trademark,
    		@RequestParam("series") String series) {
    	
    	List<String> listSeries = new ArrayList<>();
    	List<String> listSeriesHref = new ArrayList<>();
    	String trademarkLaptopName = null;
    	
    	if(trademark.equals("Dell")) {
    		trademarkLaptopName = "Dell";
    		listSeries.add("Dell Latitude");
    		listSeries.add("Dell Inspiron");
    		listSeries.add("Dell Vostro");
    		listSeriesHref.add("laptop_trademark?trademark=Dell&series=Latitude");
    		listSeriesHref.add("laptop_trademark?trademark=Dell&series=Inspiron");
    		listSeriesHref.add("laptop_trademark?trademark=Dell&series=Vostro");
    	}
    	else if(trademark.equals("Acer")) {
    		trademarkLaptopName = "Acer";
    		listSeries.add("Acer Aspire");
    		listSeries.add("Acer Nitro");
    		listSeries.add("Acer Swift");
    		listSeriesHref.add("laptop_trademark?trademark=Acer&series=Aspire");
    		listSeriesHref.add("laptop_trademark?trademark=Acer&series=Nitro");
    		listSeriesHref.add("laptop_trademark?trademark=Acer&series=Swift");
    	}
    	else if(trademark.equals("Asus")) {
    		trademarkLaptopName = "Asus";
    		listSeries.add("Asus ROG");
    		listSeries.add("Asus VivoBook");
    		listSeries.add("Asus Zenbook");
    		listSeriesHref.add("laptop_trademark?trademark=Asus&series=ROG");
    		listSeriesHref.add("laptop_trademark?trademark=Asus&series=VivoBook");
    		listSeriesHref.add("laptop_trademark?trademark=Asus&series=Zenbook");
    	}
    	map.addAttribute("trademarkLaptopName", trademarkLaptopName);
    	map.addAttribute("listSeries", listSeries);
    	map.addAttribute("listSeriesHref", listSeriesHref);
    	
    	List<LaptopDetail> trademarkLaptop;
    	if(series.equals("noSeries")) {
    		trademarkLaptop = laptopdao.getTrademarkLaptop(trademark, " ");
    	}else {
    		trademarkLaptop = laptopdao.getTrademarkLaptop(trademark, series);
    	}
    	
    	map.addAttribute("trademarkLaptop", trademarkLaptop);

        return "trademark_laptop";
    }
    
    
    @RequestMapping("/laptop_detail")
    public String laptopDetail(ModelMap map,
    		@RequestParam("id") String laptop_id) {
    	LaptopDetail laptopDetail = laptopdao.getLaptopDetail(laptop_id);
    	map.addAttribute("laptopDetail", laptopDetail);
    	
    	String trademark_href = null;
    	if(laptopDetail.getTrademark_name().equals("Dell")) {
    		trademark_href = "laptop_trademark?trademark=Dell&series=noSeries";
    	}
    	else if(laptopDetail.getTrademark_name().equals("Acer")) {
    		trademark_href = "laptop_trademark?trademark=Acer&series=noSeries";
    	}
    	else if(laptopDetail.getTrademark_name().equals("Asus")) {
    		trademark_href = "laptop_trademark?trademark=Asus&series=noSeries";
    	}
    	
    	map.addAttribute("trademark_href", trademark_href);
    	
        return "detail_laptop";
    }

    
    @RequestMapping(name = "/all_product", method=RequestMethod.GET)
    public String allLaptop(ModelMap map) {
    	String sttm = "select lt.*, tm.trademark_name from laptop lt inner join trademark tm on tm.id = lt.trademark_id ";
        
    	List<LaptopDetail> allLaptop = laptopdao.getLaptopWithConfiguration(sttm);
    	map.addAttribute("laptopWithConfiguration", allLaptop);
    	
    	return "all_product";
    }
    

    @RequestMapping(name = "/all_product", method=RequestMethod.POST)
    public String allLaptopPost(ModelMap map,
    		@RequestParam(value = "laptop", required = false) String laptop,
    		@RequestParam(value = "screen", required = false) String screen,
    		@RequestParam(value = "cpu", required = false) String cpu,
    		@RequestParam(value = "ram", required = false) String ram,
    		@RequestParam(value = "memory", required = false) String memory,
    		@RequestParam(value = "price", required = false) String price) {
    	
    	List<String> configurationComponent = new ArrayList<>();
    	
    	String sttm = "select lt.*, tm.trademark_name from laptop lt inner join trademark tm on tm.id = lt.trademark_id where tm.trademark_name like '%%' ";
    	if(!laptop.equals("novalue")) {
    		sttm = sttm + " and tm.trademark_name = '" + laptop + "' ";
    		configurationComponent.add("Laptop : " + laptop + " ");
    	}
    	if(!screen.equals("novalue")) {
    		sttm = sttm + " and lt.screen_compact like '%" + screen + "%' ";
    		configurationComponent.add("Màn hình : " + screen + "inch ");
    	}
    	if(!cpu.equals("novalue")) {
    		sttm = sttm + " and lt.cpu_compact like '%" + cpu + "%' ";
    		configurationComponent.add("CPU : Core i" + cpu + "  ");
    	}
    	if(!ram.equals("novalue")) {
    		sttm = sttm + " and lt.ram_compact like '%" + ram + "%' ";
    		configurationComponent.add("RAM : " + ram + "GB  ");
    	}
    	if(!memory.equals("novalue")) {
    		sttm = sttm + " and lt.memory_compact like '%" + memory + "%' ";
    		configurationComponent.add("Ổ cứng : " + memory + "GB  ");
    	}
    	if(!price.equals("novalue")) {
    		sttm = sttm + " order by lt.price_real " + price + " ";
    		if(price.equals("asc")) {
    			configurationComponent.add("Giá : Tăng dần");
    		}else {
    			configurationComponent.add("Giá : Giảm dần");
    		}
    	}
    	
    	List<LaptopDetail> laptopWithConfiguration = laptopdao.getLaptopWithConfiguration(sttm);
    	map.addAttribute("laptopWithConfiguration", laptopWithConfiguration);
    	map.addAttribute("configurationComponent", configurationComponent);
    	
        return "all_product";
    }

    
    @RequestMapping("/search_laptop")
    public String searchLaptop(ModelMap map) {
        return "search_laptop";
    }
}
