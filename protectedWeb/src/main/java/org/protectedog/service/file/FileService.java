package org.protectedog.service.file;

import java.util.List;
import java.util.Map;

import org.protectedog.service.domain.FileDog;

public interface FileService {

	public void addFile(List<FileDog> file) throws Exception;

	public List<FileDog> getFile(Map<String,Object> filePost) throws Exception;

	public void delFile(FileDog file) throws Exception;

	public void delAllFile(Map<String,Object> filePost) throws Exception;
}
