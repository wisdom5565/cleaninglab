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
	#banner #main_img{
		display:inline;
	}
	.manager_img{
		float: right;
		position: absolute;
		left: 930px;
	}
	.text1{
		margin: 0 auto;
		height: 60%;
	}
	.text2{
		height: 60%;
		padding-top: 10%;
		position: absolute;
		
	}
	.text2_img{
		position: absolute;
		margin-left: 250px;
	}
	.m_text{
		font-size: 20px;
		padding-bottom: 10px;
		font-weight: 400;
	}
	.posts{
		width: 1100px;
		display: flex;
		margin-top: 40%;
		margin-left: 55px;
	}
	.post{
		width: 30%;
		flex: 1;
		padding: 0;
		margin: 10px;
		
	}
	.inner{
		width: 1100px;
	}
	.icon_img{
		width: 180px;
		height: 180px;
		margin-bottom: 5px;
		margin-left: 35px;
	}
	#button{
		font-weight: 700;
		width: 250px;
	}
	
</style>
</head>
<body class="is-preload">
	<!-- Header -->
	<jsp:include page="/cleaninglab/header.jsp"></jsp:include>

	<!-- Banner -->
	<div id="banner">
		<article data-position="bottom right">
			<div class="inner">
				<div>
					<img src="${cp}/cleaninglab/images/청소연구소index_img1.jpg" alt="">
				</div>
				<div>
					<img src="${cp}/cleaninglab/images/청소연구소main_text.png" width="600" height="150" id="main_img">
				</div>
			</div>
		</article>
		<article data-position="bottom right">
			<div class="inner">
			<div>
				<img src="${cp}/cleaninglab/images/청소연구소index_img2.jpg" alt="">
			</div>
			<div>
				<img src="${cp}/cleaninglab/images/청소연구소main_text.png" width="600" height="150" id="main_img">
			</div>
			</div>
		</article>
		<article data-position="bottom right">
			<div class="inner">
			<div>
				<img src="${cp}/cleaninglab/images/청소연구소index_img3.jpg" alt="">
			</div>
			<div>
				<img src="${cp}/cleaninglab/images/청소연구소main_text.png" width="600" height="150" id="main_img">
			</div>
			</div>
		</article>
				
	</div>

	<!-- Main -->
	<div id="main">
		<div class="inner">

				<!-- Posts -->
				<section>
					<header>
					<div class="manager_img">
						<img src="${cp}/cleaninglab/images/청소연구소manager_edu.jpg" width="450" height="350">
					</div>
					<div class="text1">
						<img src="${cp}/cleaninglab/images/청소연구소_text2.png">
						<ul style="padding-top: 20px;">
							<li class="m_text">신원확인</li>
							<li class="m_text">인성면접</li>
							<li class="m_text">이론교육</li>
							<li class="m_text">실습교육</li>
							<li class="m_text">보험가입</li>
						</ul>
					</div>
					<div class="text2">
						<img src="${cp}/cleaninglab/images/청소연구소_text.png" class="text2_img">
					</div>
					</header>
					<section class="posts">
						<div class="post">
							<div >
								<a href="${cp}/service/ServiceList.se"><img src="${cp}/cleaninglab/images/청소연구소icon1.png" alt="" class="icon_img"/></a>
							</div>
							<ul class="actions fixed">
								<li><a href="${cp}/service/ServiceList.se" id="button" class="button alt fit">청소범위 & 이용방법</a></li>
							</ul>
						</div>
						<div class="post">
							<div>
								<a href="${cp}/cleaninglab/reservation.rs"><img src="${cp}/cleaninglab/images/청소연구소icon2.png" alt="" class="icon_img"/></a>
							</div>
							<ul class="actions fixed">
								<li><a href="${cp}/cleaninglab/reservation.rs" id="button" class="button alt fit">예약하기</a></li>
							</ul>
						</div>
						<div class="post">
							<div>
								<a href="${cp}/manager/ManagerMain.ma"><img src="${cp}/cleaninglab/images/청소연구소icon3.png" alt="" class="icon_img"/></a>
							</div>
							<ul class="actions fixed">
								<li><a href="${cp}/manager/ManagerMain.ma" id="button" class="button alt fit">매니저 홈페이지</a></li>
							</ul>
						</div>
					</section>
				</section>

			</div>
	</div>


	<!-- Footer -->
	<jsp:include page="/cleaninglab/footer.jsp"></jsp:include>

</body>
</html>