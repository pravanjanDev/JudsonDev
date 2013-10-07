package com.nesh.dao;


import java.io.PrintWriter;
import java.io.StringWriter;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.datanucleus.store.appengine.query.JDOCursorHelper;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.Cursor;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;


import com.nesh.jdo.ImageJDO;
import com.nesh.util.ImageUtil;
import com.nesh.util.PMF;

public class ImageDAO {
	
	private static final Logger mLogger = Logger.getLogger(ImageDAO.class.getName());

	
	
	
	public HashMap<String, String> getImageWithRelation(String relationTypeId){
		HashMap<String,String> resultMap = new HashMap<String,String>();
	
		 ImageJDO imageJDO = null;
	    try{
			PersistenceManager pm = PMF.get().getPersistenceManager();

	    
	        Query getImageJDO= pm.newQuery(ImageJDO.class, " relationTypeId == '" +relationTypeId+ "'");
	 	    System.out.println("query " + getImageJDO);
	 	    List<ImageJDO> listImageJDO = (List<ImageJDO>) getImageJDO .execute();
	 	    if(listImageJDO.size() > 0){
	 	    	for(int imageIndex = 0 ; imageIndex < listImageJDO.size() ; imageIndex ++){
	 	    		ImageJDO image = listImageJDO.get(imageIndex);
	 	    		String url = fetchImageurlWithbolbKey(image.getBolbkey());
	 	    		resultMap.put("imageId",image.getImageId());
	 	    		resultMap.put("url",url);

	 	    	}
	 	    	
	 	    }
	 	   
	    }
	    catch(Exception e){
	    	 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
	     }
		return resultMap;
	    
	}

	public HashMap<String, String> getImageWithImageId (String imageId){
		HashMap<String,String> resultMap = new HashMap<String,String>();
	
		 ImageJDO imageJDO = null;
	    try{
			PersistenceManager pm = PMF.get().getPersistenceManager();

	    
	        Query getImageJDO= pm.newQuery(ImageJDO.class, " imageId == '" +imageId+ "'");
	 	    System.out.println("query " + getImageJDO);
	 	    List<ImageJDO> listImageJDO = (List<ImageJDO>) getImageJDO .execute();
	 	    if(listImageJDO.size() > 0){
	 	    	for(int imageIndex = 0 ; imageIndex < listImageJDO.size() ; imageIndex ++){
	 	    		ImageJDO image = listImageJDO.get(imageIndex);
	 	    		String url = fetchImageurlWithbolbKey(image.getBolbkey());
	 	    		resultMap.put("ImageId",image.getImageId());
	 	    		resultMap.put("url",url);

	 	    	}
	 	    	
	 	    }
	 	   
	    }
	    catch(Exception e){
	    	 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
	     }
		return resultMap;
	    
	}

	public String  fetchImageurlWithbolbKey(BlobKey blobkey) {
		String imageUrl = null ;
		try{
			 imageUrl =ImagesServiceFactory.getImagesService().getServingUrl(
					ServingUrlOptions.Builder.withBlobKey(blobkey));
			System.out.println("The image url is "+imageUrl);
		}
		catch(Exception e){
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		}
		return imageUrl ;
		
	}


	public HashMap<String,Object> saveBolbKeyToDataStore(BlobKey blobKey,String imageType,String imageTitle ,String imageDescription ,String imageShapeValue) {
		UUID key = UUID.randomUUID();
		HashMap<String,Object> paramMap = new HashMap<String ,Object>();
		PersistenceManager pm = PMF.get().getPersistenceManager();

		try{
			Date currentDate = new Date();
			String relationTypeId = ImageUtil.getTestRelationTypeId();
			
			ImageJDO imageJDO = new ImageJDO();
			imageJDO.setBolbkey(blobKey);
			imageJDO.setImageType(imageType);
			imageJDO.setRelationTypeId(relationTypeId);
			imageJDO.setTitle(imageTitle);
			imageJDO.setImageId(key.toString());
			imageJDO.setStatus("pending");
			imageJDO.setImageDescription(imageDescription);
			imageJDO.setShapeValue(imageShapeValue);
			imageJDO.setCurrentDate(currentDate);
			
			pm.makePersistent(imageJDO);
			paramMap.put("imageId", key.toString());
			paramMap.put("imageStatus", imageJDO.getStatus());
			paramMap.put("imageDescription", imageJDO.getImageDescription());
			paramMap.put("imageTitle", imageJDO.getTitle());
			paramMap.put("dateAdded", imageJDO.getCurrentDate());
		}
		catch(Exception e){
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			mLogger.info(sw.toString());
		}
		finally{
			pm.close();
		}
		return paramMap;
	}
	
