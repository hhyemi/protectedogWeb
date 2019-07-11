package org.protectedog.service.adopt.test;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.protectedog.common.Search;
import org.protectedog.service.adopt.AdoptService;
import org.protectedog.service.domain.Adopt;
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
public class AdoptServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("adoptServiceImpl")
	private AdoptService adoptService;

	//@Test	// 확인
	public void testAddAdopt() throws Exception {
		
		Adopt adopt = new Adopt();
		
		adopt.setBoardCode("MS");
		adopt.setId("user03");
		adopt.setPostTitle("제이유닛 테스트 중4");
		adopt.setPostContent("글 내용 제이유닛 테스트중4 ");
		adopt.setPhone("01121234567");
		adopt.setAdoptArea(null);
		adopt.setLocation("실종위치인데 테스트중3");
		adopt.setDogBreed("푸들");
		adopt.setDogWeight("5.1");
		adopt.setDogSize("2");
		adopt.setDogGender("1");
		adopt.setDogPay(100000);
		adopt.setDogStatus("건강함");
		adopt.setDogChar("특징없음");
		adopt.setDogPersonality("활발함");
		adopt.setDogDate(new Date(20190701));
		adopt.setStatusCode("1");
		
		
		adoptService.addAdopt(adopt);
		
		adopt = adoptService.getAdopt(10002);

		System.out.println("\n :: console 확인 :: "+adopt);
		
		Assert.assertEquals("MS", adopt.getBoardCode());
		Assert.assertEquals("user03", adopt.getId());
		Assert.assertEquals("제이유닛 테스트 중3", adopt.getPostTitle());
		Assert.assertEquals("글 내용 제이유닛 테스트중3 ", adopt.getPostContent());
	}
	
	
	
	//@Test	//확인
	public void testGetAdopt() throws Exception {
		
		Adopt adopt = new Adopt();
		adopt = adoptService.getAdopt(10003);

		System.out.println("\n :: console 확인 :: "+adopt);

		Assert.assertEquals("MS", adopt.getBoardCode());
		Assert.assertEquals("user03", adopt.getId());
		Assert.assertEquals("제이유닛 테스트 중3", adopt.getPostTitle());
		Assert.assertEquals("글 내용 제이유닛 테스트중3 ", adopt.getPostContent());
	}
	
	

	
	 //@Test	//확인
	 public void testUpdateAdopt() throws Exception{
		 
		Adopt adopt = adoptService.getAdopt(10003);
		Assert.assertNotNull(adopt);
		
		Assert.assertEquals("MS", adopt.getBoardCode());
		Assert.assertEquals("user03", adopt.getId());
		Assert.assertEquals("제이유닛 테스트 중3", adopt.getPostTitle());

		adopt.setPostNo(10003);
		adopt.setPostTitle("글제목 업데이트");
		adopt.setPostContent("글내용 업데이트");
		adopt.setLocation("위치 업뎃");
		adopt.setDogBreed("푸들업뎃");
		adopt.setDogWeight("9.9");
		adopt.setDogSize("3");
		adopt.setDogGender("2");
		adopt.setDogPay(9999);
		adopt.setDogStatus("상태업뎃");
		adopt.setDogChar("특징업뎃");
		adopt.setDogPersonality("성격업뎃");
		adopt.setDogDate(new Date(20190707));
		adoptService.updateAdopt(adopt);
		
		adopt = adoptService.getAdopt(10003);
		Assert.assertNotNull(adopt);

		System.out.println("\n :: console 확인 :: "+adopt);

		Assert.assertEquals("글제목 업데이트", adopt.getPostTitle());
		Assert.assertEquals("글내용 업데이트", adopt.getPostContent());
		Assert.assertEquals("푸들업뎃", adopt.getDogBreed());
	 }
	 
	 
	 //@Test	//확인
	 public void testUpdateStatusCode() throws Exception{
		 
		Adopt adopt = adoptService.getAdopt(10000);
		Assert.assertNotNull(adopt);
		
		Assert.assertEquals("1", adopt.getStatusCode());
		adopt.setPostNo(10000);
		adopt.setStatusCode("2");
		adoptService.updateStatusCode(adopt);
		
		adopt = adoptService.getAdopt(10000);
		Assert.assertNotNull(adopt);

		System.out.println("\n :: console 확인 :: "+adopt);

		Assert.assertEquals("2", adopt.getStatusCode());
	 }
	

	 @Test	//==>확인
	 public void testGetPurchaseListById() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(1);	 	
	 	Map<String,Object> map = adoptService.listAdopt(search, "AD");
	 	
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