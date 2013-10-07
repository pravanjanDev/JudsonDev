<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cliniqbase</title>
<link type="text/css"
	href=<c:url value="/resources/css/headerfooter.css" /> rel="stylesheet"
	media="all" />
</head>

<body>
	<div class="page-body-footer"></div>
	<p class="foot">
		<a id="ftrPrivacy" href="javascript:popupdialog('/views/privacy.jsp')">
			<%-- <spring:message code="label.privacyPolicy" /> --%>
		</a> <span class="sep">|</span> <a id="ftrTerms"
			href="javascript:popupdialog('/views/terms.jsp')"><%--  <spring:message
				code="label.termsOfServices" /> --%>
		</a> <span class="sep">|</span><span><%-- <spring:message
				code="label.copyRight" /> --%></span>
	</p>
	<script type="text/javascript">
		function popupdialog(url) {
			var newwindow;
			newwindow = window
					.open(
							url,
							'name',
							'height=500,width=400,left=800,top=100,resizable=yes,scrollbars=yes,toolbar=yes,status=yes');
			if (window.focus) {
				newwindow.focus();
			}
		}
	</script>
</body>

</html>