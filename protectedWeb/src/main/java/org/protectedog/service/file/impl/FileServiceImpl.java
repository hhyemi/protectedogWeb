package org.protectedog.service.file.impl;

import java.util.List;

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
	public FileDog getFile(int postNo) throws Exception {
		return fileDAO.getFile(postNo);
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
