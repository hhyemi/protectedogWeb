package org.protectedog.service.file.impl;

import java.util.List;
import java.util.Map;

import org.protectedog.service.domain.FileDog;
import org.protectedog.service.file.FileDAO;
import org.protectedog.service.file.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("fileServiceImpl")
public class FileServiceImpl implements FileService{

	@Autowired
	@Qualifier("fileDAOImpl")
	private FileDAO fileDAO;
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	
	public FileServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addFile(List<FileDog> file) throws Exception {
		fileDAO.addFile(file);
		
	}

	@Override
	public List<FileDog> getFile(Map<String,Object> filePost) throws Exception {
		return fileDAO.getFile(filePost);
	}


	@Override
	public void delFile(FileDog file) throws Exception {
		fileDAO.delFile(file);
	}

	@Override
	public void delAllFile(Map<String, Object> filePost) throws Exception {
		fileDAO.delAllFile(filePost);
		
	}



}
