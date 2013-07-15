package com.nesh.jdo;

import javax.jdo.annotations.PersistenceCapable;

import javax.jdo.annotations.PrimaryKey;

/**
 * JDO-annotated model class for storing movie properties; movie's promotional
 * ContactJDO to register the user while adding contact.
 */
@PersistenceCapable(detachable = "true")
public class ContactJDO {

    @PrimaryKey	
	private String userId = "";

    private String userFirstName;
    
    private String userLastName;
    
    private String userEmail;
    private String userPassword;
    
    
    private String UserRole;
    
    private String vendor;
    
    private String accessToken;
    
    private String tokenScrect;
    
    private String profileImageLink;
    
    
    public String getUserFirstName() {
		return userFirstName;
	}

	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}

	public String getUserLastName() {
		return userLastName;
	}

	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserRole() {
		return UserRole;
	}

	public void setUserRole(String userRole) {
		UserRole = userRole;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getVendor() {
		return vendor;
	}
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public String getTokenScrect() {
		return tokenScrect;
	}
	public void setTokenScrect(String tokenScrect) {
		this.tokenScrect = tokenScrect;
	}

	public String getProfileImageLink() {
		return profileImageLink;
	}

	public void setProfileImageLink(String profileImageLink) {
		this.profileImageLink = profileImageLink;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
    
   

	

    
}