package org.protectedog.service.file.impl;

import java.util.List;
import java.util.Map;

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
	public List<FileDog> getFile(Map<String,Object> filePost) throws Exception {
		return sqlSession.selectList("FileMapper.getFile",filePost);
	}


	@Override
	public void delFile(FileDog file) throws Exception {
		 sqlSession.selectList("FileMapper.delFile",file);
	}

	@Override
	public void delAllFile(Map<String, Object> filePost) throws Exception {
		sqlSession.delete("FileMapper.delAllFile",filePost);
		
	}



}
