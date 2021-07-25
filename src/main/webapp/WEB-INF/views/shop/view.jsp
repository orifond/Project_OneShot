<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html>
<head>
	<link rel="stylesheet" href="/resources/css/components/default.css" />
	<title>OneShot</title>

	<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<style>
div.goods div.goodsImg {
	float: left;
	width: 350px;
}
div.goods div.goodsImg img {
	width: 350px;
	height: auto;
}
div.goods div.goodsInfo {
	float: auto;
	width: auto;
	font-size: 22px;
}
div.goods div.goodsInfo p {
	margin: 0 0 20px 0;
}
div.goods div.goodsInfo p span {
	display: inline-block;
	width: auto;
	margin-right: 15px;
}
div.goods div.goodsInfo p.cartStock input {
	font-size: 22px;
	width: 50px;
	padding: 5px;
	margin: 0;
	border: 1px solid #eee;
}
div.goods div.goodsInfo p.cartStock button {
	font-size: 26px;
	border: none;
	background: none;
}
div.goods div.goodsInfo p.addToCart {
	text-align: right;
}
div.goods div.goodsInfo p.addToCart button {
	font-size: 22px;
	padding: 5px 10px;
	border: 1px solid #eee;
	background: #eee;
}
div.goods div.gdsDes {
	font-size: 18px;
	clear: both;
	padding-top: 30px;
}
div.goodssugImg {
	width: 200px;
	padding: 10px;
	float: left;
}
div.goodssugImg img {
	width: 200px;
	height: auto;
	padding: 40px;
}
div.goodsName {
	text-align:center;
	display:inline-block;
	}
</style>
<style>
section.replyForm {
	padding: 30px 0;
}

section.replyForm div.input_area {
	margin: 10px 0;
}

section.replyForm textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;;
	height: 150px;
}

section.replyForm button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

section.replyList {
	padding: 30px 0;
}

section.replyList ol {
	padding: 0;
	margin: 0;
}

section.replyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.replyList div.userInfo {
	
}

section.replyList div.userInfo .userName {
	font-size: 24px;
	font-weight: bold;
}

section.replyList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.replyList div.repRating {
	padding: 5px;
	margin: 5px 0;
}

section.replyList div.replyContent {
	padding: 5px;
	margin: 5px 0;
}

section.replyList div.replyFooter button {
	font-size: 14px;
	border: 1px solid #999;
	background: none;
	margin-right: 10px;
}
</style>

<style>
div.replyModal {
	position: relative;
	z-index: 1;
	display: none;
}

div.modalBackground {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}

div.modalContent {
	position: fixed;
	top: 20%;
	left: calc(50% - 250px);
	width: 500px;
	height: 250px;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

div.modalContent textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;
	height: 200px;
}

div.modalContent button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

div.modalContent button.modal_cancel {
	margin-left: 20px;
}
</style>

