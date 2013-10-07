<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
   String url =request.getParameter("Imageurl");
    String title =request.getParameter("imageTitle");
    String description =request.getParameter("imageDescription");
    String imageId =request.getParameter("batchImageid");
    %>
       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Image Description</title>
		<link rel="stylesheet" type="text/css" href="/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="/css/style.css" />
		<link rel="stylesheet" type="text/css" href="/css/Judson.css" />
		<script type="text/javascript"src="/js/BatchImage.js"></script>
		 
	<script type="text/javascript"src="/js/jquery-1.8.1.min.js"></script>
		
		<link rel="stylesheet" href="/css/jqtransform.css" type="text/css" media="all" />

		<!--- Date Picker --->
		<script type="text/javascript" src="/js/datepicker.js"></script>
		<link rel="stylesheet" media="screen" type="text/css" href="/css/layout.css" />
		<link rel="stylesheet" href="/css/datepicker.css" type="text/css" />
		
		<script type="text/javascript">
			 var Imageurl = "<%=url%>"; 
			
			var title = "<%=title%>" ;
			
			var descriptionImage = "<%=description%>";
			var imageIdhere ="<%=imageId%>";
			
			function setDefaultVal(){
				console.log(title);
				$('#title').html(title);
				$('#Description').html(descriptionImage);
	}
			
			function Imageonclick(){
				console.log(Imageurl)
				$('#message').show();
				$('#message').html("<B>Please wait while we process your request....</B>");
				
				$('#message').fadeOut(5000);
				
				
				
				myWindow=window.open(Imageurl,'','width=600,height=400');
				
				
				

			}
			
			
			function updateImageStatus(){
				$('#message').show();
				$('#message').html("<B>Please wait while we process your request....</B>");
				$('#message').fadeOut(5000);
				
				if(imageIdhere==""){
					$('#message').show();
					$('#message').html("<B>you have not seleted any image here....</B>");
					$('#message').fadeOut(5000);
					return;
					
				}
					$.ajax({type: 'POST', url: '/api/ImageUpload/updateStatus/v_0'  ,data:"imageIdhere="+imageIdhere, success: function(data){
						$('#message').show();
						$('#message').html("<B>Updated Successfully</B>");
						
						$('#message').fadeOut(2000);
						
				   			
					}
					});
				}
				
			
				
			</script>
	</head>
	<body onload="setDefaultVal();">
 	
		<div class="wrapper">
       <div id="message" style="position: absolute; z-index: 10; text-align:center;margin-left: 550px; color:white;display:none"><B><center>asdsadasda sucessfully</center></B></div>  
			<div id="login_details">
				<ul class="right_nav_holder">
	            	<!-- <li class="first">Help</li> 
					<li id="userName">Welcome, </li> 
					<li id="account_menu"><a href="#">My Account</a>
						<ul>
							<li id="my_details" onclick="openwin();"><a href="#">My Details &raquo;<span>Username/password</span></a></li>
						<li id="change_password"><a href="/home/changePassword.req">Change Password &raquo;<span></span></a></li> onclick="resetPassword()"
							<li id="sign_out"><a id="sid" onmouseout="fnout('sid')" onmouseover="fnover('sid')" onclick="autoClockOutBeforeSignOut();">Sign Out &raquo;<span>See you soon!</span></a></li>
						</ul>
					</li> -->
				</ul>
			</div> <!-- login_details -->
			<div id="header">
				<div class="header_holder">
					<div id="company-logo">&nbsp;</div>
					<div id="header_nav_holder">
						<div class="tab_nav_holder">
							<ul class="nav_list">
								<li class="selected"><a href="">Judson Upload</a></li>
							<!-- <li><a href="/JudsonUpload.jsp">Judson Upload</a></li> -->
							</ul>
                                 <div class="clear_all"></div>
                                </div> <!-- tab_nav_holder -->  
                   </div>  <!-- header_nav_holder -->    
                </div>  <!-- header_holder -->
        </div> <!-- header -->

			<div id="content_wrapper">
				<div class="inner_content admin_content">
					<ul class="admin_left_panel">
					
                    <li class=""><a href="/jsp/JudsonImage.jsp">Judson pending Images</a></li>
                    <li class="selected"><a href="">JudsonUpload </a></li>  
                  
                    
                </ul>
					<div class="admin_right_panel">
						<div class="admin_staff">
							<div class="admin_staff_col1">
								<h2>show image</h2>
								<span class="grn_btn addto_list_act1" onclick="Imageonclick()"><b> show Image</b></span>
								<div class="clear_all"></div><br/>
								<ul class="scroll" id="adminList">
									<!--  
									<li><span>Michael Bluth</span></li>
				                    <li class="active"><span class="active">Tobias Funke</span></li>
				                    <li><span>Lucile Bluth</span></li>
				                    <li><span>George Michael</span></li>
				                    <li><span>Job Bluth</span></li> 
				                    -->
								</ul>
								
								<div class="clear_all"></div>
							</div>
							<!--settings_col_staff-->
							<div class="admin_staff_col2">
								<div id="edit_staff_details">	
									<span class="delete" onclick="confirmDeleteStaff();"><label id="deletStaffLabel"></label> </span>
									<div class="delete_popup slg1">
										You want Delete Topias?
										<div class="clear_all"></div>
										<div class="global_btn1_lt">
											<div class="global_btn1_rt">Delete</div>
										</div>
										<div class="cancel">Cancel</div>
										<div class="right_arrow">&nbsp;</div>
									</div>
									<!--delete_popup-->
									<div class="settings_added_holder bordernone">
										<ul class="tab">
											<li class="d_details"><a href="#" class="active"><span>Details</span></a></li>
											<!--  <li class="d_projects"><a href="javascript:void(0);"><span>Projects</span></a></li>	-->										  
			                       			<!--
				                       			<li class="d_workng_hrs" ><a href="#"><span onclick="javascript: getWorkHoursByPeopleId();">Working Hours</span></a></li>
					                       		<li class="d_l_hours"><a href="#"><span>Lunches/Breaks</span></a></li>
					                       		<li class="d_projects"><a href="javascript:void(0);"><span>Projects</span></a></li>
					                        	<li class="d_workng_hrs"><a href="#"><span>Working Hours</span></a></li>
					                        	<li class="d_l_hours"><a href="#"><span>Lunches/Breaks</span></a></li>
					                        	<li class="d_time_off"><a href="#"><span>Time off</span></a></li> 
			                        		-->
			                        	</ul>
										<!-- tab -->
										<div class="staffmember_content">
											<div id="staffmember_details">
												<ul>
												
													<!--first-->
													
													<li><label>Title<b>*</b> </label> <span id ="title"></span>
													<input type="text" id="enterTitle" value="Title" onblur="changeStaffName(this)" style=display:none />
													
													<div class="clear_all"></div>
													</li>
										
													<li><label>Description<b>*</b> </label> <span id ="Description"></span>
													<input type="text" id="enterDescription" value="ImageDescription" onblur="changeStaffName(this)" style=display:none />
													
													<div class="clear_all"></div>
													
													<li style=display:none;><label>Upload<b>*</b> </label> <input
													type="file" class="txth"  id="adminLogin"
													 disabled ="disabled" />
													<div class="clear_all"></div>
												</li>
													<li><label>status</label>
													<div id="active_staus">
													<a class="active_btn" id="make_staff" onclick="updateImageStatus()">UpdateStatus</a>
													</div>
														<div class="clear_all"></div>
													</li>													
													<!--last-->
												</ul>
												<div class="clear_all"></div>
											</div>
										
										
								
							</div>
							
							<!--admin_staff_col2-->
						</div>
						<!--admin_staff-->
					</div>
					<!--admin_right_panel -->
				        <div class="clear_all"></div> 
				        <div id="showimage">
							
							</div>   
				    </div> <!--inner_content -->
				 <div class="clear_all"></div>    
				</div><!-- content_wrapper -->
	      

	        </div><!-- footer_bar_wrapper -->
		</div><!-- wrapper -->
	</body>
</html>
