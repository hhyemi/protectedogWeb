package org.protectedog.service.board.test;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.protectedog.common.Search;
import org.protectedog.service.adopt.AdoptService;
import org.protectedog.service.board.BoardService;
import org.protectedog.service.domain.Adopt;
import org.protectedog.service.domain.Board;
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
public class BoardServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;

	//@Test	// 확인
	public void testAddBoard() throws Exception {
		
		Board board = new Board();
		
		board.setBoardCode("AR");
		board.setId("user03");
		board.setNickName("안녕");
		board.setPostTitle("입양후기요");
		board.setPostContent("입양후기내용올려요");
		
		
		boardService.addBoard(board);
		
		board = boardService.getBoard(10041);

		System.out.println("\n :: console 확인 :: "+board);
		
		Assert.assertEquals("AR", board.getBoardCode());
		Assert.assertEquals("user03", board.getId());
		Assert.assertEquals("입양후기요", board.getPostTitle());
		Assert.assertEquals("입양후기내용올려요", board.getPostContent());
	}
	
	
	
	//@Test	//확인
	public void testGetBoard() throws Exception {
		
		Board board = new Board();
		board = boardService.getBoard(10041);

		System.out.println("\n :: console 확인 :: "+board);

		Assert.assertEquals("AR", board.getBoardCode());
		Assert.assertEquals("user03", board.getId());
		Assert.assertEquals("입양후기요", board.getPostTitle());
		Assert.assertEquals("입양후기내용올려요", board.getPostContent());
	}
	
	

	
	 //@Test	//확인
	 public void testUpdateBoard() throws Exception{
		 
		Board board = boardService.getBoard(10041);
		Assert.assertNotNull(board);
		
		Assert.assertEquals("AR", board.getBoardCode());
		Assert.assertEquals("user03", board.getId());
		Assert.assertEquals("입양후기요", board.getPostTitle());
		Assert.assertEquals("입양후기내용올려요", board.getPostContent());

		board.setPostTitle("입양후기업데이트");
		board.setPostContent("입양후기내용업데이트");
		boardService.updateBoard(board);
		
		board = boardService.getBoard(10041);
		Assert.assertNotNull(board);

		System.out.println("\n :: console 확인 :: "+board);

		Assert.assertEquals("입양후기업데이트", board.getPostTitle());
		Assert.assertEquals("입양후기내용업데이트", board.getPostContent());
	 }
	 
	 
	 //@Test	//확인
	 public void testUpdateViewCount() throws Exception{
		 
		Board board = boardService.getBoard(10041);
		Assert.assertNotNull(board);
		
		Assert.assertEquals(0, board.getViewCount());
		board.setViewCount(1);
		boardService.updateViewCount(board);
		
		board = boardService.getBoard(10041);
		Assert.assertNotNull(board);

		System.out.println("\n :: console 확인 :: "+board);

		Assert.assertEquals(1, board.getViewCount());
	 }
	 
	 
	 
	 
	 //@Test	//확인
	 public void testUpdateRecommendCount() throws Exception{
		 
		Board board = boardService.getBoard(10041);
		Assert.assertNotNull(board);
		
		Assert.assertEquals(0, board.getRecommendCount());
		board.setRecommendCount(1);
		boardService.updateRecommendCount(board);
		
		board = boardService.getBoard(10041);
		Assert.assertNotNull(board);

		System.out.println("\n :: console 확인 :: "+board);

		Assert.assertEquals(1, board.getRecommendCount());
	 }
	 
	 //@Test	//확인
	 public void testDelBoard() throws Exception{
		 
		Board board = boardService.getBoard(10041);
		Assert.assertNotNull(board);
		
//		Assert.assertEquals("", board.getStatusCode());
		board.setDelCode('0');;
		boardService.delBoard(board);
		
		board = boardService.getBoard(10041);
		Assert.assertNotNull(board);

		System.out.println("\n :: console 확인 :: "+board);

		Assert.assertEquals('0', board.getDelCode());
	 }


	 //@Test	//==>확인
	 public void testListBoard() throws Exception{
		 
//	 	Search search = new Search();
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(1);	 	
//	 	Map<String,Object> map = boardService.listBoard(search, "AR");
//	 	
//	 	List<Object> list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(0, list.size());
//	 	
//	 	System.out.println("\n :: console 확인 :: "+list);
//	 	
//	 	Integer totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(2);
//	 	map = boardService.listBoard(search, "AR");
//	 	
//	 	list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(0, list.size());
//	 	
//	 	System.out.println("\n :: console 확인 :: "+list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
	 }
	
}