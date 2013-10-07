<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Judson - Upload</title>
	
	<!-- Stylesheets -->
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link rel="stylesheet" href="/css/style-judson.css">
	
	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<!-- jQuery & JS files -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="js/script.js"></script>
	
	<script>
	function Validation() {
        var title = document.ImgUpload.ImgTitle.value;
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
    	    		document.ImgUpload.UpImage.focus();
    	    		return false; 
    		}
    	}
          
        return true;
}
	</script>  
</head>
<body>

	<!-- TOP BAR -->
	<div id="top-bar">
		
		<div class="page-full-width cf">
		<a class="fr" id="company-branding-small" href="dashboard.jsp"><img alt="Judson" src="/images/judson-logo-new.png"></a>

			<ul id="nav" class="ft">
	
				
				
				<li><a href="/login.jsp" class="round button dark menu-logoff image-left">Log out</a></li>
				
			</ul> <!-- end nav -->

					


		</div> <!-- end full-width -->	
	
	</div> <!-- end top-bar -->
	
	
	
	<!-- HEADER -->
	<div id="header-with-tabs">
		
		<div class="page-full-width cf">
	
			<ul id="tabs" class="fl">
				
				<li><a href="upload.jsp" class="active-tab dashboard-tab">Upload</a></li>
				<li><a href="dashboard.jsp" class="active-tab dashboard-tab">Accept</a></li>
				
				
			</ul> <!-- end tabs -->
			
			<!-- Change this image to your own company's logo -->
			<!-- The logo will automatically be resized to 30px height. -->
			<!--<a href="#" id="company-branding-small" class="fr"><img src="images/judson-logo-new.png" alt="Blue Hosting" /></a> -->
			
		</div> <!-- end full-width -->	

	</div> <!-- end header -->
	
	
	
	<!-- MAIN CONTENT -->
	<div id="content">
		
		<div class="page-full-width cf">

				
			<div class="side-content fr">
			
				<div class="content-module">
				
					<div class="content-module-heading cf">
					
						<h3 class="fi">Upload Image</h3>
						<!--<span class="fr expand-collapse-text">Click to collapse</span>
						<span class="fr expand-collapse-text initial-expand">Click to expand</span>-->
					
					</div> <!-- end content-module-heading -->
					
					
					 <div class="upload-module-main">
					<!-- MAIN CONTENT -->
	<div id="upload-content">
	
		<form action="upload.jsp" method="POST" id="upload-form" onsubmit="return Validation()" name="ImgUpload">
			
			<fieldset>

				<p>
					<label for="image-title">Image title</label>
					<input type="text" name="ImgTitle" id="image-title" class="round full-width-input" autofocus />
				</p>

				<p>
					<label for="image-description">Image Description</label>
					<input type="text" name="ImgDes" id="image-description" class="round full-width-input" />
				</p>
				<p>
					<label for="upload-image">Upload Image</label>
					<input type="file" name="UpImage" id="upload-image" class="round full-width-input" />
				</p>
				
				
				<button type="submit" class="button round blue image-right ic-right-arrow">CONFIRM</button>
				<button type="reset" class="button round blue image-right ic-right-arrow">RESET</button>
				<!-- <a href="dashboard.html" class="button round blue image-right ic-right-arrow">CONFIRM</a>
				<a href="dashboard.html" class="button round blue image-right ic-right-arrow">RESET</a>-->

			</fieldset>

			<br/>

		</form>
		
	</div> <!-- end content -->
					
						
					
					</div> <!-- end content-module-main -->
				
				</div> <!-- end content-module -->
				
				

			</div>
		
			</div> <!-- end side-content -->
		
		</div> <!-- end full-width -->
			
	</div> <!-- end content -->
	
	
	
	<!-- FOOTER -->
	<div id="footer">

		<p>&copy; Copyright 2013 <a href="http://judson-server.appspot.com/">Judson</a>. All rights reserved.</p>
			
	</div> <!-- end footer -->

</body>
</html>