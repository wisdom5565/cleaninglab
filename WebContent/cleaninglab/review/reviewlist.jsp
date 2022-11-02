<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<title>대한민국 1등 홈클리닝, 청소연구소</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${cp}/assets/css/main.css" />
<link rel="stylesheet" href="${cp}/cleaninglab/header.css">
<link rel="shortcut icon" href="${cp}/cleaninglab/images/favicon.png">
<style>
.inner {
	width: 1100px;
}
#main{
	padding: 0 0 5rem 0;
}
#content > section{
	border-style: none;
}
#content {
	width: 500px;
}
.title{
	font-size: 40px;
	font-weight: 900;
}
.post {
	width: 620px;
}
.nothing{
	margin-top: 60px;
	margin-left: 60px;
}
#button{
	margin-left: 110px;
	font-weight: 700;
	background-color: #05C3DE;
}
.table-wrapper > table > thead > tr > th{
	font-weight: 900;
	font-size: 20px;
	color: #05C3DE;
	text-align: center;
}
.table-wrapper > table > tbody > tr > td{
	font-weight: 500;
	text-align: center;
}
.review {
	text-decoration: none;
	color: #171717;
}
</style>
</head>
<body class="is-preload">

	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>



	<!-- Main -->
	<div id="main">
		<div class="inner">
		
			<!-- Content -->
			<div id="content">

				<!-- Elements -->
				<section>
					<header>
						<h2 class="title">리얼후기</h2>
						<p style="font-weight: bold;">리얼후기 수정은 '마이페이지>내 예약>완료된 청소'에서 가능합니다.</p>
					</header>
					<div class="row">
						<div class="col-12">

							<!-- Table -->
							<div class="table-wrapper">
								<table>
									<thead>
										<tr>
											<th width="15%">등록 날짜</th>
											<th width="50%">한 줄 리뷰</th>
											<th width="35%">담당 매니저명</th>
										</tr>
									</thead>
									<c:forEach var="review" items="${requestScope.reviewlist}">
									<tbody>
										<tr>
											<td>${review.regdate}</td>
											<td><a href="${cp}/review/ReviewDetail.re?title=${review.title}"
												class="review">${review.title}</a></td>
											<td>${review.m_name}</td>
										</tr>
									</tbody>
									</c:forEach>
									<tfoot>
										<tr>
											<td colspan="2"></td>
										</tr>
									</tfoot>
								</table>
							</div>

						</div>
						<div class="col-12"></div>
					</div>
				</section>
			</div>
			
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

</body>
</html>