<script> 
	
	//재사용을 위한 함수화
	function replyList(){
	
	// 상품 리뷰 AJax처리
	 var gdsNum = ${view.gdsNum};
	 $.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data){
	  var str = "";
	  
	  $(data).each(function(){
	   
	   console.log(data);
	   
	   // 날짜 데이터를 보기 쉽게 변환
	   var repDate = new Date(this.repDate);
	   repDate = repDate.toLocaleDateString("ko-US")
	   
	   // HTML 코드 조립
	   str += "<li data-gdsNum='" + this.gdsNum + "'>"
	     + "<div class='userInfo'>"
	     + "<span class='userName'>" + this.userName + "</span>"
	     + "<span class='date'>" + repDate + "</span>"
	     + "</div>"
	     + "<div class='repRating'>" + this.repRating + "</div>"
	     + "<div class='replyContent'>" + this.repCon + "</div>"
	     
	      + "<div class='replyFooter'>"
	      + "<button type='button' class='modify' data-repNum='" + this.repNum + "'>수정</button>"
	      + "<button type='button' class='delete' data-repNum='" + this.repNum + "'>삭제</button>"
	      + "</div>"
	     
	     + "</li>";           
	  });
	  
	  $("section.replyList ol").html(str);
	 });
	 
	}
	</script>
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>

		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>

		<section id="container">
			<div id="container_box">

				<section id="content">

					<form role="form" method="post">
						<input type="hidden" id="gdsNum" name="gdsNum"
							value="${view.gdsNum}" />
					</form>

					<!-- 상품 조회 -->
					<div class="goods">
						<div class="goodsImg">
							<img src="${view.gdsImg}">
						</div>

						<div class="goodsInfo">
							<p class="gdsName">
								<span>상품명</span>${view.gdsName}</p>

							<p class="cateName">
								<span>카테고리</span>${view.cateName}</p>

							<p class="gdsPrice">
								<span>가격 </span>
								<fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
								원
							</p>

							<p class="gdsStock">
								<span>재고 </span>
								<fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}" />
								EA
							</p>

							<p class="cartStock">
								<span>구입 수량</span> <input type="number" id="cartStock" min="1"
									max="${view.gdsStock}" value="1" />
							</p>


							<!-- 카트 담기      -->
							<p class="addToCart">
								<button type="button" class="addCart_btn">카트에 담기</button>

								<script>
									$(".addCart_btn").click(function() {
										var gdsNum = $("#gdsNum").val();
										var cartStock = $("#cartStock").val();
										console.log(gdsNum)
										console.log(cartStock)

										var data = {
											gdsNum : gdsNum,
											cartStock : cartStock
										};

									
									$.ajax({
											url : "/shop/view/addCart",
											type : "post",
											data : data,
											success : function(result) {

												if (result == 1) {
													alert("카트 담기 성공");
													$(".numBox").val("1");
												} else {
													alert("회원만 사용할 수 있습니다.")
													$(".numBox").val("1");
												}
											},
											error : function() {
												alert("카트 담기 실패");
											}
										});
									});
							
								</script>
						</div>
					</div>

						<div id="recommendations">
							<section id="content">
								<h3>추천상품</h3>
								<ul>
									<c:forEach items="${sugList}" var="sug">
										<li><a href="/shop/view?n=${sug.gdsNum}">
												<div class="goodssugImg">
													<img src="${sug.gdsImg}">
												</div>
										</a></li>
									</c:forEach>
								</ul>
							</section>
						</div>
						
						

						<div class="gdsDes">
							<c:set var="gdsDes" value="${view.gdsDes}" />
							<c:set var="img" value="${fn:split(gdsDes,',')}" />

							<c:forTokens items="${gdsDes}" delims="," var="mySplit"
								varStatus="status">
								<c:if test="${status.index > 0}">
									<img src=${mySplit}>
								</c:if>
							</c:forTokens>
						</div>
						<div id="reply">

							<c:if test="${member == null }">
								<p>
									리뷰를 남기시려면 <a href="/member/signin">로그인</a>해주세요
								</p>
							</c:if>

							<c:if test="${member != null}">
								<section class="replyForm">
									<form role="form" method="post" autocomplete="off">

										<input type="hidden" name="gdsNum" value="${view.gdsNum}">

										<div class="input_area">
											<textarea name="repCon" id="repCon"></textarea>
										</div>

										<div class="input_area">
											<button type="button" id="reply_btn">리뷰 작성</button>

											<script>
											 $("#reply_btn").click(function(){
											  
											  var formObj = $(".replyForm form[role='form']");
											  var gdsNum = $("#gdsNum").val();
											  var repRating = $("#repRating").val()
											  var repCon = $("#repCon").val()
											  
											  var data = {
											    gdsNum : gdsNum,
											    repCon : repCon
											    };
											  
											  $.ajax({
											   url : "/shop/view/registReply",
											   type : "post",
											   data : data,
											   success : function(){
											    replyList();
											    $("#repCon").val("");
											   }
											  });
											 });
											</script>

										</div>
									</form>
								</section>
							</c:if>


							<section class="replyList">
								<ol>

									<%--
				 <c:forEach items="${reply}" var="reply">
				
				  <li>
				      <div class="userInfo">
				       <span class="userName">${reply.userName}</span>
				       <span class="date"><fmt:formatDate value="${reply.repDate}" pattern="yyyy-MM-dd" /></span>
				      </div>
						<div class="repRating">${reply.repRating}점</div>			
				      <div class="replyContent">${reply.repCon}</div>
				    </li>
				   </c:forEach>
				--%>
								</ol>

								<script>
							replyList();
						</script>

								<script>
							$(document).on("click", ".modify", function(){
								 //$(".replyModal").attr("style", "display:block;");
								$(".replyModal").fadeIn(200);
								
								 var repNum = $(this).attr("data-repNum");
								 var repCon = $(this).parent().parent().children(".replyContent").text();
								 
								 $(".modal_repCon").val(repCon);
								 $(".modal_modify_btn").attr("data-repNum", repNum);
								 
								});					
				
						 $(document).on("click", ".delete", function(){
							 
							 var deletConfirm = confirm("정말로 삭제하시겠습니까?");
							 
							 if(deletConfirm){ 
						  
								  var data = {repNum : $(this).attr("data-repNum")};
								   
								  $.ajax({
								   url : "/shop/view/deleteReply",
								   type : "post",
								   data : data,
								   success : function(result){
									   
									   if(result == 1) {
									    replyList();
									   } else {
									    alert("작성자 본인만 삭제할 수 있습니다.");     
									   }
								   },
								   error : function(){
									   alert("로그인이 필요합니다.");
								   }
								  });
								 }
							 });
							</script>

							</section>
						</div>
				</section>

				<aside id="aside">
					<%@ include file="../include/aside.jsp"%>
				</aside>

			</div>
		</section>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>

	</div>
	<div class="replyModal">
		<div class="modalContent">
			<div>
				<textarea class="modal_repCon" name="modal_repCon"></textarea>
			</div>
			<div>
				<button type="button" class="modal_modify_btn">수정</button>
				<button type="button" class="modal_cancel">취소</button>
			</div>
		</div>
		<div class="modalBackground"></div>
	</div>
	<script>
		$(".modal_modify_btn").click(function() {
			var modifyConfirm = confirm("정말로 수정하시겠습니까?");

			if (modifyConfirm) {
				var data = {
					repNum : $(this).attr("data-repNum"),
					repCon : $(".modal_repCon").val()
				}; // ReplyVO 형태로 데이터 생성

				$.ajax({
					url : "/shop/view/modifyReply",
					type : "post",
					data : data,
					success : function(result) {

						if (result == 1) {
							replyList();
							$(".replyModal").fadeOut(200);
						} else {
							alert("작성자 본인만 수정할 수 있습니다.");
						}
					},
					error : function() {
						alert("로그인이 필요합니다.")
					}
				});
			}
		});

		$(".modal_cancel").click(function() {
			//$(".replyModal").attr("style", "display:none;");
			$(".replyModal").fadeOut(200);
		});
	</script>

</body>
</html>
