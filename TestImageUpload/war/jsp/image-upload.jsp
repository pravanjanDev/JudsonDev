<!DOCTYPE html>

<html lang="en">
<%
  String responseMessage = "";
 if(request.getParameter("responseMessage")!=null){
	 responseMessage = request.getParameter("responseMessage");
 }
%>

<head>
	<meta charset="utf-8">
	<title>Judson - Dashboard</title>
	
	<!-- Stylesheets -->
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<!-- <link rel="stylesheet" href="/css/style-judson.css">-->
	<link rel="stylesheet" href="/css/headerfooter.css">
	<link rel="stylesheet" href="/css/landingpage.css">
	<link rel="stylesheet" href="/css/default.advanced.css">
	<!-- <link rel="stylesheet" href="/css/default.css">-->
	<link rel="stylesheet" href="/css/dropdown.css">
	<link rel="stylesheet" href="/css/jquery-ui-1.10.2.custom.min.css">
	
	
	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<!-- jQuery & JS files -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="js/script.js"></script> 
	<script>
	$(window).load(function(){
	  $('#dvLoading').fadeOut(3000);
	});
	</script> 
	
	<script type="text/javascript">
 
$(document).ready(function(){
 
        $(".slidingDiv").hide();
        $(".show_hide").show();
 
    $('.show_hide').click(function(){
    $(".slidingDiv").slideToggle();
    });
 
});

function Validation() {
    //alert("Image Title is Empty"+document.forms["ImgUpload"]["title"].value);

	
    var title = document.forms["ImgUpload"]["title"].value;
    var desc = document.forms["ImgUpload"]["imageDescription"].value;
    //alert(desc);
    
    if (title == null || title == "") {
        alert("Image Title is Empty");
        document.ImgUpload.title.focus() ;
        return false;
    }
    if (desc == null || desc == "") {
        alert("Image Description is Empty");
        document.ImgUpload.imageDescription.focus() ;
        return false;
    }
    if (document.ImgUpload.imagefile.value == "") {
		alert("Please select a file.");
		return false;
	}
    
    else {
		
    	var ext = document.ImgUpload.imagefile.value;
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
	    		document.ImgUpload.imagefile.focus();
	    		return false; 
		}
	}
      
    return true;
}


var responsemessage = "<%=responseMessage%>"; 
 
</script>

	
</head>
<body>

	<!-- TOP BAR -->
	  <div class="headerLtc">
		<div class="logoStr">
			<a href=""><span class="logoLtc"></span></a>
		</div>
		<div class="dudiv">
		
		</div>
				<div class="logOff">
					<a href=" /login.jsp">Sign out
							</a>
							<input type="hidden" value="" id="userroleid">
							<input type="hidden" value="" id="userorgid">
				</div>
				
				<div class="horizontal-centering">	
					<div id="navigation"><ul class="dropdown dropdown-horizontal" id="nav">
						<li class=""><a href="/jsp/landing-page.jsp" rel="/landingpage/adminpage" title="Home" class="" id="FEA_HOME">Home</a></li>
						<li class=""><a href="/jsp/user-page.jsp" rel="/section" title="Section" class="" id="FEA_SECTION">Users</a></li>
						<li class=""><a href="/jsp/image-page.jsp" rel="/nursingHome" title="Images" class="current" id="FEA_NURSING">Images</a></li>
						
						
						</ul>
					</div>
				</div>	
			
		</div>		
	 	
	 
	 <!-- end top-bar -->
	
	
	
	<!-- HEADER -->
	 <!-- end header -->
	
	<!-- MAIN CONTENT -->
	
	<div class="page-body-wrapper">
	
						<div class="page-body">
						
							<div class="search">
								<div id="message" style="position: absolute; z-index: 10; text-align:center;margin-left: 550px; color:blue;margin-left: 360px;"><B><center><%=responseMessage%></center></B></div>  
							
<!--  								<form method="POST" action="/api/ImageUpload/webUpload/v_1" name="search" class="contentsearch" method="POST"  enctype="multipart/form-data" id="upload-form" onsubmit="return Validation()" name="ImgUpload">
 --> 									<!-- <p class="head">Upload Image</p>-->
									<div id="main-div">
									
									<table width="850" cellspacing="0" cellpadding="10" style="clear:both;">
										<tbody>
											
										<tr>
											 <td class="infotitletd"><img src="/images/upload.jpg" class="boximg"></td>
												<td>
													<p class="infotitlehead">
														Image Upload
													</p>
												</td>
										</tr>
											
										</tbody>
									</table>
									<a style="float:left; color:#464646;font-size:14px;" class="btnNewNursingCancel" href="/jsp/image-page.jsp">Back</a>
									</div>
									
									
									</div>
									
									<div id="upload-div">
										<!-- <div class="boxContent">Upload Image<a style="float:right; color:#42823E;font-size:14px;" class="btnNewNursingCancel" href="#">Back</a>-->
																
										<!-- Upload Start  -->
									<form action="/api/ImageUpload/webUpload/v_1" method="POST"  enctype="multipart/form-data" id="upload-form" onsubmit="return Validation()" name="ImgUpload" >
									
								 		<div class="topbox">
								 		
											<div style="height:36px;">
										 		<label class="labelLeft">Image Title</label>
										 		<input type="text" name="title" id="image-title" class="country fieldselectcountry ui-autocomplete-input" id="filterCity" autocomplete="off"><span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span>
										   	</div>
											<div style="height:36px;">
										 		<label class="labelLeft"> Description</label>
										 		<input type="text" name="imageDescription" id="image-description" class="country fieldselectcountry ui-autocomplete-input" id="filterCity" autocomplete="off"><span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span>
											</div>
											<div style="height:36px;">
												<label class="labelLeft">Upload Image</label>
										 		<input type="file" name="imagefile" id="upload-image"class="round full-width-input">
												
											</div>
											<div style="height:36px;">
												<input type="reset" value="Cancel" id="cmdFilterNursing">
												<input type="submit" value="Submit" id="cmdFilterNursing">
				
												
											</div>
											
										</div>
 										</form>
 																				 																				
										 <!-- Upload End-->
									</div>
									
									
									
										</div>
									</div>
									
								<!-- </form> -->
							</div>
						</div>
					</div>
	
	
	
	<!-- MAIN CONTENT -->
	 <!-- end content -->
	
	
	
	<!-- FOOTER -->
	<p class="foot">
		
		
		</a> <span class="sep"></span><span>&copy; Copyright 2013 All Right Reserved.</span>
	</p>
	
</body>
</html>