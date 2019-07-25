package org.protectedog.web.chatting;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.protectedog.service.domain.User;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.WriteConcern;

@RestController
@RequestMapping("/chatting/*")
public class ChattingRestController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public ChattingRestController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "json/addChattingUser", method = RequestMethod.GET)
	public void addChattingUser(HttpSession session) throws Exception {

		System.out.println("/chatting/json/addChattingUser : GET");

		String sessionId = ((User) session.getAttribute("user")).getId();

		MongoClient mongoClient = null;
		try {
			mongoClient = new MongoClient("localhost", 27017);
			System.out.println("접속 성공");

			WriteConcern wc = new WriteConcern(1, 2000);

			mongoClient.setWriteConcern(wc);

			DB db = mongoClient.getDB("chatting");

			DBCollection col = db.getCollection("chattingRoomList");

			// insert
			DBObject doc = new BasicDBObject();
			doc.put("userId", "eunwoo");
			doc.put("chattingTitle", 24);
			col.insert(doc);
			System.out.println("삽입완료");

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

	@RequestMapping(value = "json/getChattingUser", method = RequestMethod.GET)
	public User getChattingUser(HttpSession session) throws Exception {

		System.out.println("/chatting/json/getChattingUser : GET");

		String sessionId = ((User) session.getAttribute("user")).getId();

		return userService.getUsers(sessionId);
	}

	@RequestMapping(value = "json/getChattingRoomList/", method = RequestMethod.GET)
	public List<DBObject> getChattingRoomList(HttpSession session) throws Exception {

		System.out.println("/chatting/json/getChattingRoomList : GET");

		MongoClient mongoClient = null;

		String sessionId = ((User) session.getAttribute("user")).getId();
		List<DBObject> chattingRoomList = new ArrayList<DBObject>();

		try {
			mongoClient = new MongoClient("localhost", 27017);
			System.out.println("접속 성공");

			WriteConcern wc = new WriteConcern(1, 2000);

			mongoClient.setWriteConcern(wc);

			DB db = mongoClient.getDB("chatting");

			DBCollection col = db.getCollection("chattingRoomList");
			// getList
			DBObject o = new BasicDBObject();

			System.out.println("sessionId:" + sessionId);
			o.put("userId", sessionId);

			DBCursor cursor = col.find(o);

			while (cursor.hasNext()) {
				/*
				 * if(cursor.next()==null) { break; }
				 */
				chattingRoomList.add(cursor.next());
				// System.out.println(cursor.next().get("_id")); id컬럼만 출력
				// System.out.println("cursor.next()"+cursor.next());
			}

			System.out.println("chattingRoomList" + chattingRoomList);
		} catch (Exception e) {
			System.out.println("엥" + e.getMessage());
		}

		return chattingRoomList;

	}

}