	public void updateImageStatus(HttpServletRequest request ,HttpServletResponse response) {
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		String deletedList=request.getParameter("deletedBatchRecurrenceIds");

		String[] resultedlist=deletedList.split(",");
		try{
			for(int i=0;i<resultedlist.length;i++){
				Query getImageJDO= pm.newQuery(ImageJDO.class, " imageId == '" +resultedlist[i]+ "'");
				List<ImageJDO> listImageJDO = (List<ImageJDO>) getImageJDO .execute();
				if(listImageJDO.size() > 0){
					for(int imageIndex = 0 ; imageIndex < listImageJDO.size() ; imageIndex ++){
						ImageJDO imageJDO = listImageJDO.get(imageIndex);
						if(imageJDO.getStatus().equalsIgnoreCase("pending")){
							imageJDO.setStatus("approve");
						}
						else{
							imageJDO.setStatus("pending");
						}
						
						pm.makePersistent(imageJDO);

					}
				}
			
			}
		}
		catch(Exception e){
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			mLogger.info(sw.toString());
		}
		finally{
			pm.close();
		}
		
	}
	
	public HashMap<String, Object> getAllPendingImage(HttpServletRequest  request , HttpServletResponse response ){
		
		HashMap<String ,Object > imageMap = new HashMap<String , Object>();
		String cursorStringSonglist =null;
		String paginationLimit = "";
		paginationLimit = request.getParameter("paginationLimit");
		cursorStringSonglist = (String) request.getSession().getAttribute("cursorStringSonglist");
		System.out.println("The CURSOR VALUE "+cursorStringSonglist);
		try {
			if(cursorStringSonglist==null){
				cursorStringSonglist="null";
				//cursorStringSonglist = request.getParameter("cursorStringSonglist");
				imageMap  = getpendingImagewithPeginatino(request ,cursorStringSonglist,paginationLimit);
			}
			else{
				imageMap  = getpendingImagewithPeginatino(request ,cursorStringSonglist,paginationLimit);
			}
		}
		catch(Exception e){
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			mLogger.info(sw.toString());
		}
		return  imageMap ;
	
	}
	
	private HashMap<String, Object> getpendingImagewithPeginatino(HttpServletRequest request ,String cursorStringSonglist,String paginationLimit) {
		Query query1 = null;
		Cursor cursor=null;
		
		HashMap<String ,Object > imageMap = new HashMap<String , Object>();
		ArrayList<ImageJDO> resultSongList = new ArrayList<ImageJDO>();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String status = "pending";
 
		try {
			Query queryPendingImage = pm.newQuery(ImageJDO.class," status == '" + status.trim()+ "'");
			if(paginationLimit =="" || paginationLimit == null){
				System.out.println("coming inside if ");
				queryPendingImage.setRange(0, Integer.parseInt("20"));
			}
			else{
				queryPendingImage.setRange(0, Integer.parseInt(paginationLimit));
			}
			
			if(!cursorStringSonglist.equalsIgnoreCase("null")){
				System.out.println("inside if cursor having value having query value is::::");
				cursor = Cursor.fromWebSafeString(cursorStringSonglist);
				Map<String, Object> extensionMap = new HashMap<String, Object>();
				extensionMap.put(JDOCursorHelper.CURSOR_EXTENSION, cursor);
				queryPendingImage.setExtensions(extensionMap);
			}
			List songList = (List<ImageJDO>) queryPendingImage.execute();
			System.out.println("Song list size is "+songList);
			ArrayList<ImageJDO> tempImageList = (ArrayList<ImageJDO>) pm.detachCopyAll(songList);
			cursor = JDOCursorHelper.getCursor(songList);
			System.out.println("The cursor value is "+cursor);
			cursorStringSonglist = cursor.toWebSafeString();
			if(tempImageList.size()> 0 && tempImageList!=null){
				for(int playIndex=0 ;playIndex <tempImageList.size() ;playIndex ++){
					ImageJDO imageJDO = tempImageList.get(playIndex);
					String url = fetchImageurlWithbolbKey(imageJDO.getBolbkey());
					imageJDO.setUrl(url);
					imageMap.put(imageJDO.getImageId(),imageJDO );
				}
				System.out.println("The CURSOR VALUE "+cursorStringSonglist);
				request.getSession().setAttribute("cursorStringSonglist", cursorStringSonglist);
				System.out.println((String) request.getSession().getAttribute("cursorStringSonglist"));
			}
			if(imageMap.size() <= 0){
				System.out.println("Comming inside pending");
				cursorStringSonglist="null";
				request.getSession().setAttribute("cursorStringSonglist", cursorStringSonglist);
				imageMap.put("success", false);
				
			}
		}
		catch(Exception e){
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			mLogger.info(sw.toString());
		}
		
		return imageMap;
	}

