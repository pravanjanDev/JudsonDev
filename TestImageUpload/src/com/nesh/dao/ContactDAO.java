package com.nesh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import com.nesh.jdo.ContactJDO;
import com.nesh.util.PMF;

public class ContactDAO {

	public HashMap<String,Object> createContactFB(String firstName, String lastName, String email,String facebookId,String profileImageLink) {
		HashMap<String ,Object> resultMap = new   HashMap<String,Object> ();
		
		
		try{
			
			if(facebookId=="" ||facebookId ==null){
	 	    	resultMap.put("Response","Facebook id is null");
			}
			
			UUID key = UUID.randomUUID();

			PersistenceManager pm = PMF.get().getPersistenceManager();

		    
	        Query getContactJDO= pm.newQuery(ContactJDO.class, " userEmail == '" +facebookId+ "'");
	 	    System.out.println("query " + getContactJDO);
	 	    List<ContactJDO> listContactJDO = (List<ContactJDO>) getContactJDO .execute();
	 	    if(listContactJDO.size() > 0){
	 	    	resultMap.put("Response"," Already exit please try with different account");
	 	    }
	 	    else{
	 	    	ContactJDO contact = new ContactJDO();
	 	    	
	 	    	contact.setUserId(key.toString());
	 	    	contact.setUserEmail(email);
	 	    	contact.setUserFirstName(firstName);
	 	    	contact.setUserLastName(lastName);
	 	    	contact.setUserLastName(facebookId);
	 	    	contact.setProfileImageLink(profileImageLink);

	 	    	pm.makePersistent(contact);
	 	    	
	 	    	resultMap.put("Response","Registration successfully");
	 	    	resultMap.put("UserDetai", contact);

	 	    }
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return resultMap;
	}
	
	public HashMap<String,Object> getContact(String email,String password) {
		HashMap<String ,Object> resultMap = new   HashMap<String,Object> ();
		try{
			
			PersistenceManager pm = PMF.get().getPersistenceManager();

		    
	        Query getContactJDO= pm.newQuery(ContactJDO.class, " userEmail == '" +email+ "' && userPassword=='"+password+"'");
	 	    System.out.println("query " + getContactJDO);
	 	    List<ContactJDO> listContactJDO = (List<ContactJDO>) getContactJDO .execute();
	 	    if(listContactJDO.size() > 0){
	 	    	resultMap.put("Email", listContactJDO.get(0).getUserEmail());
	 	    	resultMap.put("FirstName", listContactJDO.get(0).getUserFirstName());
	 	    	resultMap.put("LastName", listContactJDO.get(0).getUserLastName());
	 	    	resultMap.put("ContactId", listContactJDO.get(0).getUserId());
	 	    	resultMap.put("flag",true);
	 	    }
	 	    else{
	 	    	resultMap.put("Response","We have not found your email id");
	 	    	resultMap.put("flag",false);

	 	    }
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return resultMap;
	}
	
	public HashMap<String,String> getContactWithContactId(String contactId) {
		HashMap<String ,String> resultMap = new   HashMap<String,String> ();
		try{
			PersistenceManager pm = PMF.get().getPersistenceManager();

		    
	        Query getContactJDO= pm.newQuery(ContactJDO.class, " userEmail == '" +contactId+ "'");
	 	    System.out.println("query " + getContactJDO);
	 	    List<ContactJDO> listContactJDO = (List<ContactJDO>) getContactJDO .execute();
	 	    if(listContactJDO.size() > 0){
	 	    	resultMap.put("Email", listContactJDO.get(0).getUserEmail());
	 	    	resultMap.put("FirstName", listContactJDO.get(0).getUserFirstName());
	 	    	resultMap.put("LastName", listContactJDO.get(0).getUserLastName());
	 	    	resultMap.put("ContactId", listContactJDO.get(0).getUserId());
	 	    }
	 	    else{
	 	    	resultMap.put("Response","contact id is not exist in the contact list");

	 	    }
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return resultMap;
	}
	public HashMap<String, String> createContactWithOauth(String firstName,String lastName, String vendor) {
		// TODO Auto-generated method stub
		return null;
	}

	public HashMap<String, String> newRegistration(String email, String password) {
		HashMap<String ,String> resultMap = new   HashMap<String,String> ();
		try{
			UUID key = UUID.randomUUID();

			PersistenceManager pm = PMF.get().getPersistenceManager();

		    
	        Query getContactJDO= pm.newQuery(ContactJDO.class, " userEmail == '" +email+ "' && userPassword== '"+password+"'");
	 	    System.out.println("query " + getContactJDO);
	 	    List<ContactJDO> listContactJDO = (List<ContactJDO>) getContactJDO .execute();
	 	    if(listContactJDO.size() > 0){
	 	    	resultMap.put("Email", listContactJDO.get(0).getUserEmail());
	 	    	resultMap.put("FirstName", listContactJDO.get(0).getUserFirstName());
	 	    	resultMap.put("LastName", listContactJDO.get(0).getUserLastName());
	 	    	resultMap.put("ContactId", listContactJDO.get(0).getUserId());
	 	    }
	 	    else{
	 	    	ContactJDO contact = new ContactJDO();
	 	    	contact.setUserEmail(email);
	 	    	contact.setUserPassword(password);
	 	    	contact.setUserId(key.toString());
	 	    	pm.makePersistent(contact);
	 	    	resultMap.put("response", "contact Created succefully");
	 	    }
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return resultMap;
	}



}
