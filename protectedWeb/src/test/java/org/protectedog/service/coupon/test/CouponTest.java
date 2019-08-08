package org.protectedog.service.coupon.test;

import org.junit.runner.RunWith;
import org.protectedog.service.coupon.CouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



@RunWith(SpringJUnit4ClassRunner.class)


@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class CouponTest {


	@Autowired
	@Qualifier("couponServiceImpl")
	private CouponService couponService;

//	//@Test
//	public void testAddCoupon() throws Exception {
//
//		Coupon coupon=new Coupon();
//		coupon.setCouponNo(10000);
//		coupon.setCouponCode("NX2LAS43S");
//		
//		User receiverUser=new User();
//		receiverUser.setId("user01");
//		coupon.setReceiveUser(receiverUser);
//		
//		coupon.setCouponName("�Ѱ赹��1�������α�");
//		coupon.setDiscount(10000);
//		coupon.setCouponStatus('0');
//		
//		Date makeDate=new Date();
//		makeDate.setYear(2019);
//		makeDate.setMonth(07);
//		makeDate.setDate(11);
//		coupon.setMakeDate(makeDate);
//		
//		Date limitDate=new Date();
//		makeDate.setYear(2019);
//		makeDate.setMonth(12);
//		makeDate.setDate(11);
//		coupon.setLimitDate(limitDate);
//		
//		coupon.setUseDate(null);
//		
//		couponService.addCoupon(coupon);
//		
//		coupon=couponService.getCoupon(10003);
//		
//		System.out.println(coupon);
//	}
//	
//	//@Test
//	public void testGetCoupon() throws Exception {
//
//			Coupon coupon=new Coupon();
//			coupon.setCouponCode("NX2LAS43S");
//			
//			User receiverUser=new User();
//			receiverUser.setId("user02");
//			coupon.setReceiveUser(receiverUser);
//			
//			coupon.setCouponName("�Ѱ赹��1�������α�");
//			coupon.setDiscount(10000);
//			coupon.setCouponStatus('0');
//			
//			Date makeDate=new Date();
//			makeDate.setYear(2019);
//			makeDate.setMonth(07);
//			makeDate.setDate(11);
//			coupon.setMakeDate(makeDate);
//			
//			Date limitDate=new Date();
//			makeDate.setYear(2019);
//			makeDate.setMonth(12);
//			makeDate.setDate(11);
//			coupon.setLimitDate(limitDate);
//			
//			coupon.setUseDate(null);
//			
//			couponService.addCoupon(coupon);
//			
//			coupon=couponService.getCoupon(10005);
//			
//			System.out.println(coupon);
//
//	}
//	
//	//@Test
//	 public void testUpdateReport() throws Exception{
//		 
//		Coupon coupon=couponService.getCoupon(10003);
//		
//		coupon.setCouponStatus('1');
//		
//		Date useDate=new Date();
//		useDate.setYear(2019);
//		useDate.setMonth(07);
//		useDate.setDate(11);
//		coupon.setUseDate(useDate);
//		
//		couponService.updateCouponStatus(coupon);
//		
//		coupon=couponService.getCoupon(10003);
//		
//		System.out.println(coupon);
//		
//	}
//
//	
//
//	 @Test
//	 public void testGetReportListAll() throws Exception{
//		 
//	 	Search search = new Search();
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	Map<String,Object> map = couponService.getCouponList(search);
//	 	
//	 	List<Object> list = (List<Object>)map.get("list");
//	 	
//	 	System.out.println(list);
//	 	
//	 	Integer totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	
//	 	System.out.println("=======================================");
//	 	
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	search.setSearchCondition("0");
//	 	search.setSearchKeyword("");
//	 	map = couponService.getCouponList(search);
//	 	
//	 	list = (List<Object>)map.get("list");
//	
//	 	
//	 	System.out.println(list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 }
 
}