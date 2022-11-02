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
<title>청소진행상황-청소연구소매니저</title>
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
</style>
</head>
<body class="is-preload">

	<c:set var="list" value="${requestScope.MatchList1 }"/>
	<c:set var="managername" value="${requestScope.managername}"/>
	<c:if test="${edunum != 2}">
		<script>
			alert("교육 수료 후 이용 가능한 서비스입니다.");
			location.replace("${cp}/manager/ManagerMain.ma");
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
							<h2 style="text-align: center">${managername}매니저님의 청소 진행 상황입니다.</h2>
						</header>
							<table>
								<tr>
									<td></td>
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
									<td>
										<div class="center">
										<label class="checkbox">
										<input type="checkbox"  name='matching' value='${list.servicenum }' onclick='checkOnlyOne(this)'>
										<span class="icon"></span>
										</label>
										</div>
									</td>
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
										<td colspan="6">매칭정보가 없습니다.</td>
									</tr>
								</c:otherwise>
								</c:choose>
							</table>
							<ul class="resvbuttonul">
							<li class="resvbuttonli"><a onclick='getCheckboxValue1()'>매칭취소</a>
							<li>
						</ul>
							<ul class="resvbuttonul1">
							<li class="resvbuttonli1"><a onclick='getCheckboxValue2()'>자택방문</a>
							<li>
						</ul>
							<ul class="resvbuttonul2">
							<li class="resvbuttonli2"><a onclick='getCheckboxValue3()'>청소중</a>
							<li>
						</ul>
							<ul class="resvbuttonul3">
							<li class="resvbuttonli3"><a onclick='getCheckboxValue4()'>청소완료</a>
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
//매칭취소
function getCheckboxValue1()  {
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
	  location.href="${cp}/manager/matching/matchingcancel.mac?value="+result;
	}
	//자택방문
function getCheckboxValue2()  {
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
	  location.href="${cp}/manager/matching/matchingvisit.mac?value="+result;
	}
	//청소중
function getCheckboxValue3()  {
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
	  location.href="${cp}/manager/matching/matchingclean.mac?value="+result;
	}
	//청소완료
function getCheckboxValue4()  {
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
	  location.href="${cp}/manager/matching/matchingfinish.mac?value="+result;
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