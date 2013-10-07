package com.nesh.util;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.gmr.web.multipart.GMultipartFile;
import org.springframework.web.multipart.MultipartFile;


public class CommentForm {
    public String title;
    public String imageDescription ;
    public String imageShaveValue ;
    
    @JsonIgnore 
    public MultipartFile imagefile;
    
   

    public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setImagefile(MultipartFile imagefile) {
		this.imagefile = imagefile;
	}



	public String getImageDescription() {
		return imageDescription;
	}



	public void setImageDescription(String imageDescription) {
		this.imageDescription = imageDescription;
	}



	public String getImageShaveValue() {
		return imageShaveValue;
	}



	public void setImageShaveValue(String imageShaveValue) {
		this.imageShaveValue = imageShaveValue;
	}



	public MultipartFile[] getFiles() {
            List<MultipartFile> files = new ArrayList<MultipartFile>();
            if (imagefile != null) {
                    files.add(imagefile);
            }
           
            return files.toArray(new MultipartFile[files.size()]);
    }
}