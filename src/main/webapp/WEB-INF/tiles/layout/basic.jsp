<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html ng-app="SpringApp" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<link href="${contextPath}/resources/css/api/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/api/bootstrap-theme.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/api/style.css" rel="stylesheet">

<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

<link href="${contextPath}/resources/fonts/css/font-awesome.css"
	rel="stylesheet" type="text/css" />
<link href="${contextPath}/resources/css/api/web.font.css"
	rel="stylesheet" type="text/css" />


<!-- API JS -->
<script src="${contextPath}/resources/js/api//jquery.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/js/api//bootstrap.min.js"
	type="text/javascript"></script>

<script src="${contextPath}/resources/js/api/html5.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/js/api/jquery.bootpag.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/js/api/css_browser_selector.js"
	type="text/javascript"></script>

<!-- Angular JS -->
<script src="${contextPath}/resources/js/api/angular.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/js/api/angular-sanitize.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/js/api/xeditable.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/js/api/easypiechart.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/js/angular-config.js"
	type="text/javascript"></script>

<script src="${contextPath}/resources/js/common.js"></script>
<script src="${contextPath}/resources/js/BaseController.js"></script>
<script type="text/javascript">
	var token = $("meta[name='_csrf']").attr("content");
	var contextPath = '${contextPath}';
</script>

<title><tiles:getAsString name="title" /></title>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body onload="pageLoader(false)">


	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="body">
			<tiles:insertAttribute name="body" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>

	<div id="pageLoader" class="loading"></div>
	<div id="pageLoaderAPI" class="loading" style="display: none;"></div>
	
	<!-- /container -->

</body>
</html>