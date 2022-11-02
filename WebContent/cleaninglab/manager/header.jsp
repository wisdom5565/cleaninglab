<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<header id="header" style="background-color: #FFFFFF">
	<div class="inner">
		<a class="logo" href="${cp}/manager/ManagerMain.ma"><img
			src="${cp}/cleaninglab/images/청소연구소logo.png" width="110" height="29"
			style="vertical-align: middle; cursor: pointer;"></a>
		<nav id="nav">
			<ul>
				<c:choose>
					<c:when test="${empty loginManager}">
						<li><a class="menu" href="${cp}/manager/ManagerLogin.ma">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="menu" href="${cp}/manager/ManagerLogoutOk.ma">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				<li><a class="menu"
					href="${cp}/manager/educate/manager_educatemain.edu">교육
						일정</a></li>
				<li><a class="menu" href="${cp}/manager/ManagerMypage.mmy">마이페이지</a></li>
			</ul>
		</nav>
	</div>
</header>
