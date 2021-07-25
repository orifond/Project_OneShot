<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html>
<head>
	<link rel="stylesheet" href="/resources/css/components/default.css" />
	<title>OneShot</title>
</head>

<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="include/header.jsp" %>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<%@ include file="include/nav.jsp" %>
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
				   	 ${fn:substring(list.gdsName,0,25)}…
				   	 </c:if>
				 	 </div>
				  </a></li>
				 </c:forEach>
			</ul>
			</section>
			
			<aside id="aside">
				<%@ include file="include/aside.jsp" %>
			</aside>
			
		</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="include/footer.jsp" %>
		</div>		
	</footer>

</div>
</body>
</html>
