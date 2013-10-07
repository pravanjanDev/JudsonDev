<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Judson - Dashboard</title>
	
	<!-- Stylesheets -->
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<!-- <link rel="stylesheet" href="/css/style-judson.css">-->
	<link rel="stylesheet" href="/css/headerfooter.css">
	<link rel="stylesheet" href="/css/landingpage.css">
<!-- 	<link rel="stylesheet" href="/css/style-judson.css">
 -->	
	<link rel="stylesheet" href="/css/default.advanced.css">
	<!-- <link rel="stylesheet" href="/css/default.css">-->
	<link rel="stylesheet" href="/css/dropdown.css">
	<link rel="stylesheet" href="/css/jquery-ui-1.10.2.custom.min.css">
	
	
	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<!-- jQuery & JS files -->
	
	<script type="text/javascript"src="/js/BatchImage.js"></script>
	<script type="text/javascript"src="/js/jquery-1.8.1.min.js"></script>
	
	<script src="js/script.js"></script> 
	
	<!-- fancybox start -->
	<link rel="stylesheet" href="/css/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
	<script type="text/javascript" src="/js/jquery.fancybox.pack.js?v=2.1.5"></script>
	
	<!-- <script type="text/javascript">
	$(document).ready(function() {
		$("#single_2").fancybox({
	    	openEffect	: 'elastic',
	    	closeEffect	: 'elastic',

	    	helpers : {
	    		title : {
	    			type : 'inside'
	    		}
	    	}
	    });
	});
	</script>-->
	<script type="text/javascript">
	$(document).ready(function() {
		$(".fancybox").fancybox();
	});
</script>
	
	<!-- Fancybox end -->
	<script>
	$(window).load(function(){
	  $('#dvLoading').fadeOut(3000);
	});
	</script> 
	
	<!-- load more start -->
	
	<script type="text/javascript">
        $(document).ready(function(){
            $("#loadmorebutton").click(function (){
                $('#loadmorebutton').html('<img src="loader.gif" />');
                $.ajax({
                    url: "loadmore.php?lastid=" + $(".postitem:last").attr("id"),
                    success: function(html){
                        if(html){
                            $("#postswrapper").append(html);
                            $('#loadmorebutton').html('Load More');
                        }else{
                            $('#loadmorebutton').replaceWith('<center>No more posts to show.</center>');
                        }
                    }
                });
            });
        });
    </script>	
	
	<!-- load more end -->
	
	<script type="text/javascript">
 
