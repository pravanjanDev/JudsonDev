 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page contentType="text/html;charset=UTF-8"%>
<%
  String responseMessage = "";
 if(request.getParameter("responseMessage")!=null){
	 responseMessage = request.getParameter("responseMessage");
 }
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Judson Admin - Login</title>
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
<script>

var responsemessage = "<%=responseMessage%>"; 

$(".dropdown img.flag").addClass("flagvisibility");

$(".dropdown dt a").click(function() {
    
    // old
    //$(".dropdown dd ul").toggle();
    
    // new
    $(this).parents(".dropdown").find("dd ul").toggle();
    
});
            
$(".dropdown dd ul li a").click(function() {
    var text = $(this).html();
    
    // old
    //$(".dropdown dt a span").html(text);
    //$(".dropdown dd ul").hide();
    
    // NEW
    var dd = $(this).parents(".dropdown");
    dd.find("dt a span").html(text);
    dd.find("dd ul").hide();
    
    $("#result").html("Selected value is: " + getSelectedValue("sample"));
});
            
function getSelectedValue(id) {
    return $("#" + id).find("dt a span.value").html();
}

$(document).bind('click', function(e) {
    var $clicked = $(e.target);
    if (! $clicked.parents().hasClass("dropdown"))
        $(".dropdown dd ul").hide();
});


$("#flagSwitcher").click(function() {
    $(".dropdown img.flag").toggleClass("flagvisibility");
});

</script>
<link type="text/css" href=<c:url value="/css/ltcLogin.css" /> rel="stylesheet" media="all" />
<!--[if IE 8]>
                            <style type="text/css">
                                #login {
                                    behavior:url(../resources/css/PIE.htc);
                                    margin:5em auto;
                                    background:#fff;
                                    border:8px solid #eee;
                                    width:500px;
                                    border-radius:5px;
                                    box-shadow:0 0 10px #4e707c;
                                    text-align:left;
                                    position:relative;
                                }
                                #login.button {
                                    behavior:url(../resources/css/PIE.htc);
                                    border:0;
                                    padding:0 30px;
                                    height:30px;
                                    line-height:30px;
                                    text-align:center;
                                    font-size:12px;
                                    color:#fff;
                                    text-shadow:#007dab 0 1px 0;
                                    background:#0cbaff;
                                    border-radius:50px;
                                    cursor:pointer;
                                    position:relative;
                                    z-index: 0;
                                }
                                #login.button:hover {
                                    behavior:url(../resources/css/PIE.htc);
                                    opacity:0.8;
                                }
                            </style>
                        <![endif]-->
<link rel="shortcut icon" type="images/x-icon"
	href="/images/favicon.ico" />
</head>

<body>
	<!-- <div class="headerltc" >
	
	</div> -->
	
	<div class="mainContent">
				<div id="message" style="position: absolute; z-index: 10; text-align:center;margin-left: 550px; color:white;"><B><center><%=responseMessage%></center></B></div>  
	
			<div class="leftCont"></div>
			<div class="glowBg">
			
				<div >
				
					<form id="" style="width:100%;" name='f'
						action="api/ContactManageController/getContact/v_0" method='POST'>
						
						
						
						<div class="userInfo">
							<label for="login_username"> 
							</label> <input type="text"
								onblur="javascript: if(this.value==''){this.value='someone@example.com';}"
								onfocus="javascript: if(this.value == 'someone@example.com'){ this.value = ''; }"
								value="someone@example.com" class="field" id="login_username"
								name="email">
						</div>
						<div class="passInfo">
							<label for="login_password"> 
							</label> <input id="login_password" class="field" type="password"
								onblur="javascript: if(this.value==''){this.value='password';}"
								onfocus="javascript: if(this.value == 'password'){ this.value = ''; }"
								value="password" name="password">

						</div>
						
						<div class="submitlog">
							<input type="submit" name="submit" id="submit"
								value='submit' class="loginBtn" />
							<label for="_spring_security_remember_me" class="checkboxLabel"
								style="display: none;"> <input type="checkbox"
								name="_spring_security_remember_me"
								id="_spring_security_remember_me" value="true" />
							</label>
						</div>
						<%-- <c:if test="${not empty error}">
							<p class="errorblock">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
						</c:if> --%>
						<p class="forgotPass">
							<a href="forgotpwd">
							</a>
						</p>
						<p class="back">
							
						</p>
					</form>
				
				</div>
			</div>
 			<%-- <%@ include file="footer.jsp"%> --%>
 	</div>

	<%-- <table width="100%" border="0">
		<tr>
			<td><a href="/"> <span class="logo"></span>
			</a>
				<div id="titleheadbg">
					<p id="titlehead">
						<spring:message code="label.title" />
					</p>
				</div>
				<div class="container">
					<form id="login" name='f'
						action="<c:url value='j_spring_security_check' />" method='POST'>
						<h1>
							<strong><spring:message code="label.heading" /></strong> <img
								src="../resources/images/login.png" class="imglogin" />
						</h1>
						<p class="language">
							<a href="?lang=en">English</a>|<a href="?lang=fr">French</a>
						</p>
						<p class="register">
							<spring:message code="label.notMember" />
							<a href="registration/registration"> <spring:message
									code="label.register" />
							</a>
						</p>
						<c:if test="${not empty error}">
							<p class="errorblock">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
						</c:if>
						<div>
							<label for="login_username"> <spring:message
									code="label.userName" />
							</label> <input type="text"
								onblur="javascript: if(this.value==''){this.value='someone@example.com';}"
								onfocus="javascript: if(this.value == 'someone@example.com'){ this.value = ''; }"
								value="someone@example.com" class="field" id="login_username"
								name="j_username">
						</div>
						<div>
							<label for="login_password"> <spring:message
									code="label.password" />
							</label> <input id="login_password" class="field" type="password"
								onblur="javascript: if(this.value==''){this.value='password';}"
								onfocus="javascript: if(this.value == 'password'){ this.value = ''; }"
								value="password" name="j_password">

						</div>
						<p class="forgot">
							<a href="forgotpwd"> <spring:message
									code="label.forgotPassword" />
							</a>
						</p>
						<div class="submit">
							<input type="submit" name="submit" id="submit"
								value='<spring:message code="label.logIn" />' class="button" />
							<label for="_spring_security_remember_me" class="checkboxLabel"
								style="display: none;"> <input type="checkbox"
								name="_spring_security_remember_me"
								id="_spring_security_remember_me" value="true" /> <spring:message
									code="label.rememberMe" />
							</label>
						</div>
						<p class="back">
							<spring:message code="label.copyRight" />
						</p>
					</form>
				</div></td>
		</tr>
	</table> --%>
	
	<!-- <script type="text/javascript"
		src=<c:url value="/resources/js/PIE_IE678.js" />></script> -->
</body>
<script>
$('#form-select-list').change(function(){
    if ($(this).val() == "2") {
$('#toggle').slideToggle("fast");
} else {
$('#toggle').slideToggle("fast");
}
});
</script>

</html> 