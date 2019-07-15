package org.protectedog.service.user.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.domain.User;
import org.protectedog.service.user.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("userDAOImpl")
public class UserDAOImpl implements UserDAO{

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDAOImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addUsersBase(User user) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("UsersMapper.addUsersBase", user);
	}

	@Override
	public void addUsersAdditional(User user) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("UsersMapper.addUsersAdditional", user);
	}

	@Override
	public User getUsers(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UsersMapper.getUsers", id);
	}

	@Override
	public List<User> getUsersList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("UsersMapper.getUsersList", search);
	}

	@Override
	public void updateUsers(User user) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("UsersMapper.updateUsers", user);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UsersMapper.getTotalCount", search);
	}

	@Override
	public User getSocial(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UsersMapper.getSocial", map);
	}



}
