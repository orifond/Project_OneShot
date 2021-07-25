<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<link rel="stylesheet" href="/resources/css/components/default.css" />
	<title>OneShot</title>
	

	<style>
	section#content ul li { display:inline-block; margin:10px; }
	section#content div.goodsThumb img { width:200px; height:200px; }
	section#content div.goodsName { padding:10px 0; text-align:center; }
	section#content div.goodsName a { color:#000; }
	</style>
	
	
</head>

<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<div id="container_box">
		
			<section id="content">
					
			<ul>
				 <c:forEach items="${list}" var="list">
				 <li> <a href="/shop/view?n=${list.gdsNum}">
					  <div class="goodsThumb">
						   <img src="${list.gdsImg}">
					  </div> 
					  <div class="goodsName">
					    <c:if test= "${fn:length(list.gdsName) > 10}">
				   	 ${fn:substring(list.gdsName,0,15)}..
				   	 </c:if>
				 	 </div>
				  </a></li>
				 </c:forEach>
			</ul>
								
					
			</section>
			
			<aside id="aside">
				<%@ include file="../include/aside.jsp" %>
			</aside>
			
		</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>		
	</footer>

</div>
</body>
</html>
