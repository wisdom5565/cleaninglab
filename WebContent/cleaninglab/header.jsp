<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<header id="header" style="background-color: #FFFFFF">
	<div class="inner">
		<a class="logo" href="${cp}/user/UserIndex.us"><img
			src="${cp}/cleaninglab/images/청소연구소logo.png" width="110" height="29"
			style="vertical-align: middle; cursor: pointer;"></a>
		<nav id="nav">
			<ul>
				<c:choose>
					<c:when test="${empty loginUser}">
						<li><a class="menu" href="${cp}/user/UserLoginMain.us">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="menu" href="${cp}/user/UserLogoutOk.us">로그아웃</a></li>
						<li><a class="menu" href="${cp}/mypage/Mypage.my">마이페이지</a></li>
					</c:otherwise>
				</c:choose>
				<li><a class="menu" href="${cp}/cleaninglab/reservation.rs">예약하기</a></li>
				<li><a class="menu" href="${cp}/review/ReviewList.re">리얼후기</a></li>
				<li><a class="menu" href="${cp}/faq/FAQ.fq">FAQ</a></li>
				<li><a class="menu" href="${cp}/notice/Notice.no">공지사항</a> 
				<%-- <li><a class="menu"
               href="${cp}/cleaninglab/event/event_list.jsp">문의 게시판</a> --%>
			</ul>
		</nav>
	</div>
</header>
