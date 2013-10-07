<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Judson - Dashboard</title>
	
	<!-- Stylesheets -->
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link rel="stylesheet" href="/css/style-judson.css">
	<!--  <link rel="stylesheet" href="/css/headerfooter.css">
	<link rel="stylesheet" href="/css/landingpage.css">-->
	
	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<!-- jQuery & JS files -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="js/script.js"></script> 
	<script>
	$(window).load(function(){
	  $('#dvLoading').fadeOut(3000);
	});
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

					


		 </div> <!-- end full-width <!---->	
	
	 </div> 
	 
	 
	 
	 	 
	 
	 <!-- end top-bar -->
	
	
	
	<!-- HEADER -->
	<div id="header-with-tabs">
		
		<div class="page-full-width cf">
	
			<ul id="tabs" class="fl">
				
				<li><a href="upload.jsp" class="active-tab dashboard-tab">Upload</a></li>
				<li><a href="dashboard.jsp" id="back-tab" class="active-tab dashboard-tab">Pending</a></li>
				<li><a href="rejected.jsp"  class="active-tab dashboard-tab">Rejected</a></li>
				<li><a href="approved.jsp"  class="active-tab dashboard-tab">Approved</a></li>
				
				
			</ul> <!-- end tabs -->
			<input type="button" class="button" onclick="go('picture=2.htm')" value="Next"/>
			<input type="button" class="button" onclick="go('picture=2.htm')" value="Back"/>
			
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
					
						<h3 class="fi">PENDING IMAGES</h3>
						<!--<span class="fr expand-collapse-text">Click to collapse</span>
						<span class="fr expand-collapse-text initial-expand">Click to expand</span>-->
						
						<ul id="tab-pending" class="fp">
				
						
							<li><a href="dashboard.jsp" class="active-tab dashboard-tab">Approve</a></li>
							<li><a href="dashboard.jsp" class="active-tab dashboard-tab">Reject</a></li>
							<li><a href="dashboard.jsp" class="active-tab dashboard-tab">Delete</a></li>
						
						</ul>
							
						
						
						  <!-- <select class="fd" id="table-select-actions">
										
										<option value="option1">Confirm</option>
										<option value="option2">Pending</option>
						</select>-->
						
						<!--  <a id="user-action-menu" class="fg-button fg-button-icon-right ui-widget ui-corner-all ui-state-loading ui-state-default" href="#user-action"><span class="ui-icon ui-icon-triangle-1-s"></span>Action</a>
						
						<div class="hidden" id="user-action"><ul><li><a href="#" id="cmdEmailSelUser"><img class="actionbutton" src="../images/email.png">&nbsp;&nbsp;&nbsp;&nbsp;Notify by Email</a></li><li><a href="#" id="cmdSmsSelUser"><img class="actionbutton" src="../images/sms.png">&nbsp;&nbsp;&nbsp;&nbsp;Notify by Sms</a></li><li><a href="#" id="cmdExportUser"><img class="actionbutton" src="../images/export_excel.gif">&nbsp;&nbsp;&nbsp;&nbsp;Export to Excel</a></li><li><a href="#" id="actOfficeBearers"><img class="actionbutton" src="../images/officebearers.png">&nbsp;&nbsp;&nbsp;&nbsp;Office Bearers</a></li></ul></div>-->
					
					</div> <!-- end content-module-heading -->
					
					
					<div class="content-module-main">
					<!-- <input type="button" class="button" onclick="go('picture=2.htm')" value="Next"/>
					<input type="button" class="button" onclick="go('picture=2.htm')" value="Back"/>-->
						<table>
						
							<thead>
						
								<tr>
									<th><!-- <input type="checkbox" id="table-select-all">--></th>
									<th class="img-75">Images </th>
									<th>Image Description</th>
									<th>Status</th>
                                   
								</tr>
							
							</thead>
	
							
							
							<tbody>
								<div id="dvLoading"></div>
								<tr>
									<td class="chek"><input type="checkbox"></td>
									<td class="img-75"><img src="/images/judson-logo.png"></td>
									<td class="img-des">Testing for judson image</td>
									
                                    <td>Pending</td>
									
								</tr>
	
								<tr>
									<td><input type="checkbox"></td>
									<td><img src="/images/judson-logo.png"></td>
									<td>Testing for judson image</td>
									
                                    <td>Pending</td>
									
								</tr>
	
								<tr>
									<td><input type="checkbox"></td>
									<td><img src="/images/judson-logo.png"></td>
									<td>Testing for judson image</td>
									
                                    <td>Pending</td>
									
								</tr>
	
								<tr>
									<td><input type="checkbox"></td>
									<td><img src="/images/judson-logo.png"></td>
									<td>Testing for judson image</td>
									
                                    <td>Pending</td>
									
								</tr>
	
								<tr>
									<td><input type="checkbox"></td>
									<td><img src="/images/judson-logo.png"></td>
									<td>Testing for judson image</td>
									
                                    <td>Pending</td>
									
								</tr>
	
								<tr>
									<td><input type="checkbox"></td>
									<td><img src="/images/judson-logo.png"></td>
									<td>Testing for judson image</td>
									
                                    <td>Pending</td>
									
								</tr>
							
							</tbody>
							
						</table>
					
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