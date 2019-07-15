package org.protectedog.service.file.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.service.domain.FileDog;
import org.protectedog.service.file.FileDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("fileDAOImpl")
public class FileDAOImpl implements FileDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public FileDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addFile(List<FileDog> file) throws Exception {
		sqlSession.insert("FileMapper.addFile",file);

	}

	@Override
	public List<FileDog> getFile(int postNo) throws Exception {
		return sqlSession.selectList("FileMapper.getFile",postNo);
	}

	@Override
	public void updateFile(FileDog file) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delFunding(int fileNo) throws Exception {
		// TODO Auto-generated method stub

	}



}
