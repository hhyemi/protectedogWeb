package org.protectedog.service.recomment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.service.domain.ReComment;
import org.protectedog.service.recomment.ReCommentDAO;
import org.protectedog.service.recomment.ReCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("reCommentServiceImpl")
public class ReCommentServiceImpl implements ReCommentService{

	@Autowired
	@Qualifier("reCommentDAOImpl")
	private ReCommentDAO reCommentDAO;
	public void setReCommentDAO(ReCommentDAO reCommentDAO) {
		this.reCommentDAO = reCommentDAO;
	}
	
	@Override
	public void addReComment(ReComment reComment) throws Exception {
		reCommentDAO.addReComment(reComment);
	}

	@Override
	public ReComment getReComment(int reCommentNo) throws Exception {
		return reCommentDAO.getReComment(reCommentNo);
	}

	@Override
	public void updateReComment(ReComment reComment) throws Exception {
		reCommentDAO.updateReComment(reComment);
	}

	@Override
	public Map<String, Object> listReComment(Map<String, Object> map) throws Exception {
		
		List<ReComment> list = reCommentDAO.listReComment(map);
		//int totalCount = reCommentDAO.getTotalCount(postNo);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		//map.put("totalCount", totalCount);
		
		return resultMap;
	}

	@Override
	public void delReComment(int reCommentNo) throws Exception {
		// TODO Auto-generated method stub
		
	}


}
