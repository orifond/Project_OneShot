<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<h3>카테고리</h3>
<div class="categories"></div>
<!-- <ul>
	<li><a href="/shop/list?c=100&l=1">가전</a>
		<ul class="low">
			<li><a href="/shop/list?c=101&l=2">세탁기</a></li>
			<li><a href="/shop/list?c=102&l=2">건조기</a></li>
		</ul>
	</li>
	
	<li><a href="/shop/list?c=200&l=1">가구</a>
		<ul class="low">
			<li><a href="/shop/list?c=201&l=2">소파</a></li>
			<li><a href="/shop/list?c=202&l=2">침대</a></li>
		</ul>
	</li>
	
	<li><a href="">생필품</a></li>
	<li><a href="">생활</a></li>
</ul> -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(
			function(e) {
				$.ajax({
					type : 'GET',
					url : '/shop/categories',
					success : function(result) { //result
						var html = "<ul>";
						for (var i = 0; i < result.length; i++) {
							if (result[i].level == '1') {
								html += "<li>"
								html += "<a href='/shop/list?c="
										+ result[i].cateCode + "&l="
										+ result[i].level + "'>"
								html += result[i].cateName + "</a>"
								html += "</li>";
							}
						}
						html += "</ul>";
						$('.categories').append(html);
					},
					error : function(e) {
						console.log('ERROR : ', e);
					}
				});
			});
</script>