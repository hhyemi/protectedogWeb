package org.protectedog.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Product;
import org.protectedog.service.product.ProductDAO;
import org.protectedog.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {
		@Autowired
		@Qualifier("productDAOImpl")
	private ProductDAO productDAO;
	
	public void setProdcutDao(ProductDAO prodcutDAO) {
		this.productDAO = prodcutDAO;
	}
	
	
	public ProductServiceImpl() {
		// TODO Auto-generated constructor stub
		
		System.out.println(this.getClass());
	}

	@Override
	public void addProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		productDAO.addProduct(product);
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getProduct(prodNo);
	}

	@Override
	public Map<String, Object> listProduct(Search search) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("서치확인 "+ search);
		List<Product> list = productDAO.listProduct(search);
		int totalCount = productDAO.getTotalCount(search);
		System.out.println("리스트 확인");
		System.out.println(totalCount);
		System.out.println(list.toString());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		

		return map;
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		productDAO.updateProduct(product);
	}
	

	@Override
	public Map<String, Object> listAdminProduct(Search search) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("서치확인 "+ search);
		List<Product> list = productDAO.listAdminProduct(search);
		int totalCount = productDAO.getTotalCount(search);
		System.out.println("리스트 확인");
		System.out.println(totalCount);
		System.out.println(list.toString());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		

		return map;
	}


	@Override
	public void updateQuantity(Product product) throws Exception {
		// TODO Auto-generated method stub
		productDAO.updateQuantity(product);
	}

}
