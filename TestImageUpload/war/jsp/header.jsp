<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Judson</title>
<link type="text/css"
	href=<c:url value="/resources/css/headerfooter.css" /> rel="stylesheet"
	media="all" />
<link type="text/css"
	href=<c:url value="/resources/css/landingpage.css" /> rel="stylesheet"
	media="all" />
<link type="text/css"
	href=<c:url value="/resources/css/jquery-ui-1.10.2.custom.min.css" />
	rel="stylesheet" />
<link type="text/css"
	href=<c:url value="/resources/css/ui.jqgrid.css" /> rel="stylesheet"
	media="all" />
	<link type="text/css"
	href=<c:url value="/resources/css/jquery.ez.menu.css" /> rel="stylesheet"
	media="all" />
<link type="text/css" href=<c:url value="/resources/css/dropdown.css"/>
	rel="stylesheet" media="all" />
<link type="text/css"
	href=<c:url value="/resources/css/default.advanced.css"/>
	rel="stylesheet" media="all" />
<link type="text/css"
	href=<c:url value="/resources/css/timePicker.css"/>
	rel="stylesheet" media="all" />	
<link rel="shortcut icon" href="resources/images/favicon.ico" />
<!--[if IE 8]>
                            <style type="text/css">                                
                                .page-body-wrapper {
                                    behavior:url(../resources/css/PIE.htc);
                                    background-color: #FFFFFF;
                                    border-color: #E5E5E5 #DBDBDB #D2D2D2;
                                    border-image: none;
                                    border-radius: 5px 5px 5px 5px;
                                    border-style: none;
                                    border-width: 1px;
                                    border-collapse: separate;
                                    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
                                    min-height: 450px;
                                    width: 1000px;
                                    padding: 15px;
                                    margin-left: auto;
                                    margin-right: auto;
                                    margin-top: 20px;
                                    text-align: center;
                                    position:relative;
                                    z-index: 0;
                                }
                            </style>
                        <![endif]-->
</head>

<body>
	<table id="header" class="logoheader">
		<tr>
			<td class="tdlogoheader"><a href=""><span class="logo"></span></a>
			</td>
			<td><header id="header-topbar-wrapper">
				<div id="header-topbar">
					<div id="header-account-controls">
<%-- 							<spring:message code="label.hello" />
 --%>							&nbsp;<span class="getEmail"><c:out value="${name}" /></span>
							<%-- <a href="<c:url value=" /j_spring_security_logout " />"><spring:message
									code="label.signOut" />
							</a> --%>
							<input type="hidden" id="userroleid" value="${roleid}"/>
							<input type="hidden" id="userorgid" value="${orgid}"/>
					</div>
				</div>
				</header></td>
		</tr>
	</table>
	<div class="horizontal-centering">	
		<div id="navigation"> </div>
	</div>	
	<script type="text/javascript"
		src=<c:url value="/resources/js/jquery-1.8.3.min.js" />></script>
	<script type="text/javascript"
		src=<c:url value="/resources/js/jquery-ui-1.10.2.custom.min.js" />></script>
	<!-- <script type="text/javascript"
		src=<c:url value="/resources/js/PIE_IE678.js" />></script> -->
	<script type="text/javascript"
		src=<c:url value="/resources/js/i18n/grid.locale-en.js" />></script>
	<script type="text/javascript"
		src=<c:url value="/resources/js/jquery.jqGrid.min.js" />></script>
	<script type="text/javascript"
		src=<c:url value="/resources/js/jquery.ez.menu.js" />></script>	
	<script type="text/javascript"
		src=<c:url value="/resources/js/jquery.timePicker.js" />></script>
	<script type="text/javascript"
		src=<c:url value="/resources/js/jquery.timePicker.min.js" />></script>		
</body>

</html>