package com.nesh.dao;


import java.io.PrintWriter;
import java.io.StringWriter;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
		System.out.println("comming here ");
		
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
	

	public void rejectImageStatus(HttpServletRequest request ,HttpServletResponse response) {
		System.out.println("comming here ");
		
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
						if(imageJDO.getStatus().equalsIgnoreCase("pending")||imageJDO.getStatus().equalsIgnoreCase("approve")){
							imageJDO.setStatus("rejected");
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
	
	
	public void deleteImageStatus(HttpServletRequest request ,HttpServletResponse response) {
		
		
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
						if(imageJDO.getStatus().equalsIgnoreCase("pending")||imageJDO.getStatus().equalsIgnoreCase("approved")||imageJDO.getStatus().equalsIgnoreCase("rejected")){
							imageJDO.setStatus("deleted");
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
		try{
			imageMap  = getpendingImagewithPeginatino(request );
			
		}
		catch(Exception e){
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			mLogger.info(sw.toString());
		}
		return  imageMap ;
	
	}
	
	private HashMap<String, Object> getpendingImagewithPeginatino(HttpServletRequest request ) {
		Query query1 = null;
		Cursor cursor=null;
		
		HashMap<String ,Object > imageMap = new HashMap<String , Object>();
		ArrayList<ImageJDO> resultSongList = new ArrayList<ImageJDO>();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String status = "pending";
 
		try {
			Query queryPendingImage = pm.newQuery(ImageJDO.class," status == '" + status.trim()+ "'");
			
				
			List songList = (List<ImageJDO>) queryPendingImage.execute();
			System.out.println("Song list size is "+songList);
			ArrayList<ImageJDO> tempImageList = (ArrayList<ImageJDO>) pm.detachCopyAll(songList);
			
			if(tempImageList.size()> 0 && tempImageList!=null){
				for(int playIndex=0 ;playIndex <tempImageList.size() ;playIndex ++){
					ImageJDO imageJDO = tempImageList.get(playIndex);
					String url = fetchImageurlWithbolbKey(imageJDO.getBolbkey());
					imageJDO.setUrl(url);
					imageMap.put(imageJDO.getImageId(),imageJDO );
				}
				
				
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
			if(approvecursorStringSonglist==null ||paginationLimit.equalsIgnoreCase("0")){
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
		System.out.println("The paginationlimit ");
		try {
			Query queryPendingImage = pm.newQuery(ImageJDO.class," status == '" + status.trim()+ "'");
			queryPendingImage.setOrdering("currentDate asc");
			if(paginationLimit== "" || paginationLimit==null){
				queryPendingImage.setRange(0, Integer.parseInt("5"));
			}
			else if(paginationLimit.equalsIgnoreCase("0")){
				System.out.println("comming inside else if ");
				queryPendingImage.setRange(0, Integer.parseInt("100"));
				approvecursorStringSonglist="null";
			}
			else{
				System.out.println("comming inside else "+paginationLimit);
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
			
			System.out.println("The image list size "+imageList.size());
			ArrayList<ImageJDO> tempImageList = (ArrayList<ImageJDO>) pm.detachCopyAll(imageList);
			cursor1 = JDOCursorHelper.getCursor(imageList);
			System.out.println("The cursor value is "+cursor1);
			
			if(cursor1!=null){
				approvecursorStringSonglist = cursor1.toWebSafeString();
			}
			
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
		System.out.println(request.getParameter("imageIdhere").trim());
		String imageId =request.getParameter("imageIdhere").trim();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try{
			Query getImageJDO= pm.newQuery(ImageJDO.class, " imageId == '" +imageId+ "'");
			List<ImageJDO> listImageJDO = (List<ImageJDO>) getImageJDO .execute();
			System.out.println("The length of the list"+listImageJDO.size());
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
		finally{
			pm.close();
		}
		return responseString;
	}

	public HashMap<String, Object> getAllRejectedImage(HttpServletRequest request, HttpServletResponse response) {
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
				imageMap  = getRejectedImage(request ,approvecursorStringSonglist,paginationLimit);
			}
			else{
				imageMap  = getRejectedImage(request ,approvecursorStringSonglist,paginationLimit);
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

	private HashMap<String, Object> getRejectedImage(HttpServletRequest request, String approvecursorStringSonglist,String paginationLimit) {

		Query query1 = null;
		Cursor cursor1=null;
		
		HashMap<String ,Object > imageMap = new HashMap<String , Object>();
		ArrayList<ImageJDO> resultSongList = new ArrayList<ImageJDO>();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String status = "Rejected";
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

	public LinkedHashMap<String, Object> getApproveImageWithRequestSortingOrder(HttpServletRequest request, HttpServletResponse response) {
		LinkedHashMap<String ,Object > imageMap = new LinkedHashMap<String , Object>();
		String approvecursorStringSonglist =null;
		
		String paginationLimit = "";
		paginationLimit = request.getParameter("paginationLimit");
		approvecursorStringSonglist = (String) request.getSession().getAttribute("approvecursorStringSonglist");
		System.out.println("The CURSOR VALUE "+approvecursorStringSonglist);
		try {
			if(approvecursorStringSonglist==null ||paginationLimit.equalsIgnoreCase("0")){
				approvecursorStringSonglist="null";
				
				//cursorStringSaonglist = request.getParameter("cursorStringSonglist");
				imageMap  = (LinkedHashMap<String, Object>) getSortingApproveImageWithPagitaion(request ,approvecursorStringSonglist,paginationLimit);
				System.out.println("the map "+imageMap);
			}
			else{
				imageMap  = (LinkedHashMap<String, Object>) getSortingApproveImageWithPagitaion(request ,approvecursorStringSonglist,paginationLimit);
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

	private LinkedHashMap<String, Object> getSortingApproveImageWithPagitaion(
			HttpServletRequest request, String approvecursorStringSonglist,
			String paginationLimit) {
		Query query1 = null;
		Cursor cursor1=null;
		
		LinkedHashMap<String ,Object > imageMap = new LinkedHashMap<String , Object>();
		ArrayList<ImageJDO> resultSongList = new ArrayList<ImageJDO>();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String status = "approve";
		System.out.println("The paginationlimit ");
		try {
			Date  todayDate = new Date();
			SimpleDateFormat dateFormatter  = new SimpleDateFormat("MM/dd/yyyy:hh-mm-ss");
			String todayDateAfterFormate = dateFormatter.format(todayDate);
			
			
			Query queryPendingImage = pm.newQuery(ImageJDO.class," status == '" + status.trim()+ "'");
			
			//queryPendingImage.setOrdering("currentDate desc");
			if(paginationLimit== "" || paginationLimit==null){
				queryPendingImage.setRange(0, Integer.parseInt("5"));
			}
			else if(paginationLimit.equalsIgnoreCase("0")){
				System.out.println("comming inside else if ");
				queryPendingImage.setRange(0, Integer.parseInt("100"));
				approvecursorStringSonglist="null";
			}
			else{
				System.out.println("comming inside else "+paginationLimit);
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
			System.out.println("The image list size "+imageList.size());
			ArrayList<ImageJDO> tempImageList = (ArrayList<ImageJDO>) pm.detachCopyAll(imageList);

			cursor1 = JDOCursorHelper.getCursor(imageList);
			ArrayList<ImageJDO> sortedList = sortImageList(tempImageList);

			System.out.println("The cursor value is "+cursor1);
			
			if(cursor1!=null){
				approvecursorStringSonglist = cursor1.toWebSafeString();
			}
			
			if(sortedList.size()> 0 && sortedList!=null){
				for(int playIndex=0 ;playIndex <sortedList.size() ;playIndex ++){
					ImageJDO imageJDO = sortedList.get(playIndex);
					String url = fetchImageurlWithbolbKey(imageJDO.getBolbkey());
					imageJDO.setUrl(url);
					
					imageMap.put(imageJDO.getImageId(),imageJDO );
					System.out.println("the sorted imagemap "+imageJDO.getTitle());
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

	private ArrayList<ImageJDO> sortImageList(ArrayList<ImageJDO> tempImageList) {
		ArrayList<ImageJDO>  sortedList = new ArrayList<ImageJDO>();
		try{
			for(int index = 0; index < tempImageList.size(); index++) {
				ImageJDO transactionJDO = (ImageJDO) tempImageList.get( index );//get the particular jdo
				
				long longImageUplodDate = transactionJDO.getCurrentDate().getTime(); //get the datee in long formate we use stringToDate method to convert db string to date.
				int transactionIndex = index;
				for(int iIndex = 0; iIndex < tempImageList.size(); iIndex++) {
					ImageJDO compraingJDO = (ImageJDO) tempImageList.get( iIndex );
					if(compraingJDO.getCurrentDate().getTime() > longImageUplodDate) {
						longImageUplodDate = compraingJDO.getCurrentDate().getTime();
						transactionIndex = iIndex;
					}
				}
				sortedList.add( tempImageList.get( transactionIndex ) );//add the selected index
				tempImageList.remove( transactionIndex );//remove the same from old list 
				index--;//decrease the count
			}
			
			for(int index = 0; index < sortedList.size(); index++){
				System.out.println("The sorted list size "+sortedList.get(index).getTitle());
				
			}
			
		}
		catch(Exception e){
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			mLogger.info(sw.toString());
		}
		return sortedList;
	}
	
}
