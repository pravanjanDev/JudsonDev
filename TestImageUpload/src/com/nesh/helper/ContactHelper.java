package com.nesh.helper;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nesh.dao.ContactDAO;

public class ContactHelper {

	public HashMap<String,Object> createContactFB(HttpServletRequest request,HttpServletResponse response) {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String facebookId = request.getParameter("faceBookId");
		String profileImageLink = request.getParameter("profileImageLink");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		
		System.out.println("The result of the facebook registration "+firstName+""+lastName+" "+email+"facebook id"+request.getParameter("faceBookId"));
		
		ContactDAO contactDAO = new ContactDAO();
				
		try{
			resultMap =contactDAO.createContactFB(firstName,lastName,email,facebookId.trim(),profileImageLink);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return resultMap;
	}
	
	public HashMap<String,String> createContactWithOauth(HttpServletRequest request,HttpServletResponse response) {
		String firstName = request.getParameter("FirstName");
		String lastName = request.getParameter("LastName");
		String email = request.getParameter("email");
		String vendor = request.getParameter("vendor");
		
		
		ContactDAO contactDAO = new ContactDAO();
		HashMap<String,String > resultMap = new HashMap<String,String>();
		try{
			resultMap =contactDAO.createContactWithOauth(firstName.trim(),lastName.trim(),vendor);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return resultMap;
	}

	public HashMap<String,Object> getContact(HttpServletRequest request,HttpServletResponse response) {
		
		String email = request.getParameter("email").trim();
		
		String password = request.getParameter("password").trim();

		ContactDAO contactDAO = new ContactDAO();
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		try{
			resultMap =contactDAO.getContact(email,password);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return resultMap;
	}


	public HashMap<String, String> getContactWithContactId(HttpServletRequest request, HttpServletResponse response) {
		String contactId = request.getParameter("contactId");
		
		ContactDAO contactDAO = new ContactDAO();
		HashMap<String,String > resultMap = new HashMap<String,String>();
		try{
			resultMap =contactDAO.getContactWithContactId(contactId);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return resultMap;
	}

	public HashMap<String, String> newRegistration(HttpServletRequest request,
			HttpServletResponse response) {
		
		String email = request.getParameter("email");
		
		String password = request.getParameter("password");
		ContactDAO contactDAO = new ContactDAO();
		HashMap<String,String > resultMap = new HashMap<String,String>();
		try{
			resultMap =contactDAO.newRegistration(email,password);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return resultMap;
	}

}
