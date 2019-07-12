package org.protectedog.service.file;

import java.util.List;

import org.protectedog.service.domain.FileDog;


public interface FileDAO {
	
	public void addFile(List<FileDog> file) throws Exception;

	public FileDog getFile(int fileNo) throws Exception; 
	
	public void updateFile(FileDog file) throws Exception;
	
	public void delFunding(int fileNo) throws Exception;
	

}
