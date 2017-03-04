<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link href="<c:url value="/resources/css/header.css"/>" rel="stylesheet"
	type="text/css" />

<header>

	<nav id="myNavbar"
		class="navbar navbar-default navbar-inverse navbar-fixed-top header_inner"
		role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbarCollapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"
					style="color: white; font-weight: bold; font-size: 1.5em;">Spring
					Boot</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="nav navbar-nav">
					<li id="homeTab" class=""><a href="${contextPath}/welcome"><span class="glyphicon glyphicon-home"
							style="font-size: 18px; padding-right: 8px"></span> Home</a></li>
					<li id="employeeTab"><a href="${contextPath}/employees"><span class="glyphicon glyphicon-user"
							style="font-size: 18px; padding-right: 8px"></span> Employee</a></li>

					<sec:authorize access="hasAnyRole('ROLE_APP_MANAGER')">
						<li id="managementTab"><a href="${contextPath}/managementView"><span class="glyphicon glyphicon-stats"
							style="font-size: 18px; padding-right: 8px"></span> Management</a></li>
					</sec:authorize>
					

					<li id="logoutTab"><sec:authorize access="isAuthenticated()">
							<form id="logoutForm" method="POST"
								action="${contextPath}/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
							<a href="javascript:void(0);"
								onclick="document.forms['logoutForm'].submit()"><span
								class="fa fa-power-off"
								style="font-size: 18px; padding-right: 8px"></span> Logout</a>
						</sec:authorize></li>

					<li id="welcomeTab"><sec:authorize access="isAuthenticated()">

							<a style="color: white; font-weight: bold; font-size: 1.2em;"
								href="javascript:void(0);">Welcome <sec:authentication
									property="principal.username" /> !!!
							</a>
						</sec:authorize></li>
				</ul>
			</div>
		</div>
	</nav>
</header>



