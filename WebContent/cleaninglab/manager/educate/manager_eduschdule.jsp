<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
	Apex by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<title>${requestScope.EduArea }-청소연구소</title>
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/manager/css/javascript.fullPage.css" />
<script type="text/javascript" src="${cp}/cleaninglab/manager/js/javascript.fullPage.js"></script>
<style>
.nonebulletlist {
	list-style-type: none;
}

#nav .menu {
	color: black;
	font-weight: 700;
}

#nav .menu:hover {
	color: black;
	background-color: #eeeeee;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	color: #05C3DE;
}

table, tr, td {
	position: relative;
	text-align: center;
	border: none;
	background-color: white;
	line-height: 30px;
}

#main {
	background-color: white;
}
span{
	position: relative;
	text-align: center;
	left: 570px;
}
</style>
</head>
<body class="is-preload">
	<c:set var="datelist" value="${requestScope.EduDateList }"/>
	<c:if test="${loginManager == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/manager/ManagerLogin.ma");
		</script>
	</c:if>
	<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>

	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Content -->
			<div id="content">
				
					<div class="fisdiv">

						<header>
							<h2 style="text-align: center">${requestScope.EduArea }</h2>
						</header>
						<table style="border: none" class="resedutable">
						<c:choose>
								<c:when test="${datelist.size()>0 and datelist != null }">
							<c:forEach var="date" items="${datelist }">
							<tr style="border: none">
								<td style="border: none">${date.edudate }</td>
								<td style="border: none"></td>
								<td style="border: none" rowspan="2"><a href="${cp}/manager/educate/manager_edudetail.edu?edudatenum=${date.edudatenum }">${date.location[0] }<br>${date.edutime }
								</a></td>
							</tr>
							<tr style="border: none">
								<td style="border: none"></td>
								<td style="border: none"></td>
								<td style="border: none"></td>
							</tr>
							</c:forEach>
							</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6">등록된 교육일정이 없습니다.</td>
									</tr>
								</c:otherwise>
								</c:choose>
						</table>
						<span style="text-align: center;">* 교육은 <font style="color: #05C3DE;">총 5시간</font> 진행됩니다.</span>

					</div>
					
					
			</div>
		</div>
	</div>

	
	<!-- Footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>

	

</body>
</html>