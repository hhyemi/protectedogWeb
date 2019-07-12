package org.protectedog.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Product;
import org.protectedog.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

//==> 회원관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	// setter Method 구현 않음

	public ProductController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties ,
	// classpath:config/commonservice.xml 참조 할것
	// ==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;


	@RequestMapping(value="addProduct", method=RequestMethod.GET )
	public ModelAndView addProduct() throws Exception{
		System.out.println("/product/addProduct : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/product/addProductView.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addProduct", method=RequestMethod.POST)
	public String addProduct( @ModelAttribute("product") Product product, 
			HttpServletRequest request, @RequestParam("fileName") MultipartFile mfile) throws Exception{
	
		productService.addProduct(product);
		
		return "redirect:/shop/product/listProduct?menu=manage";
	}
	@RequestMapping(value ="getProduct", method=RequestMethod.GET)
	public ModelAndView getProduct(	@RequestParam("prodNo") int prodNo) throws Exception {

		System.out.println("/product/getProduct : get");
		// Business Logic
		System.out.println(prodNo);
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("forward:/shop/product/getProduct.jsp");

		modelAndView.addObject("product", product);

		return modelAndView;
	}

	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public ModelAndView updateProduct(@RequestParam("prodNo") String prodNo) throws Exception{
		System.out.println("/product/updateProduct : get");
		
		Product product = productService.getProduct(Integer.parseInt(prodNo));
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("product", product);
		
		modelAndView.setViewName("forward:/shop/product/updateProductView.jsp");
		
		return modelAndView;
	}
		
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public ModelAndView updateProduct( @ModelAttribute("product") Product product, 
			HttpServletRequest request, @RequestParam("fileName") MultipartFile mfile) throws Exception{

		System.out.println("/shop/product/updateProduct : POST");
		//Business Logic
		
		productService.updateProduct(product);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/shop/product/getProduct.jsp");
		
		return modelAndView;
	
	}

	@RequestMapping( value="listProduct")
	public ModelAndView listProduct(@ModelAttribute("search") Search search, @RequestParam("menu") String menu,
			HttpServletRequest request) throws Exception {

		System.out.println("/listProduct get");
	
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String, Object> map = productService.listProduct(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		
		modelAndView.setViewName("forward:/product/listProduct.jsp");

		return modelAndView;
	}
}
