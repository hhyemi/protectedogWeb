package org.protectedog.service.interest.test;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Interest;
import org.protectedog.service.domain.User;
import org.protectedog.service.interest.InterestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)


@ContextConfiguration(locations = { "classpath:config/context-*.xml" })

public class InterestTest {


	@Autowired
	@Qualifier("interestServiceImpl")
	private InterestService interestService;

	@SuppressWarnings("deprecation")
	@Test
	public void testAddInterest() throws Exception {
		
		Interest interest=new Interest();
		interest.setInterestNo(10000);
		interest.setBoardCode("IS");
		
		interest.setInterestComment(null);
		
		interest.setInterestPost(null);
		
		User interestId=new User();
		interestId.setId("user01");
		interest.setInterestId(interestId);
		
		Date regDate=new Date();
		regDate.setYear(2019);
		regDate.setMonth(06);
		regDate.setDate(12);
		interest.setRegDate(regDate);
		
		interestService.addInterest(interest);
		

	}

	 //@Test
	 @SuppressWarnings("unchecked")
	public void testGetInterestListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = interestService.getInterestList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	

	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = interestService.getInterestList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	

	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }

}