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

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.Blob;
import com.google.appengine.api.files.AppEngineFile;
import com.google.appengine.api.files.FileService;
import com.google.appengine.api.files.FileServiceFactory;
import com.google.appengine.api.files.FileWriteChannel;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.nesh.helper.ImageHelper;
import com.nesh.util.CommentForm;



@Controller
@RequestMapping("/ImageUpload")
public class ImageUploadController {
	ImageHelper imageHelper = new ImageHelper();
	private static final Logger mLogger = Logger.getLogger(ImageUploadController.class.getName());

	
	
	@RequestMapping("/uploadImage/v_0")
	public @ResponseBody String uploadImage(HttpServletRequest request ,HttpServletResponse response){
		
		String responseString = null ;
		 try{
			 responseString =  imageHelper.uploadByte(request,response);
		 } catch (Exception e) {
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		 }
		 return  responseString;
	
	}
	
	
	
	
	
	@RequestMapping("/getImageWithRelation/v_0")
	public @ResponseBody HashMap<String, String> getImageWithRelation(HttpServletRequest request ,HttpServletResponse response){
		ImageHelper imageHelper = new ImageHelper();
		HashMap<String,String> resultMap = new HashMap<String, String>();
		 try{
			 resultMap = imageHelper.getImageWtihRelation(request, response);
		 } catch (Exception e) {
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		 }
		 return  resultMap;
	
	}
	
	@RequestMapping("/getImageWithImageId/v_0")
	public @ResponseBody HashMap<String, String> getImageWithImageId(HttpServletRequest request ,HttpServletResponse response){
		ImageHelper imageHelper = new ImageHelper();
		HashMap<String,String> resultMap = new HashMap<String, String>();
		 try{
			 resultMap = imageHelper.getImageWithImageId(request, response);
		 } catch (Exception e) {
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		 }
		 return  resultMap;
	
	}
	@RequestMapping("/updateImageStatus/v_0")
	public void updateImageStatus(HttpServletRequest request ,HttpServletResponse response){
		
		 try{
			  imageHelper.updateImageStatus(request, response);
		 } catch (Exception e) {
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		 }
		 
	
	}
	
	@RequestMapping("updateStatus/v_0")
	public @ResponseBody String updateStatus(HttpServletRequest request ,HttpServletResponse response){
		String responseString = "";
		
		 try{
			 responseString = imageHelper.updateStatus(request, response);
		 } catch (Exception e) {
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		 }
		 return  responseString;
	
	}
	
	
	
	@RequestMapping("/getImageWithRequestPagination/v_0")
	public HashMap<String, Object> getImageWithRequestPagination(HttpServletRequest request ,HttpServletResponse response){
		ImageHelper imageHelper = new ImageHelper();
		HashMap<String,Object> resultMap = new HashMap<String, Object>();
		 try{
			 resultMap = imageHelper.getImageWithRequestPagination(request, response);
		 } catch (Exception e) {
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		 }
		 return  resultMap;
	
	}
	
	@RequestMapping("/getApproveImageWithRequestPagination/v_0")
	public HashMap<String, Object> getApproveImageWithRequestPagination(HttpServletRequest request ,HttpServletResponse response){
		ImageHelper imageHelper = new ImageHelper();
		HashMap<String,Object> resultMap = new HashMap<String, Object>();
		 try{
			 resultMap = imageHelper.getApproveImageWithRequestPagination(request, response);
		 } catch (Exception e) {
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		 }
		 return  resultMap;
	
	}
	
	
    @RequestMapping(value = "/uploadImage/v_1", method = RequestMethod.POST)
    public  @ResponseBody HashMap<String,Object> postUpload(CommentForm commentForm) {
    	
    	HashMap<String,Object> paramMap = new HashMap<String, Object>();
    	try{
    		paramMap = imageHelper.uploadImageByFile(commentForm);
    	}
    	catch(Exception e){
    		 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
    	}
    	
    	return paramMap;
    }



}