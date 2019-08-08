package org.protectedog.service.adopt.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.runner.RunWith;
import org.protectedog.common.Search;
import org.protectedog.service.adopt.AdoptService;
import org.protectedog.service.domain.Adopt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


/*
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml" ,
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class AdoptServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("adoptServiceImpl")
	private AdoptService adoptService;

	//@Test	// Ȯ��
	public void testAddAdopt() throws Exception {
		
		Adopt adopt = new Adopt();
		
		adopt.setBoardCode("MS");
		adopt.setId("user03");
		adopt.setPostTitle("�������� �׽�Ʈ ��4");
		adopt.setPostContent("�� ���� �������� �׽�Ʈ��4 ");
		adopt.setPhone("01121234567");
		adopt.setAdoptArea(null);
		adopt.setLocation("������ġ�ε� �׽�Ʈ��3");
		adopt.setDogBreed("Ǫ��");
		adopt.setDogWeight("5.1");
		adopt.setDogSize("2");
		adopt.setDogGender("1");
		adopt.setDogPay(100000);
		adopt.setDogStatus("�ǰ���");
		adopt.setDogChar("Ư¡����");
		adopt.setDogPersonality("Ȱ����");
//		adopt.setDogDate(new Date(20190701));
		adopt.setStatusCode("1");
		
		
		adoptService.addAdopt(adopt);
		
		adopt = adoptService.getAdopt(10002);

		System.out.println("\n :: console Ȯ�� :: "+adopt);
		
		Assert.assertEquals("MS", adopt.getBoardCode());
		Assert.assertEquals("user03", adopt.getId());
		Assert.assertEquals("�������� �׽�Ʈ ��3", adopt.getPostTitle());
		Assert.assertEquals("�� ���� �������� �׽�Ʈ��3 ", adopt.getPostContent());
	}
	
	
	
	//@Test	//Ȯ��
	public void testGetAdopt() throws Exception {
		
		Adopt adopt = new Adopt();
		adopt = adoptService.getAdopt(10003);

		System.out.println("\n :: console Ȯ�� :: "+adopt);

		Assert.assertEquals("MS", adopt.getBoardCode());
		Assert.assertEquals("user03", adopt.getId());
		Assert.assertEquals("�������� �׽�Ʈ ��3", adopt.getPostTitle());
		Assert.assertEquals("�� ���� �������� �׽�Ʈ��3 ", adopt.getPostContent());
	}
	
	

	
	 //@Test	//Ȯ��
	 public void testUpdateAdopt() throws Exception{
		 
		Adopt adopt = adoptService.getAdopt(10003);
		Assert.assertNotNull(adopt);
		
		Assert.assertEquals("MS", adopt.getBoardCode());
		Assert.assertEquals("user03", adopt.getId());
		Assert.assertEquals("�������� �׽�Ʈ ��3", adopt.getPostTitle());

		adopt.setPostNo(10003);
		adopt.setPostTitle("������ ������Ʈ");
		adopt.setPostContent("�۳��� ������Ʈ");
		adopt.setLocation("��ġ ����");
		adopt.setDogBreed("Ǫ�����");
		adopt.setDogWeight("9.9");
		adopt.setDogSize("3");
		adopt.setDogGender("2");
		adopt.setDogPay(9999);
		adopt.setDogStatus("���¾���");
		adopt.setDogChar("Ư¡����");
		adopt.setDogPersonality("���ݾ���");
//		adopt.setDogDate(new Date(20190707));
		adoptService.updateAdopt(adopt);
		
		adopt = adoptService.getAdopt(10003);
		Assert.assertNotNull(adopt);

		System.out.println("\n :: console Ȯ�� :: "+adopt);

		Assert.assertEquals("������ ������Ʈ", adopt.getPostTitle());
		Assert.assertEquals("�۳��� ������Ʈ", adopt.getPostContent());
		Assert.assertEquals("Ǫ�����", adopt.getDogBreed());
	 }
	 
	 
	 //@Test	//Ȯ��
	 public void testUpdateStatusCode() throws Exception{
		 
		Adopt adopt = adoptService.getAdopt(10000);
		Assert.assertNotNull(adopt);
		
		Assert.assertEquals("1", adopt.getStatusCode());
		adopt.setPostNo(10000);
		adopt.setStatusCode("2");
		adoptService.updateStatusCode(adopt);
		
		adopt = adoptService.getAdopt(10000);
		Assert.assertNotNull(adopt);

		System.out.println("\n :: console Ȯ�� :: "+adopt);

		Assert.assertEquals("2", adopt.getStatusCode());
	 }
	

	 //@Test	//Ȯ��
	 @SuppressWarnings("unchecked")
	public void testGetPurchaseListById() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(1);	 	
	 	Map<String,Object> map = adoptService.listAdopt(search, "AD");
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
	 	System.out.println("\n :: console Ȯ�� :: "+list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(2);
	 	map = adoptService.listAdopt(search, "AD");
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(2, list.size());
	 	
	 	System.out.println("\n :: console Ȯ�� :: "+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	
}