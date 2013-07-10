package com.nesh.controller;


import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletResponse;

import com.nesh.helper.ContactHelper;
import com.nesh.util.CommentForm;



@Controller
@RequestMapping("/ContactManageController")
public class ContactManageController {
	private static final Logger mLogger = Logger.getLogger(ContactManageController.class.getName());

	ContactHelper contactHelper = new ContactHelper();
	
	@RequestMapping("/createContactFB/v_0")
	public @ResponseBody HashMap<String, Object> createContactFB(HttpServletRequest request ,HttpServletResponse response){
		
		HashMap<String,Object > resultMap = new HashMap<String,Object>();

		 try{
			 resultMap =  contactHelper.createContactFB(request,response);
		 } catch (Exception e) {
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		 }
		 return  resultMap;
	
	}
	@RequestMapping("/getContact/v_0")
	public @ResponseBody HashMap<String, String> getContact(HttpServletRequest request ,HttpServletResponse response){
		
		HashMap<String,String > resultMap = new HashMap<String,String>();

		 try{
			 resultMap =  contactHelper.getContact(request,response);
		 } catch (Exception e) {
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		 }
		 return  resultMap;
	
	}
	
	@RequestMapping("/getContactWithContactId/v_0")
	public @ResponseBody HashMap<String, String> getContactWithContactId(HttpServletRequest request ,HttpServletResponse response){
		
		HashMap<String,String > resultMap = new HashMap<String,String>();

		 try{
			 resultMap =  contactHelper.getContactWithContactId(request,response);
		 } catch (Exception e) {
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		 }
		 return  resultMap;
	
	}



}