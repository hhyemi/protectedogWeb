package org.protectedog.service.breedPedia.impl;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.breedPedia.BreedPediaDAO;
import org.protectedog.service.breedPedia.BreedPediaService;
import org.protectedog.service.domain.Breed;

public class BreedPediaServiceImpl  implements BreedPediaService{
	
	private BreedPediaDAO breedPediaDAO;
	
	public void setBreedPediaDAO(BreedPediaDAO breedPediaDAO){
		this.breedPediaDAO = breedPediaDAO;
	}
	
	@Override
	public void addInfo(Breed breed) throws Exception {
		breedPediaDAO.addInfo(breed);
	}

	@Override
	public Breed getInfo(int breedNo) throws Exception {		
		return breedPediaDAO.getInfo(breedNo);
	}

	@Override
	public Map<String, Object> listInfo(Search search) throws Exception {
		
		// getTotalCount Ãß°¡
		breedPediaDAO.listInfo(search);
		
		return null;
	}

	@Override
	public void updateInfo(Breed breed) throws Exception {
		// TODO Auto-generated method stub
		breedPediaDAO.updateInfo(breed);
	}

	@Override
	public void delinfo(int postNo) throws Exception {
		breedPediaDAO.delinfo(postNo);
		
	}

}
