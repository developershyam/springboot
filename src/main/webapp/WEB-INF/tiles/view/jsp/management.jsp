<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
    
    .result  h3 + div {
      border: 1px solid lightgray;
      border-radius: 5px;
      padding: 10px;
    }
    
    </style>
<script type="text/javascript">
$(document).ready(function () {
	$('.nav li').removeClass('active');
	$('#managementTab').addClass('active');
});
var firstURL='${contextPath}/management/autoconfig';
</script>
<script src="${contextPath}/resources/js/api/json-formatter.js"></script>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="body_content">
	<div class="container" id="managementController"
		ng-controller="ManagementController">
		<div class="row marginTop20">

			<div class="col-sm-2"
				style="margin-right: 20px; padding-right: 10px; color: inherit; background-color: #eee; overflow: hidden;">
				Management List
				<ul class="mlistUL" style="font-size: 40px; font-weight: bold;">
					<li class="mlist active"
						style="border-bottom-style: groove; cursor: pointer;"
						onclick="getManagementData('${contextPath}/management/autoconfig')"><a
						href="javascript:void(0)"> /autoconfig </a></li>
					<li class="mlist"
						style="border-bottom-style: groove; cursor: pointer;"
						onclick="getManagementData('${contextPath}/management/beans')"><a
						href="javascript:void(0)">/beans</a></li>
					<li class="mlist"
						style="border-bottom-style: groove; cursor: pointer;"
						onclick="getManagementData('${contextPath}/management/configprops')"><a
						href="javascript:void(0)">/configprops</a></li>
					<li class="mlist"
						style="border-bottom-style: groove; cursor: pointer;"
						onclick="getManagementData('${contextPath}/management/dump')"><a
						href="javascript:void(0)">/dump</a></li>
					<li class="mlist"
						style="border-bottom-style: groove; cursor: pointer;"
						onclick="getManagementData('${contextPath}/management/env')"><a
						href="javascript:void(0)">/env</a></li>
					<li class="mlist"
						style="border-bottom-style: groove; cursor: pointer;"
						onclick="getManagementData('${contextPath}/management/health')"><a
						href="javascript:void(0)">/health</a></li>
					<li class="mlist"
						style="border-bottom-style: groove; cursor: pointer;"
						onclick="getManagementData('${contextPath}/management/info')"><a
						href="javascript:void(0)">/info</a></li>
					<li class="mlist"
						style="border-bottom-style: groove; cursor: pointer;"
						onclick="getManagementData('${contextPath}/management/loggers')"><a
						href="javascript:void(0)">/loggers</a></li>
					<li class="mlist"
						style="border-bottom-style: groove; cursor: pointer;"
						onclick="getManagementData('${contextPath}/management/mappings')"><a
						href="javascript:void(0)">/mappings</a></li>
					<li class="mlist"
						style="border-bottom-style: groove; cursor: pointer;"
						onclick="getManagementData('${contextPath}/management/metrics')"><a
						href="javascript:void(0)">/metrics</a></li>
					<li class="mlist"
						style="border-bottom-style: groove; cursor: pointer;"
						onclick="getManagementData('${contextPath}/management/trace')"><a
						href="javascript:void(0)">/trace</a></li>
					<li class="mlist"
						style="border-bottom-style: groove; cursor: pointer;"
						onclick="getManagementData('${contextPath}/management/auditevents')"><a
						href="javascript:void(0)">/auditevents</a></li>
					<li class="mlist"
						style="border-bottom-style: groove; cursor: pointer;"
						onclick="getManagementData('${contextPath}/management/logfile')"><a
						href="javascript:void(0)">/logfile</a></li>
					<li class="mlist" style="border-bottom-style: groove;"><a
						href="${contextPath}/management/docs" target="_blank">/docs</a></li>
						
				</ul>
			</div>
			<div class="col-sm-8">
				<div class="row">
					<div class="col-sm-12" style="max-height: 500px; overflow: auto;">

						<div class="result"></div>
					</div>



				</div>

			</div>
		</div>


	</div>

</div>