<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<link rel="stylesheet" href="/resources/css/components/default.css" />
	<title>OneShot</title>
		
	<style>
	/*
		section#content ul li { display:inline-block; margin:10px; }
		section#content div.goodsThumb img { width:200px; height:200px; }
		section#content div.goodsName { padding:10px 0; text-align:center; }
		section#content div.goodsName a { color:#000; }
	*/
		.orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;} 
		.orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
		
		.orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
		.orderView li::after { content:""; display:block; clear:both; }
		
		.thumb { float:left; width:200px; }
		.thumb img { width:200px; height:200px; }
		.gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
		.gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
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
			
			 <div class="orderInfo">
			  <c:forEach items="${orderView}" var="orderView" varStatus="status">
			   
			   <c:if test="${status.first}">
			    <p><span>수령인</span>${orderView.orderRec}</p>
			    <p><span>주소</span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</p>
			    <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
			   </c:if>
			   
			  </c:forEach>
			 </div>
			 
			 <ul class="orderView">
			  <c:forEach items="${orderView}" var="orderView">     
			  <li>
			   <div class="thumb">
			    <img src="${orderView.gdsImg}" />
			   </div>
			   <div class="gdsInfo">
			    <p>
			     <span>상품명</span>${orderView.gdsName}<br />
			     <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" /> 원<br />
			     <span>구입 수량</span>${orderView.cartStock} 개<br />
			     <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원                  
			    </p>
			   </div>
			  </li>     
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
