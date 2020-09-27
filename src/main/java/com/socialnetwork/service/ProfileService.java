package com.socialnetwork.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.socialnetwork.model.entity.Profile;
import com.socialnetwork.model.entity.SiteUser;
import com.socialnetwork.model.repository.ProfileDao;

@Service
public class ProfileService {

	@Autowired
	private ProfileDao profileDao;

	@PreAuthorize("isAuthenticated()")
	public void save(Profile profile){
		profileDao.save(profile);
	}
	
	//@PreAuthorize("isAuthenticated()")
	public Profile getUserProfile(SiteUser user){
		return profileDao.findByUser(user);
	}

	public Profile get(Long profileId) {
		return profileDao.findOne(profileId);
	}

	public List<Profile> getAllProfile() {
		// TODO Auto-generated method stub
		return (List<Profile>) profileDao.findAll();
	}

	
	
}


