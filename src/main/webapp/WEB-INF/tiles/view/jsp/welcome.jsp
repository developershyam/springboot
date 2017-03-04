<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('.nav li').removeClass('active');
		$('#homeTab').addClass('active');
	});
</script>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<div class="body_content">
	<div class="container">
		<div class="row marginTop20"></div>
		<div class="jumbotron">
			<!-- <h2 style="font-weight: bold;">Spring Boot</h2> -->
			<c:if test="${pageContext.request.userPrincipal.name != null}">

				<h2 style="font-weight: bold;">Welcome
					${pageContext.request.userPrincipal.name}</h2>
				<br />

			</c:if>
			<p>Example covers Spring MVC, REST, Security, Authentication &
				Authorization, View mapping with JSP and Tiles, Validation, I18N
				Messages and Localization, JPA CRUD and Actuator. For database
				purpose it configured with HSQLDB (In memory) as well as MySQL.</p>
		</div>
		<div class="row">
			<div class="col-sm-1 col-md-2 col-lg-3"></div>
			<div class="col-sm-10 col-md-8 col-lg-6"></div>
			<div class="col-sm-1 col-md-2 col-lg-3"></div>

		</div>
	</div>
</div>

