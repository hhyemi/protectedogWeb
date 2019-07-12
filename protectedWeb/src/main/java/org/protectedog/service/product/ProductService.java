package org.protectedog.service.product;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Product;


public interface ProductService {
	
	//상품등록
	public void addProduct(Product product) throws Exception;
	//상품상세조회
	public Product getProduct(int prodNo) throws Exception;
	//상품리스트 조회
	public Map<String,Object> listProduct(Search search) throws Exception;
	//상품정보 업데이트
	public void updateProduct(Product product) throws Exception;
	//관리자 상품조회
	public Map<String,Object> listAdminProduct(Search search) throws Exception;
	
}