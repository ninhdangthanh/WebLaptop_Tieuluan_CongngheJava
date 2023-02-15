package net.codejava.laptop;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
//	@Autowired
//    private EmployeeService employeeService;
//	
//	@RequestMapping(value = "/home")
//	public String showDashboardPage(Model theModel) {
//		theModel.addAttribute("employees", employeeService.getAllEmployees());
//		
//		System.out.println(employeeService.getAllEmployees());
//        return "dashboard";
//	}
//        
        @RequestMapping(value = "/")
	public String indexHome(Model theModel) {
        return "index";
	}
}
