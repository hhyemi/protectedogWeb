package org.protectedog.service.breedPedia;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Breed;

public interface BreedPediaDAO {
	
	public void addInfo(Breed breed) throws Exception;
	
	public Breed getInfo(int breedNo) throws Exception;
	
	public Map<String, Object> listInfo(Search search) throws Exception;
	
	public void updateInfo(Breed breed) throws Exception;
	
	public void delinfo(int postNo) throws Exception;
	
}