	public HashMap<String, Object> getAllAproveImage(HttpServletRequest request, HttpServletResponse response) {

		HashMap<String ,Object > imageMap = new HashMap<String , Object>();
		String approvecursorStringSonglist =null;
		
		String paginationLimit = "";
		paginationLimit = request.getParameter("paginationLimit");
		approvecursorStringSonglist = (String) request.getSession().getAttribute("approvecursorStringSonglist");
		System.out.println("The CURSOR VALUE "+approvecursorStringSonglist);
		try {
			if(approvecursorStringSonglist==null){
				approvecursorStringSonglist="null";
				//cursorStringSaonglist = request.getParameter("cursorStringSonglist");
				imageMap  = getApproveImagewithPeginatino(request ,approvecursorStringSonglist,paginationLimit);
			}
			else{
				imageMap  = getApproveImagewithPeginatino(request ,approvecursorStringSonglist,paginationLimit);
			}
		}
		catch(Exception e){
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			mLogger.info(sw.toString());
		}
		return imageMap;
		
		
	}
	
	private HashMap<String, Object> getApproveImagewithPeginatino(HttpServletRequest request ,String approvecursorStringSonglist,String paginationLimit) {
		Query query1 = null;
		Cursor cursor1=null;
		
		HashMap<String ,Object > imageMap = new HashMap<String , Object>();
		ArrayList<ImageJDO> resultSongList = new ArrayList<ImageJDO>();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String status = "approve";
		try {
			Query queryPendingImage = pm.newQuery(ImageJDO.class," status == '" + status.trim()+ "'");
			if(paginationLimit== "" || paginationLimit==null){
				queryPendingImage.setRange(0, Integer.parseInt("5"));
			}
			else{
				queryPendingImage.setRange(0, Integer.parseInt(paginationLimit));
			}
			
			if(!approvecursorStringSonglist.equalsIgnoreCase("null")){
				System.out.println("inside if cursor having value having query value is::::");
				cursor1 = Cursor.fromWebSafeString(approvecursorStringSonglist);
				Map<String, Object> extensionMap = new HashMap<String, Object>();
				extensionMap.put(JDOCursorHelper.CURSOR_EXTENSION, cursor1);
				queryPendingImage.setExtensions(extensionMap);
			}
			List imageList = (List<ImageJDO>) queryPendingImage.execute();
			
			ArrayList<ImageJDO> tempImageList = (ArrayList<ImageJDO>) pm.detachCopyAll(imageList);
			cursor1 = JDOCursorHelper.getCursor(imageList);
			System.out.println("The cursor value is "+cursor1);
			approvecursorStringSonglist = cursor1.toWebSafeString();
			if(tempImageList.size()> 0 && tempImageList!=null){
				for(int playIndex=0 ;playIndex <tempImageList.size() ;playIndex ++){
					ImageJDO imageJDO = tempImageList.get(playIndex);
					String url = fetchImageurlWithbolbKey(imageJDO.getBolbkey());
					imageJDO.setUrl(url);
					imageMap.put(imageJDO.getImageId(),imageJDO );
				}
				System.out.println("The CURSOR VALUE "+approvecursorStringSonglist);
				request.getSession().setAttribute("approvecursorStringSonglist", approvecursorStringSonglist);
				System.out.println((String) request.getSession().getAttribute("approvecursorStringSonglist"));
			}
			if(imageMap.size() <= 0){
				System.out.println("Comming inside pending");
				approvecursorStringSonglist="null";
				request.getSession().setAttribute("approvecursorStringSonglist", approvecursorStringSonglist);
				imageMap.put("success", false);
				
			}
		}
		catch(Exception e){
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			mLogger.info(sw.toString());
		}
		return imageMap;
	}

	public String  updateStatus(HttpServletRequest request,
			HttpServletResponse response) {
		String responseString = null;
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try{
			Query getImageJDO= pm.newQuery(ImageJDO.class, " imageId == '" +request.getParameter("imageIdhere").trim()+ "'");
			List<ImageJDO> listImageJDO = (List<ImageJDO>) getImageJDO .execute();
			if(listImageJDO.size() > 0){
				ImageJDO imageJDO = listImageJDO.get(0);
				if(imageJDO.getStatus().equalsIgnoreCase("pending")){
					imageJDO.setStatus("approve");
					responseString="success";
				}
				else{
					imageJDO.setStatus("pending");
					responseString ="failer";
				}
				System.out.println("updated successfully");
				pm.makePersistent(imageJDO);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return responseString;
	}
}
