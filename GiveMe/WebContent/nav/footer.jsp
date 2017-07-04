<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link rel="stylesheet" href="../css/footer.css" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>footer</title>
</head>
<body>
	<footer>
			<div>
				<div>
					<h3>소개</h3>
					<ul>
						<li><a href="#" target="_self">기획의도</a></li>
						<li><a href="#" target="_self">사업안내</a></li>
						<li><a href="#" target="_self">공지사항</a></li>
					</ul>
				</div>
				<div>
					<h3>사업내용</h3>		
					<ul>
						<li><a href="#" target="_self">현금기부</a></li>
						<li><a href="#" target="_self">재능기부</a></li>	
					</ul>
				</div>
				<div>
					<h3>후원하기</h3>		
					<ul>
						<li><a href="#" target="_self">현금기부</a></li>
						<li><a href="#" target="_self">재능기부</a></li>
					</ul>
				</div>
				<div>
					<h3>커뮤니티</h3>		
					<ul>
						<li><a href="#" target="_self">기부동향</a></li>
						<li><a href="#" target="_self">FAQ/1:1문의</a></li>
						<li><a href="#" target="_self">기부처검색</a></li>
					</ul>
				</div>
			</div>
			<div class='info'>
			<p>(주)이스트소프트 서울시 서초구 반포대로 3 이스트빌딩 (우)06711</p>
			<p>대표이사:김장중 사업자등록번호:229-81-03214 통신판매업신고번호:2011-서울서초-1962</p>
			
			<p>Copyright (C) CDI. All rights reserved.</p>
			
			</div>
			<div class='footerIcon' onmouseover='iconSubOn()' onmouseout='iconSubOff()'>
				<img class='img1' src='https://d30y9cdsu7xlg0.cloudfront.net/png/29964-200.png' alt='기부 아이콘1'>
			
				<div id='iconSub' class='iconSub'>
					<div>
						현금기부
					</div>
					<div>
						재능기부
					</div>
				</div>
			</div>
	</footer>
	
	<script>
			var iconSub = document.getElementById('iconSub');
			function iconSubOn(){
				iconSub.style.display = 'block';
			}
			function iconSubOff(){
				iconSub.style.display = 'none';
			}
	</script>
	
</body>
</html>