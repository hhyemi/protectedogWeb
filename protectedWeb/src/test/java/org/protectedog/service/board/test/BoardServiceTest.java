package org.protectedog.service.board.test;

import org.junit.Assert;
import org.junit.runner.RunWith;
import org.protectedog.service.board.BoardService;
import org.protectedog.service.domain.Board;
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
public class BoardServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;

	//@Test	// Ȯ��
	public void testAddBoard() throws Exception {
		
		Board board = new Board();
		
		board.setBoardCode("AR");
		board.setId("user03");
		board.setNickName("�ȳ�");
		board.setPostTitle("�Ծ��ı��");
		board.setPostContent("�Ծ��ı⳻��÷���");
		
		
		boardService.addBoard(board);
		
		board = boardService.getBoard(10041);

		System.out.println("\n :: console Ȯ�� :: "+board);
		
		Assert.assertEquals("AR", board.getBoardCode());
		Assert.assertEquals("user03", board.getId());
		Assert.assertEquals("�Ծ��ı��", board.getPostTitle());
		Assert.assertEquals("�Ծ��ı⳻��÷���", board.getPostContent());
	}
	
	
	
	//@Test	//Ȯ��
	public void testGetBoard() throws Exception {
		
		Board board = new Board();
		board = boardService.getBoard(10041);

		System.out.println("\n :: console Ȯ�� :: "+board);

		Assert.assertEquals("AR", board.getBoardCode());
		Assert.assertEquals("user03", board.getId());
		Assert.assertEquals("�Ծ��ı��", board.getPostTitle());
		Assert.assertEquals("�Ծ��ı⳻��÷���", board.getPostContent());
	}
	
	

	
	 //@Test	//Ȯ��
	 public void testUpdateBoard() throws Exception{
		 
		Board board = boardService.getBoard(10041);
		Assert.assertNotNull(board);
		
		Assert.assertEquals("AR", board.getBoardCode());
		Assert.assertEquals("user03", board.getId());
		Assert.assertEquals("�Ծ��ı��", board.getPostTitle());
		Assert.assertEquals("�Ծ��ı⳻��÷���", board.getPostContent());

		board.setPostTitle("�Ծ��ı������Ʈ");
		board.setPostContent("�Ծ��ı⳻�������Ʈ");
		boardService.updateBoard(board);
		
		board = boardService.getBoard(10041);
		Assert.assertNotNull(board);

		System.out.println("\n :: console Ȯ�� :: "+board);

		Assert.assertEquals("�Ծ��ı������Ʈ", board.getPostTitle());
		Assert.assertEquals("�Ծ��ı⳻�������Ʈ", board.getPostContent());
	 }
	 
	 
	 //@Test	//Ȯ��
	 public void testUpdateViewCount() throws Exception{
		 
		Board board = boardService.getBoard(10041);
		Assert.assertNotNull(board);
		
		Assert.assertEquals(0, board.getViewCount());
		board.setViewCount(1);
		boardService.updateViewCount(board);
		
		board = boardService.getBoard(10041);
		Assert.assertNotNull(board);

		System.out.println("\n :: console Ȯ�� :: "+board);

		Assert.assertEquals(1, board.getViewCount());
	 }
	 
	 
	 
	 
	 //@Test	//Ȯ��
	 public void testUpdateRecommendCount() throws Exception{
		 
		Board board = boardService.getBoard(10041);
		Assert.assertNotNull(board);
		
		Assert.assertEquals(0, board.getRecommendCount());
		board.setRecommendCount(1);
		boardService.updateRecommendCount(board);
		
		board = boardService.getBoard(10041);
		Assert.assertNotNull(board);

		System.out.println("\n :: console Ȯ�� :: "+board);

		Assert.assertEquals(1, board.getRecommendCount());
	 }
	 
	 //@Test	//Ȯ��
	 public void testDelBoard() throws Exception{
		 
		Board board = boardService.getBoard(10041);
		Assert.assertNotNull(board);
		
//		Assert.assertEquals("", board.getStatusCode());
		board.setDelCode('0');;
		boardService.delBoard(board);
		
		board = boardService.getBoard(10041);
		Assert.assertNotNull(board);

		System.out.println("\n :: console Ȯ�� :: "+board);

		Assert.assertEquals('0', board.getDelCode());
	 }


	 //@Test	//==>Ȯ��
	 public void testListBoard() throws Exception{
		 
//	 	Search search = new Search();
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(1);	 	
//	 	Map<String,Object> map = boardService.listBoard(search, "AR");
//	 	
//	 	List<Object> list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(0, list.size());
//	 	
//	 	System.out.println("\n :: console Ȯ�� :: "+list);
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
//	 	System.out.println("\n :: console Ȯ�� :: "+list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
	 }
	
}