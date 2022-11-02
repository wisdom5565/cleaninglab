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
a:hover {
	cursor:pointer;
}
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
.resvbuttonul3 {
	list-style-type: none;
	width: 100%;
}

.resvbuttonli3>a {
	background-color: #05C3DE;
	position: relative;
	top: -10px !important;
	left:980px !important;
	border-radius: 10px;
	padding: 15px;
	text-decoration: none;
	color: white;
	font-size: 1.0em;
	font-weight: bold;
	display: inline-block;
}

.resvbuttonli3>a:hover {
	
}
</style>
</head>
<body class="is-preload">
	
	<c:if test="${loginManager == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/manager/ManagerLogin.ma");
		</script>
	</c:if>
	<c:if test="${edunum != 2}">
		<script>
			alert("교육 수료 후 이용 가능한 서비스입니다.");
			location.replace("${cp}/manager/ManagerMain.ma");
		</script>
	</c:if>
	<c:if test="${param.workspace == null}">
		<script>
			alert("희망근무지역을 설정해주세요.");
			location.replace("${cp}/manager/infoModify.mmy");
		</script>
	</c:if>
	<c:set var="list" value="${requestScope.MatchList }"/>
	
	<!-- Header -->
	<jsp:include page="/cleaninglab/manager/header.jsp"></jsp:include>

	<!-- Main -->
	<div id="main">
		<div class="inner">

		<!-- Content -->
			<div id="content">
				
					<div class="fisdiv">

						<header>
							<h2 style="text-align: center; padding-bottom: 10px;">${sessionScope.loginManager.managername}매니저님의 매칭하기입니다.</h2>
						</header>
							<p style="text-align: center; padding: 15px;">※ 매칭한 회원의 상세주소는 메시지로 전송됩니다.</p>

							<table>
								<tr>
									<td></td>
									<td>예약번호</td>
									<td>고객명</td>
									<td>주소</td>
									<td>서비스내용</td>
									<td>날짜</td>
									<td>진행상황</td>
								</tr>
								<c:choose>
								<c:when test="${list.size()>0 and list != null }">
								<c:forEach var="list" items="${list }">
								<tr>
									<td>
										<div class="center">
										<label class="checkbox">
										<input type='checkbox' name='matching' value='${list.servicenum }' onclick='checkOnlyOne(this)'/> 
										<span class="icon"></span>
										</label>
										</div>
									</td>
									<td>${list.servicenum }</td>
									<td>${list.username }</td>
									<td>${list.addr}</td>
									<td>${list.retype}</td>
									<td>${list.redate}</td>
									<td>${list.state}</td>
								</tr>
								</c:forEach>	
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6">등록된 매칭이 없습니다.</td>
									</tr>
								</c:otherwise>
								</c:choose>
								
							</table>
						
							<ul class="resvbuttonul3">
							<li class="resvbuttonli3"><a onclick='getCheckboxValue()'>매칭하기</a>
							<li>
							</ul>
						
					</div>
					
					
			</div>
		</div>
	</div>

						
	
	<!-- Footer -->
	<jsp:include page="/cleaninglab/manager/footer.jsp"></jsp:include>



</body>
<script type="text/javascript">
function getCheckboxValue()  {
	  // 선택된 목록 가져오기
	  const query = 'input[name="matching"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);
	  
	  // 선택된 목록에서 value 찾기
	  let result = '';
	  selectedEls.forEach((el) => {
	    result += el.value + ' ';
	  });
	  
	  // 출력
	  location.href="${cp}/manager/matching/matching.mac?value="+result;
	}
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("matching");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}
</script>
</html>