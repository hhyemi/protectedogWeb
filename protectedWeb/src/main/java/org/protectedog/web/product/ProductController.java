package org.protectedog.web.product;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.domain.FileDog;
import org.protectedog.service.domain.Product;
import org.protectedog.service.file.FileService;
import org.protectedog.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("fileServiceImpl")
	private FileService fileService;

	// setter Method 구현 않음

	// ==> classpath:config/common.properties ,
	// classpath:config/commonservice.xml 참조 할것
	// ==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@Value("#{commonProperties['product']}")
	String Shop;

	
	public ProductController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="addProduct")
	public String addProduct(HttpServletRequest request, @RequestParam("multiFile") ArrayList<String> multiFile) throws Exception{
	
		
		System.out.println("/shop/product/addProduct  : POST");

		Product product=new Product();
		String date1 = (request.getParameter("manuDate"));
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date tempDate = sdFormat.parse(date1);
		
		product.setProdName(request.getParameter("prodName"));
		product.setProdDetail(request.getParameter("prodDetail"));
		product.setCountry(request.getParameter("country"));
		product.setCompany(request.getParameter("company"));
		product.setManuDate(tempDate);
		product.setMainFile(multiFile.get(0));
		
		System.out.println("test///////////////////////////////1");
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		System.out.println("test///////////////////////////////2");
		product.setDiscountPrice(Integer.parseInt(request.getParameter("discountPrice")));
		System.out.println("test///////////////////////////////3");
		product.setProdCode(Integer.parseInt(request.getParameter("prodCode")));
		System.out.println("test///////////////////////////////4/");
		product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		
		
		System.out.println(product);
		
		
		productService.addProduct(product);
		
		System.out.println(product);
		System.out.println("////////////////////");
		
		System.out.println("Product GET : POST/");
		
		List<FileDog> listFile = new ArrayList<FileDog>();

		//다중파일 업로드
		for (String fileName : multiFile) {

			if (fileName != null && fileName.length() > 0) {

				FileDog files = new FileDog();
				files.setBoardCode(Shop);
				files.setFileName(fileName);
				files.setFileCode(0);
				files.setPostNo(product.getProdNo());
				listFile.add(files);
			}
		}
		
		fileService.addFile(listFile);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
		
		
	

		
	}
	@RequestMapping(value ="getProduct", method=RequestMethod.GET)
	public String getProduct(@RequestParam("prodNo") int prodNo, Model model) throws Exception {

		System.out.println("/product/getProduct : get");
		// Business Logic
		System.out.println(prodNo);
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
		model.addAttribute("product", product);
		
		// ���ϰ�������
		Map<String, Object> filePost = new HashMap<String, Object>();
				filePost.put("boardCode", Shop);
				filePost.put("postNo", prodNo);
				List<FileDog> file = fileService.getFile(filePost);

		model.addAttribute("file", file);
		model.addAttribute("product", product);

		return "forward:/shop/product/getProduct.jsp";
		
	}

	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct(@RequestParam("prodNo") String prodNo, Model model) throws Exception{
		System.out.println("/product/updateProduct : get");
		
		Product product = productService.getProduct(Integer.parseInt(prodNo));
		
		
		model.addAttribute("product", product);
		
		return "forward:/product/updateProduct.jsp";
	}
		
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
		public String updateProduct( @ModelAttribute("product") Product product, 
		HttpServletRequest request) throws Exception{

		System.out.println("/product/updateProduct : POST");
		//Business Logic
		
		productService.updateProduct(product);
		
		return "/shop/product/getProduct.jsp";
	
	}

	@RequestMapping( value="listProduct")
	public String listProduct(@ModelAttribute("search") Search search, HttpServletRequest request, Model model) throws Exception {

		System.out.println("/listProduct get");
	
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(20);
		
		// Business logic ����
		Map<String, Object> map = productService.listProduct(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model �� View ����
	
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/shop/product/listProduct.jsp";
	}
	
	@RequestMapping( value="listAdminProduct")
	public String listAdminProduct(@ModelAttribute("search") Search search, 
			HttpServletRequest request, Model model) throws Exception {

		System.out.println("listAdminProduct");
	
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
	
		// Business logic ����
		Map<String, Object> map = productService.listAdminProduct(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model �� View ����
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		

		return "forward:/shop/product/listAdminProduct.jsp";
	}
}
