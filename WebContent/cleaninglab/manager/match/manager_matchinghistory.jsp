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
<title>청소매칭-청소연구소매니저</title>
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/cleaninglab/manager/css/manager_progress.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/manager/css/javascript.fullPage.css" />
<script type="text/javascript" src="${cp}/cleaninglab/manager/js/javascript.fullPage.js"></script>
<style>
#nav .menu {
	color: black;
	font-weight: 700;
}
#nav .menu:hover {
	color: black;
	background-color: #eeeeee;
}
#main {
	background-color: white;
	height: 100%;
}
table, tr, td, th {
	text-align: center;
}

.inner{
	width: 1100px;
}

</style>
</head>
<body class="is-preload">

	<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>
	<c:if test="${edunum != 2}">
		<script>
			alert("교육 수료 후 이용 가능한 서비스입니다.");
			location.replace("${cp}/manager/ManagerMain.ma");
		</script>
	</c:if>

	<c:set var="list" value="${requestScope.MatchList }"/>
	<c:set var="managername" value="${requestScope.managername}"/>
	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Content -->
			<div id="content">
				
					<div class="fisdiv">

						<header>
							<h2 style="text-align: center">${managername}매니저님의 매칭내역입니다.</h2>
						</header>
							<table>
								<tr>							
									<td>예약번호</td>
									<td>고객명</td>
									<td>주소</td>
									<td>서비스내용</td>
									<td>진행상황</td>
								</tr>
								<c:choose>
								<c:when test="${list.size()>0 and list != null }">
								<c:forEach var="list" items="${list }">	
								
								<tr>									
									<td>${list.servicenum }</td>
									<td>${list.username }</td>
									<td>${list.addr}</td>
									<td>${list.retype}</td>
									<td>${list.state}</td>
								</tr>
								</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">매칭내역이 없습니다.</td>
									</tr>
								</c:otherwise>
								</c:choose>
							</table>
					</div>
					
					
			</div>
		</div>
	</div>
						

	
	<!-- Footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>

</body>
</html>