function Validation() {
        var title = document.forms["ImgUpload"]["ImgTitle"].value;
        var desc = document.forms["ImgUpload"]["ImgDes"].value;
        
        
        if (title == null || title == "") {
            alert("Image Title is Empty");
            document.ImgUpload.Imgtitle.focus() ;
            return false;
        }
        if (desc == null || desc == "") {
            alert("Image Description is Empty");
            document.ImgUpload.ImgDes.focus() ;
            return false;
        }
        if (document.ImgUpload.UpImage.value == "") {
    		alert("Please select a file.");
    		return false;
    	}
        
        else {
    		var ext = document.ImgUpload.UpImage.value;
    	  	ext = ext.substring(ext.length-3,ext.length);
    	  	ext = ext.toLowerCase();
    	  	if(ext == 'jpg')
    			return true; 
    		else if(ext == 'png') 
    			return true; 
    		else if(ext == 'gif') 
    			return true;
    		
    	  	else {
    	    		alert("You selected a ." + ext + " file; this is not allowed.");
    	    		return false; 
    		}
    	}
          
        return true;
}