$(document).ready(function(){
 
        $(".slidingDiv").hide();
        $(".show_hide").show();
 
    $('.show_hide').click(function(){
    $(".slidingDiv").slideToggle();
    });
    ctreateJudsonImageTablePendingImage();
});
 
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
	<div id="message" class="event_notification_holder" style="display: none">Loading...</div>
				
			
		</div>		
	 	
	 
	 <!-- end top-bar -->
	
	
	
	<!-- HEADER -->
	 <!-- end header -->
	
	<!-- MAIN CONTENT -->
	
	<div class="page-body-wrapper">
						<div class="page-body">
							<div class="search">
							
								<form method="POST" action="" name="search" class="contentsearch">
									<!-- <p class="head">Upload Image</p>-->
									<div id="main-div">
									
									<table width="850" cellspacing="0" cellpadding="10" style="clear:both;">
										<tbody>
											<!-- <tr>
												<td>
													<p class="subtitle">Administration</p>
												</td>
											</tr> -->
											 <!-- <a style="float:right; color:#42823E;font-size:14px;" class="btnNewNursingCancel" href="#">Back</a>-->
											<!-- <tr>
												<td valign="top" class="personalizeimgbox"><img src="/images/users.jpg"></td>
												<td valign="top" class="leftimgbox persBox">
													<div class="titlehead">
														<a href="#" class="show_hide">Users</a>
													<div class="boxContent">Manage Users details.</div>
												</td>
											</tr>
											<tr>
												<td valign="top" class="personalizeimgbox"><img src="/images/images.jpg"></td>
												<td valign="top" class="leftimgbox persBox">
													<div class="titlehead">
													<a href="/jsp/dashboard.jsp">Images</a>
													</div>
													<div class="boxContent">Manage Dashboard Image Details.</div>
												</td>
											</tr>-->
										<tr>
											<td class="infotitletd"><img src="/images/images.jpg" class="boximg"></td>
												<td>
													<p class="infotitlehead">
														Image Home
													</p>
												</td>
										</tr>
											
										</tbody>
									</table>
									</div>
									
									
									</div>
									
									<div id="upload-div">
									
										<!-- <div class="boxContent">Upload Image<a style="float:right; color:#42823E;font-size:14px;" class="btnNewNursingCancel" href="#">Back</a>-->
																
										<!-- Upload Start  -->
										 
								 		<!-- <div class="topbox">
											<div style="height:36px;">
										 		<label class="labelLeft">Image Title</label>
										 		<input type="text" class="country fieldselectcountry ui-autocomplete-input" id="filterCity" autocomplete="off"><span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span>
										   	</div>
											<div style="height:36px;">
										 		<label class="labelLeft"> Description</label>
										 		<input type="text" class="country fieldselectcountry ui-autocomplete-input" id="filterCity" autocomplete="off"><span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span>
											</div>
											<div style="height:36px;">
												<label class="labelLeft">Upload Image</label>
										 		<input type="file" class="round full-width-input" id="upload-image" name="UpImage">
												
											</div>
											<div style="height:36px;">
												<input type="button" value="Submit" id="cmdFilterNursing">
											</div>
										</div>-->
																				 																				
										 <!-- Upload End-->
									</div>
									
									
									<div id="dash-div">
										<!--  <div class="boxContent">Dashboard Div <a style="float:right; color:#42823E;font-size:14px;" class="btnNewNursingCancel" href="#">Back</a>-->
										<!-- dashboard start -->
										
											<div class="topbar" id="showNursingHomeCRUDButtons">
												<input type="BUTTON" alt="upload" title="Upload" value="Upload" id="pending" class="button" onclick="window.location.href='/jsp/image-upload.jsp'">&nbsp;
												<input type="BUTTON" alt="approve" title="Approve" value="Approve" id="approved" class="button" onclick ='updateImageStatus()'>&nbsp;
												<input type="BUTTON" alt="reject" title="Reject" value="Reject" id="pending" class="button" onclick="rejectImageStatus()">&nbsp;
												
												<!--<input type="BUTTON" alt="Delete" title="Delete" value="Delete" id="btndelnursing" class="button">&nbsp;
												<input type="BUTTON" alt="Refresh" title="Refresh" value="Refresh" id="btnrefershnursing" class="button">&nbsp;-->
												<select class="fd" id="table-select-actions" onchange="getImageWithStatus()" >
													<option value="pending" >Pending</option>
          											<option value="approve" >Approved</option>

      											</select>
																					
											</div>
											
											
											<!-- table value started -->
											
											<div class="divTable-img">
									             <div class="headRow-img">
									                <div class="divCell-th-img-chk">boxs</div>
									                <div  class="divCell-th-img-img">Images</div>
									                <div  class="divCell-th-img-des">Image Description</div>
									                <div  class="divCell-th-img-sta">Status</div>
									             </div>
									             <div  class="tab-scroll">
									             <div id="dvLoading"></div>
									             
									           <!-- <div class="divRow-img">
									                  <div class="divCell-th-mail"><input type="checkbox"></div>
									                <div class="divCell-img"><a class="fancybox" href="/images/judson-logo.png" title="judson"><img src="/images/judson-logo.png" class="img-tab"></a></div>
									                <div class="divCell-img-des">Testing for judson image</div>
									                <div class="divCell-img-pend">Pending</div>
									            </div>  --> 
									            <!-- <div class="divRow-img">
									                <div class="divCell-th-mail"><input type="checkbox"></div>
									                <div class="divCell-img"><a class="fancybox" href="/images/judson-logo.png" title="judson"><img src="/images/judson-logo.png" class="img-tab"></a></div>
									                <div class="divCell-img-des">Testing for judson image</div>
									                <div class="divCell-img-pend">Pending</div>
									           </div>
									            <div class="divRow-img">
									                <div class="divCell-th-mail"><input type="checkbox"></div>
									                <div class="divCell-img"><a class="fancybox" href="/images/judson-logo.png" title="judson"><img src="/images/judson-logo.png" class="img-tab"></a></div>
									                <div class="divCell-img-des">Testing for judson image</div>
									                <div class="divCell-img-pend">Pending</div>
									           </div>
									           <div class="divRow-img">
									                <div class="divCell-th-mail"><input type="checkbox"></div>
									                <div class="divCell-img"><a class="fancybox" href="/images/judson-logo.png" title="judson"><img src="/images/judson-logo.png" class="img-tab"></a></div>
									                <div class="divCell-img-des">Testing for judson image</div>
									                <div class="divCell-img-pend">Pending</div>
									           </div>
									           <div class="divRow-img">
									                <div class="divCell-th-mail"><input type="checkbox"></div>
									                <div class="divCell-img"><a class="fancybox" href="/images/judson-logo.png" title="judson"><img src="/images/judson-logo.png" class="img-tab"></a></div>
									                <div class="divCell-img-des">Testing for judson image</div>
									                <div class="divCell-img-pend">Pending</div>
									           </div> -->
									
									      </div>						
											
											
											<!-- table value end -->																						
										
										
										
										
										
										<!-- dashboard End -->
										
										
										</div>
										</div><div id="loadmorebutton" class="divCell-th-img-load">Load More</div></div>
										</div>
										</div>
									</div>
									
								</form>
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