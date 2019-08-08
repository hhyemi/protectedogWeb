package org.protectedog.web.chatting;

import javax.servlet.http.HttpSession;

import org.protectedog.service.domain.User;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mongodb.MongoClient;
import com.mongodb.WriteConcern;

@Controller
@RequestMapping("/chatting/*")
public class ChattingController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public ChattingController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "addChattingUser", method = RequestMethod.GET)
	public String addChattingUser(@RequestParam("postId") String postId,HttpSession session,Model model) throws Exception {

		System.out.println("/chatting/addChattingUser : GET");
		
		User user = (User) session.getAttribute("user");

		String userId = user.getNickname();
		String profile = user.getProfile();

		System.out.println("pro::::::::::;"+profile);
		MongoClient mongoClient = null;
		try {
			mongoClient = new MongoClient("localhost", 27017);
			System.out.println("���� ����");

			WriteConcern wc = new WriteConcern(1, 2000);

			mongoClient.setWriteConcern(wc);

			//DB db = mongoClient.getDB("chatting");

			//DBCollection col = db.getCollection("chattingRoomList");

//			// insert
//			DBObject doc = new BasicDBObject();
//			doc.put("userId", postId);
//			doc.put("chattingTitle", userId+"���� ���ǹޱ�");
//			col.insert(doc);
//			
//			DBObject doc2 = new BasicDBObject();
//			doc2.put("userId", userId);
//			doc2.put("chattingTitle", postId+"���� �����ϱ�");
//			col.insert(doc2);
//			System.out.println("���ԿϷ�");
			
			model.addAttribute("postId", postId);
			model.addAttribute("userId", userId);
			model.addAttribute("profile", profile);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "forward:/chatting/inquiryRoom.jsp";

	}
	
	
}
