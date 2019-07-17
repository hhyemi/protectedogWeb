package org.protectedog.service.file;

import java.util.List;

import org.protectedog.service.domain.FileDog;

public interface FileService {

	public void addFile(List<FileDog> file) throws Exception;

	public List<FileDog> getFile(int postNo) throws Exception;

	public void delFile(FileDog file) throws Exception;

}
