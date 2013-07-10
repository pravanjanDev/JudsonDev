package com.nesh.helper;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.files.AppEngineFile;
import com.google.appengine.api.files.FileService;
import com.google.appengine.api.files.FileServiceFactory;
import com.google.appengine.api.files.FileWriteChannel;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.nesh.dao.ImageDAO;
import com.nesh.util.CommentForm;
import com.nesh.util.StringConversionUtil;

public class ImageHelper {
	private static final Logger mLogger = Logger.getLogger(ImageHelper.class.getName());
	ImageDAO imageDAO = new ImageDAO();


	public String uploadByte(HttpServletRequest  request , HttpServletResponse response){
		String responseString = null ;
		String imageByte = request.getParameter("byteImage");
		String imageContentType = request.getParameter("ImageContentType");
		String imageTitle = request.getParameter("ImageTitle");
		

		mLogger.info("byteImage"+imageByte+"ImageContentType"+imageContentType+"ImageTitle"+imageTitle);
		try{
			//System.out.println("The byte parameter is "+imageByte);
			if(imageByte ==null || imageByte =="" || imageByte =="null"){
				System.out.println("comming inside the if loop ");
				responseString = "byte parameter misssing ";
			}
			else{
				byte[] data =	serialize(imageByte);
				// =imageByte.getBytes();
				
				System.out.println("The image byte "+data);
				
				String mimeType = imageContentType;
				
				System.out.println("The content type is "+mimeType);
				/* save data to Google App Engine Blobstore */
				
				FileService fileService = FileServiceFactory.getFileService();
				AppEngineFile file = fileService.createNewBlobFile(mimeType); 
				FileWriteChannel writeChannel = fileService.openWriteChannel(file, true);
				writeChannel.write(java.nio.ByteBuffer.wrap(data));
				writeChannel.closeFinally();
				
				BlobKey blobKey = fileService.getBlobKey(file);
				//imageDAO.saveBolbKeyToDataStore(blobKey,imageContentType,imageTitle);
				String url =imageDAO.fetchImageurlWithbolbKey(blobKey);
				System.out.println("image url "+url);
				responseString = "sucess" ;
			}
		}
		catch(Exception e){
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		}
		return responseString;
	}
	
	public  HashMap<String, String> getImageWtihRelation(HttpServletRequest  request , HttpServletResponse response){
		String relationTypeId = request.getParameter("relationTypeId");
		ImageDAO imageDAO = new ImageDAO();
		HashMap<String,String> resultMap = new HashMap<String,String>();
		
		try{
			
			resultMap =	imageDAO.getImageWithRelation(relationTypeId);
		}
		catch(Exception e){
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		}
		return resultMap;
	}
	
	
	
	public static byte[] serialize(Object obj) throws IOException {
        ByteArrayOutputStream b = new ByteArrayOutputStream();
        ObjectOutputStream o = new ObjectOutputStream(b);
        o.writeObject(obj);
        return b.toByteArray();
    }

	public String directlyUpload(MultipartFile userImage) {
		try{
			//System.out.println("The paramName is "+request.getParameter("name"));
			 if (!userImage.isEmpty()) {
		            //final InputStream inputStream = new ByteArrayInputStream(
		                    //userImage.getBytes());
		        //    System.out.println("uploading image with stream" + inputStream);
			
		}
		}
		catch(Exception e){
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		}
		return null;
	}

	public HashMap<String,Object> uploadImageByFile(CommentForm commentForm) {
		String imageUrl = null ;
		HashMap<String,Object> paramMap = new HashMap<String, Object>();
		try{
			
			MultipartFile[] files = commentForm.getFiles();
			System.out.println("The file length which i got"+files.length);
			for (int imageIndex = 0; imageIndex < files.length; imageIndex++) {
				try{
					String mimeType = files[imageIndex].getContentType();
					System.out.println("The content type is "+mimeType);
					FileService fileService = FileServiceFactory.getFileService();
					AppEngineFile fileNew = fileService.createNewBlobFile(mimeType); 
					FileWriteChannel writeChannel = fileService.openWriteChannel(fileNew, true);
					
					writeChannel.write(java.nio.ByteBuffer.wrap(files[imageIndex].getBytes()));
					writeChannel.closeFinally();
					BlobKey blobKey = fileService.getBlobKey(fileNew);
					
					paramMap = imageDAO.saveBolbKeyToDataStore(blobKey,mimeType,commentForm.getTitle() ,commentForm.imageDescription,commentForm.imageShaveValue);
					
					imageUrl =ImagesServiceFactory.getImagesService().getServingUrl(
							ServingUrlOptions.Builder.withBlobKey(blobKey));
					System.out.println("The image url is "+imageUrl);
					paramMap.put("ImageUrl", imageUrl);
				}
				catch(Exception e){
					StringWriter sw = new StringWriter();
					 PrintWriter pw = new PrintWriter(sw);
					 e.printStackTrace(pw);
					 mLogger.info(sw.toString());
				}
			}
		}
		catch(Exception e){
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			mLogger.info(sw.toString());
		}
		return paramMap;
		
	}

	public HashMap<String, String> getImageWithImageId(HttpServletRequest request, HttpServletResponse response) {
		String imageId = request.getParameter("imageId");
		ImageDAO imageDAO = new ImageDAO();
		HashMap<String,String> resultMap = new HashMap<String,String>();
		
		try{
			
			resultMap =	imageDAO.getImageWithImageId(imageId);
		}
		catch(Exception e){
			 StringWriter sw = new StringWriter();
			 PrintWriter pw = new PrintWriter(sw);
			 e.printStackTrace(pw);
			 mLogger.info(sw.toString());
		}
		return resultMap;
	}

	public void updateImageStatus(HttpServletRequest request, HttpServletResponse response) {
		
		try{
			 imageDAO.updateImageStatus(request, response);

		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}

	public HashMap<String, Object> getImageWithRequestPagination(HttpServletRequest request, HttpServletResponse response) {
		HashMap<String,Object> imageMap = imageDAO.getAllPendingImage(request, response);
		
		return imageMap;
	}

	public HashMap<String, Object> getApproveImageWithRequestPagination(
			HttpServletRequest request, HttpServletResponse response) {
		HashMap<String,Object> imageMap = imageDAO.getAllAproveImage(request, response);
		return imageMap ;
	}

	public String updateStatus(HttpServletRequest request,
			HttpServletResponse response) {
		String responseString = null ;
		try{
			responseString = imageDAO.updateStatus(request, response);

		}
		catch(Exception e){
			e.printStackTrace();
		}
		return responseString;
		
	}

}
