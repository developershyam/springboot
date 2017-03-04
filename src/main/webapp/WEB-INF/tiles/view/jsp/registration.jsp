<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
$(document).ready(function () {
	$('.nav li').removeClass('active');
	$('#homeTab').addClass('active');
});
</script>
<div class="body_content">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 marginTop20"></div>
			<div class="bodywrapper1">
				<form:form method="POST" modelAttribute="userForm">
					<div class="col-sm-5 col-sm-push-7">
						<div class="right_area paddingRight">
							<div class="bgColor">
								<h2 style="">Let's get started</h2>
								<div class="joinus_area">
									<ul>
										<li><form:radiobutton path="userType" value="MANAGER" checked="checked" 
												id="userTypeMANAGER" style="cursor: pointer;" /> <label
											style="cursor: pointer;" for="userTypeMANAGER">Manager</label></li>
										<li><form:radiobutton path="userType" value="USER"
												id="userTypeUSER" style="cursor: pointer;" />
											<label style="cursor: pointer;" for="userTypeUSER">User</label></li>

									</ul>

								</div>

								<form:input type="text" placeholder="Your name" path="name"
									class="form-control" />
								<form:errors path="name" cssClass="error span_error" />
								<form:input type="text" placeholder="Your email" path="email"
									class="form-control" />
								<form:errors path="email" cssClass="error span_error" />
								<input class="passwordinput form-control" type="password"
									placeholder="Password" name="password" />
								<form:errors path="password" cssClass="error span_error" />
								<input class="passwordinput form-control" type="password"
									placeholder="Re-type Password" name="passwordConfirm" />
								<form:errors path="passwordConfirm" cssClass="error span_error" />

								<div class="right_bottomtext">
									By clicking on sign up you agree to our <a
										href="javascript:void(0)"
										onclick="pageLoader(true);location.href=baseURL+'pub/privacy.do';return false;">
										Terms & Condition</a>
								</div>
								<button type="button" onclick="$(this).closest('form').submit()"
									class="btn btn-warning btn-block" title=""
									style="margin-left: 0px; margin-top: 10px">Sign Up</button>

								<h4 class="text-center">
									<a href="${contextPath}/login">LogIn Here</a>
								</h4>
							</div>


						</div>
					</div>
				</form:form>

				<div class="col-sm-7 col-sm-pull-5 text-center hidden-xs">
					<div class="" style="margin-top: 100px">
						<h1 style="font-size: 32px; color: #00a0ef; margin-bottom: 15px">Your
							Learning partner</h1>
						<article style="font-size: 16px; color: #46494a;">
							Spring Boot and other latest technologies...</article>
					</div>

				</div>

			</div>
		</div>
	</div>
</div>

