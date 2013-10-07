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
	<link rel="stylesheet" href="/css/default.advanced.css">
	<!-- <link rel="stylesheet" href="/css/default.css">-->
	<link rel="stylesheet" href="/css/dropdown.css">
	
	
	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<!-- jQuery & JS files -->
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
	<script type="text/javascript"src="/js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript"src="/js/BatchImage.js"></script>
	
	
<!-- 	<script src="js/script.js"></script> 
 -->	
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
						<li class=""><a href="/jsp/landing-page.jsp" rel="/landingpage/adminpage" title="Home" class="current" id="FEA_HOME">Home</a></li>
						<li class=""><a href="/jsp/user-page.jsp" rel="/section" title="Section" class="" id="FEA_SECTION">Users</a></li>
						<li class=""><a href="/jsp/image-page.jsp" rel="/nursingHome" title="Images" class="" id="FEA_NURSING">Images</a></li>
						
						
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
								<form method="POST" action="" name="search" class="contentsearch">
									<p class="head">Getting Started with Judson-Images</p>
									<div id="main-div">
									
									<table width="850" cellspacing="0" cellpadding="10" style="clear:both;">
										<tbody>
											<!-- <tr>
												<td>
													<p class="subtitle">Administration</p>
												</td>
											</tr> -->
											 <!-- <a style="float:right; color:#42823E;font-size:14px;" class="btnNewNursingCancel" href="#">Back</a>-->
											<tr>
												<td valign="top" class="personalizeimgbox"><img src="/images/users.jpg"></td>
												<td valign="top" class="leftimgbox persBox">
													<div class="titlehead">
														<a href="/jsp/user-page.jsp" class="show_hide">Users</a>
													<div class="boxContent">Manage Users details.</div>
												</td>
											</tr>
											<tr>
												<td valign="top" class="personalizeimgbox"><img src="/images/images.jpg"></td>
												<td valign="top" class="leftimgbox persBox">
													<div class="titlehead">
													<a href="/jsp/image-page.jsp">Images</a>
													</div>
													<div class="boxContent" onclick="ctreateJudsonImageTable()">Manage Image Details.</div>
												</td>
											</tr>
																									
											
										</tbody>
									</table>
									</div>
									<div id="dash-div">
										<!--  <div class="boxContent">Dashboard Div <a style="float:right; color:#42823E;font-size:14px;" class="btnNewNursingCancel" href="#">Back</a>-->
										<!-- dashboard start -->
										
										
										
										
										<!-- dashboard End -->
										
										
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
										
										<input type="button" value="Submit" id="cmdFilterNursing">
									</div>
								</div>-->
										 
										 																				
										 <!-- Upload End-->
										
										
															
						
					
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
	<!-- <div id="footer">

		<p>&copy; Copyright 2013 <a href="http://judson-server.appspot.com/">Judson</a>. All rights reserved.</p>
			
	</div>--> <!-- end footer -->

</body>
</html>