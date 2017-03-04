<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
$(document).ready(function () {
	$('.nav li').removeClass('active');
	$('#homeTab').addClass('active');
});
</script>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="body_content">
	<div class="container">
		<div class="row marginTop20">
			<div class="col-sm-1 col-md-2 col-lg-3"></div>
			<div class="col-sm-10 col-md-8 col-lg-6">
				<form method="POST" action="${contextPath}/login"
					class="form-signin" style="border: solid 1px gray;">
					<h2 class="form-heading">Log in</h2>
					<div class="form-group ${error != null ? 'has-error' : ''}">
						<span>${message}</span> <input name="email" type="text"
							class="form-control" placeholder="Email" autofocus="true" /> <input
							name="password" type="password" class="form-control"
							placeholder="Password" /> <span>${error}</span> <input
							type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<button class="btn btn-lg btn-primary btn-block" type="submit">Log
							In</button>
						<h4 class="text-center">
							<a href="${contextPath}/registration">Create an account</a>
						</h4>
					</div>

				</form>
			</div>
			<div class="col-sm-1 col-md-2 col-lg-3"></div>

		</div>
	</div>
</div>
