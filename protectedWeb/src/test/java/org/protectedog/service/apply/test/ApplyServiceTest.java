package org.protectedog.service.apply.test;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.protectedog.common.Search;
import org.protectedog.service.apply.ApplyService;
import org.protectedog.service.domain.Apply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


/*
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml" ,
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class ApplyServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("applyServiceImpl")
	private ApplyService applyService;

	//@Test	// 확인
	public void testAddApply() throws Exception {
		
		Apply apply = new Apply();
		
		apply.setAdoptNo(10001);
		apply.setId("'user03'");
		apply.setPhone("'01121234567'");
		apply.setJob(1);
		apply.setAddr(1);
		apply.setMate(1);
		apply.setMateAgree(1);
		apply.setRaise(1);
		apply.setCurrently(1);
		apply.setPlan("'어떻게 키울 계획인지'");
		apply.setPay("'돈은 어느정도 들어갈지'");
		apply.setReason("'입양을 신청한 이유'");
		apply.setSituation("'상황이 바뀐다면'");

		applyService.addApply(apply);
		
		
		apply = applyService.getApply(10000);

		System.out.println("\n :: console 확인 :: "+apply);
		
		Assert.assertEquals("어떻게 키울 계획인지", apply.getPlan());
		Assert.assertEquals("돈은 어느정도 들어갈지", apply.getPay());
		Assert.assertEquals('1', apply.getStatusCode());
	}
	
	
	
	//@Test	//확인
	public void testGetAdopt() throws Exception {
		
		Apply apply = new Apply();
		apply = applyService.getApply(10000);

		System.out.println("\n :: console 확인 :: "+apply);

		Assert.assertEquals("어떻게 키울 계획인지", apply.getPlan());
		Assert.assertEquals("돈은 어느정도 들어갈지", apply.getPay());
		Assert.assertEquals('1', apply.getStatusCode());
	}
	
	

	 
	 @Test	//확인
	 public void testDelApply() throws Exception{
		 
//		Apply apply = applyService.getApply(10000);
//		Assert.assertNotNull(apply);
//		
//		Assert.assertEquals("1", adopt.getStatusCode());
//		adopt.setPostNo(10000);
//		adopt.setStatusCode("2");
//		adoptService.updateStatusCode(adopt);
//		
//		adopt = adoptService.getAdopt(10000);
//		Assert.assertNotNull(adopt);
//
//		System.out.println("\n :: console 확인 :: "+adopt);
//
//		Assert.assertEquals("2", adopt.getStatusCode());
	 }
	

	 //@Test	//==>확인
	 public void testListApply() throws Exception{
		 
//	 	Search search = new Search();
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(1);	 	
//	 	Map<String,Object> map = adoptService.listAdopt(search, "AD");
	 	
//	 	List<Object> list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(2, list.size());
//	 	
//	 	System.out.println("\n :: console 확인 :: "+list);
//	 	
//	 	Integer totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(2);
//	 	map = adoptService.listAdopt(search, "AD");
//	 	
//	 	list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(2, list.size());
//	 	
//	 	System.out.println("\n :: console 확인 :: "+list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
	 }
	
}