package org.protectedog.service.product;

import java.util.List;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Product;

public interface ProductDAO {
	//INSERT
	public void addProduct(Product product) throws Exception;
	//SELECTONE
	public Product getProduct(int prodNo) throws Exception;
	//SELECTLIST
	public List<Product> listProduct(Search search) throws Exception;
	//UPDATE
	public void updateProduct(Product product) throws Exception;
	//TOTALCOUNT
	public int getTotalCount(Search search) throws Exception;
	//SELECTLIST
	public List<Product>listAdminProduct(Search search)throws Exception;
	

}
