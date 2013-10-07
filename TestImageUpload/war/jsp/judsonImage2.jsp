<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Clocked In</title>
		<link rel="icon" type="image/x-icon" href="/images/favicon.ico" />
		<link rel="stylesheet" type="text/css" href="/css/JudsonReset.css" />
		<link rel="stylesheet" type="text/css" href="/css/Judsonstyle.css" />
		
		<script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="/js/actions.js"></script>
		
		<!--- Clock --->
		<script type="text/javascript" src="/js/me.js"></script>
		<script type="text/javascript" src="/js/clockedInUsers.js"></script>
		<script type="text/javascript" src="/js/datepicker.js"></script>
		
		
	</head>
	<body >
		<div class="wrapper">
			<div id="login_details">
				<ul class="right_nav_holder">
					<li class="first">Help</li>
					<li id="userName">Welcome,</li>
					<li id="account_menu"><a href="#">My Account</a>
						<ul>
							<!-- <li id="my_details" onclick="openwin();"><a href="#">My Details &raquo;<span>Username/password</span></a></li> -->
							<li id="change_password"><a href="javascript:autoClockOutBeforeChangePassword();">Change Password &raquo;<span></span></a></li>
							<li id="sign_out"><a id="sid" onmouseout="fnout('sid')" onmouseover="fnover('sid')"
								onclick="autoClockOutBeforeSignOut();">Sign Out &raquo;<span>See you soon!</span></a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- login_details -->
			<div id="header">
				<div class="header_holder">
					<div id="company-logo">&nbsp;</div>
					<div id="header_nav_holder">
						<div class="tab_nav_holder">
							<ul class="nav_list">
								<li><a href="/home/adminApp.req">Admin</a></li>
								<li class="selected"><a href="javascript:void(0)">Clocked In</a></li>
								<li><a href="/home/adminMe.req">Me GoClockin</a></li>
							</ul>
							<div class="clear_all"></div>
						</div>
						<!-- tab_nav_holder -->
					</div>
					<!-- header_nav_holder -->
				</div>
				<!-- header_holder -->
			</div>
			<!-- header -->
			<div id="content_wrapper" class="clockedin_content">
				<div class="inner_content">
					<h1>Clocked In</h1>
					<div class="clockedin_table">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<th width="35%">Name</th>
								<th width="25%">Start Time</th>
								<th width="25%">Hours Worked</th>
								<th width="15%">Project</th>
								<th class="last">&nbsp;</th>
							</tr>
						</table>
						<div class="table_body">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tbody id="userClockedInDetails">
	
								</tbody>
							</table>
						</div>
						<!--- table_body --->
					</div>
					<!--- Clock Table --->
					<div class="clear_all"></div>
				</div>
				<!--inner_content -->
				<div class="clear_all"></div>
			</div>
			<!-- content_wrapper -->
		
			<!-- footer_bar_wrapper -->
		</div>
		<!-- wrapper -->
		<!-- LoopTodo Feedback Form Code -->
		
		
	</body>
</html>
