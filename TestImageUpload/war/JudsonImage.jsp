<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JUDSON IMAGE</title>

<link rel="stylesheet" type="text/css" href="/css/JudsonReset.css" />
<link rel="stylesheet" type="text/css" href="/css/Judsonstyle.css" />
<link rel="stylesheet" type="text/css" href="/css/Judson.css" />

<script type="text/javascript" src="/js/actions.js"></script>
<script type="text/javascript"src="/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript"src="/js/BatchImage.js"></script>

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/me.js"></script>
<script type="text/javascript" src="/js/jquery.jqtransform.js"></script>
<script type="text/javascript" src="/js/notifications.js"></script>
<link rel="stylesheet" href="/css/jqtransform.css" type="text/css"
	media="all" />
	
<script type="text/javascript" src="/js/datepicker.js"></script>
<link rel="stylesheet" media="screen" type="text/css" href="/css/mainStructure.css" />
<link rel="stylesheet" href="/css/datepicker.css" type="text/css" />

</head>


<body onload="ctreateJudsonImageTable()" >
        <div id="message" style="position: absolute; z-index: 10; text-align:center;margin-left: 550px;"><B><center>Deleted sucessfully</center></B></div>  

	<div class="wrapper">
		<div id="voice-box" style="display: none">
			<p>
				<span>Saving changes!</span>
			</p>
		</div>
		<div id="login_details">
			
		</div>
		<!-- login_details -->
		<div id="header">
			<div class="header_holder">
				<div id="company-logo">&nbsp;</div>
				<div id="header_nav_holder">
					<div class="tab_nav_holder">
						
						<div class="clear_all"></div>
					</div>
					<!-- tab_nav_holder -->
				</div>
				<!-- header_nav_holder -->
			</div>
			<!-- header_holder -->
		</div>
		<!-- header -->
		
		<div id="content_wrapper">
			<div class="inner_content admin_content bsc_rpting_cont">
				<ul class="admin_left_panel">
					<li class="selected"><a href="javascript:void(0)"> Judson pending Images</a></li>
					<li class=""><a href="jsp/JudsonUpload.jsp"> Judson Upload </a></li>
				
				</ul>
					<div id="content_wrapper1" class="clockedin_content">
						<div class="inner_content">
				<!-- <select id="sb_staff">
					 	<option selected="selected" value="">--ALL--</option>
				</select> -->
					
					  <!--   <label><b>Name <b><font color="red">*</font></b> :</b></label> 
					<input type="text" id="staffInitials"  hidden="true"/>
					-->
				<!-- 	<input type="button" value="Fetch Clockin Details" onclick="getClockedInDetailsForEmployees()"> -->
					
					<!-- <div id="exportCSV" style="display: none" align="left"></div>  -->
					<input type="button" id="exportCSV" onclick="generateClockedInReportForEmployees()" style="display: none" value="Export As CSV Report"></input>

					<img id="processingImage" src="/images/ajax-loader.gif" hidden="true"></img>
				
			
					 	
				
					
				<div class="clockedin_table">
					<table cellpadding="1" cellspacing="1" border="1" width="100%">
					<thead>
						<tr>
							<th width="25%">Image Title</th>
							<th width="25%">Image Description</th>
							<th width="25%">image type</th>
							<th width="25%">Status</th>
												
						</tr>
					</thead>
					
						<tbody class="table_body" id="judsonImageTableBody">
								
						</tbody>
						
					</table>
					<div class="table_body" id="userClockInDetails">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tbody id="userClockInDetailsForDay">

							</tbody>
						</table>
						<br />
					<div id="totalHoursWorked"></div>
					<br/>
					</div>
					  <div id="tid_paginate" class="dataTables_paginate paging_full_numbers">
							<input type="submit" id="tid_next" class="next paginate_button paginate_button" onmouseover="fnover("tid_next")" onmouseout="fnout("tid_next")" style="cursor: pointer; color: rgb(0, 0, 0);" value="Next" onclick='getNext()'/>
					</div>
				
					<!--- table_body --->
				</div>
				
					<!--- Clock Table --->
					<div class="clear_all"></div>
				</div>
				
				<!--inner_content -->
				<div class="clear_all"></div>
			</div>
			
			</div>			
			</div>
			 
			</div>
				
	<iframe src="" style="display: none" id="reportIframe"></iframe>
							
	</div>
	

</body>
</html>