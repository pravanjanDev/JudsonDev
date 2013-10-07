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
	<link rel="stylesheet" href="/css/jquery-ui-1.10.2.custom.min.css">
	
	
	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<!-- jQuery & JS files -->
	<script type="text/javascript"src="/js/BatchImage.js"></script>
	<script type="text/javascript"src="/js/jquery-1.8.1.min.js"></script>
	
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
    
    loadAllcontact();
 
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
						<li class=""><a href="/jsp/user-page.jsp" rel="/section" title="Section" class="current" id="FEA_SECTION">Users</a></li>
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
		<div id="notification" class="event_notification_holder" style="display: none">Loading...</div>
	
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
											<td class="infotitletd"><img src="/images/users.jpg" class="boximg"></td>
												<td>
													<p class="infotitlehead">
														Users Home
													</p>
												</td>
										</tr>
											
										</tbody>
									</table>
									</div>
									
									
									</div>
									
										<!-- <div class="boxContent">Upload Image<a style="float:right; color:#42823E;font-size:14px;" class="btnNewNursingCancel" href="#">Back</a>-->
																
										<!-- Upload Start  -->
										 
								 		 
											<!-- <div style="height:36px;">
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
											</div>-->
											<div class="divTable-img">
											
											<div class="divTable">
									             <div class="headRow">
									                <div class="divCell-th">User E-Mail</div>
									                <div  class="divCell-th">First Name</div>
									                <div  class="divCell-th">Last Name</div>
									             </div>
									             <div  class="tab-scroll">
									             
									             <div class="divTable" id="userContent">
									            <!--<div class="divRow">
									                  <div class="divCell-mail">kumara.ragavendra@gmail.com</div>
									                <div class="divCell-fname">ghhghgfgfgfdgdf fgfgf gfgdf</div>
									                <div class="divCell-lname">00fgfgdfgdfgfgfdg3 gfgdfgf dfggdf</div>
									               
									            </div>
									            <div class="divRow">
									                <div class="divCell-mail">kumara.ragavendra@gmail.com</div>
									                <div class="divCell-fname">ghhghgggfggfdgdgfgdf</div>
									                <div class="divCell-lname">003fgfgfdgdfgfdfgdf</div>
									               
									           </div>
									            <div class="divRow">
									                <div class="divCell-mail">kumara.ragavendra@gmail.com</div>
									                <div class="divCell-fname">ghhghg</div>
									                <div class="divCell-lname">003</div>
									            </div>-->  
									           </div>
									            
      										</div>
      										</div>
											
										
																				 																				
										 <!-- Upload End-->
									</div>
									
									
									
				
				
					<div class="content-module-heading cf">
					
						<!-- <h3 class="fi">APPROVED IMAGES</h3>-->
						<!--<span class="fr expand-collapse-text">Click to collapse</span>
						<span class="fr expand-collapse-text initial-expand">Click to expand</span>-->
						
						<!-- <ul class="fp" id="tab-pending">
				
						
							<li><a class="active-tab dashboard-tab" href="dashboard.jsp">Reject</a></li>
							<li><a class="active-tab dashboard-tab" href="dashboard.jsp">Delete</a></li>
						
						</ul>-->
							
						
						
						  <!-- <select class="fd" id="table-select-actions">
										
										<option value="option1">Confirm</option>
										<option value="option2">Pending</option>
						</select>-->
						
						<!--  <a id="user-action-menu" class="fg-button fg-button-icon-right ui-widget ui-corner-all ui-state-loading ui-state-default" href="#user-action"><span class="ui-icon ui-icon-triangle-1-s"></span>Action</a>
						
						<div class="hidden" id="user-action"><ul><li><a href="#" id="cmdEmailSelUser"><img class="actionbutton" src="../images/email.png">&nbsp;&nbsp;&nbsp;&nbsp;Notify by Email</a></li><li><a href="#" id="cmdSmsSelUser"><img class="actionbutton" src="../images/sms.png">&nbsp;&nbsp;&nbsp;&nbsp;Notify by Sms</a></li><li><a href="#" id="cmdExportUser"><img class="actionbutton" src="../images/export_excel.gif">&nbsp;&nbsp;&nbsp;&nbsp;Export to Excel</a></li><li><a href="#" id="actOfficeBearers"><img class="actionbutton" src="../images/officebearers.png">&nbsp;&nbsp;&nbsp;&nbsp;Office Bearers</a></li></ul></div>-->
					
					</div> <!-- end content-module-heading -->
					
					
								</div>
											
											
											
											<!-- table value end -->																						
										
										
										
										
										
										<!-- dashboard End -->
										
										
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