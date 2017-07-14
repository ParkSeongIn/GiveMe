<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ page import ="java.util.*" %>  
 <!-- 조회 결과 내용 출력 페이지 -->
  <!-- 리스트는 url을 타고 넘어오므로 get방식을 사용해야 함 = 서블릿 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8">
<title>CEO 소개</title>
<link rel="stylesheet" href="./css/default.css">
<!--[if lt IE 9]>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
<![endif]-->
</head>
<body>
<header>
	<div class="headerWrap clearfix">
	<h1><a href="#">Give 美<img src=./img/give.png alt="give"></a></h1>
	
		<nav class="gnb">
			<ul>
				<li><a href="#">회사소개</a></li>
				<li><a href="#">제품/서비스</a></li>
				<li><a href="#">인재채용</a></li>
				<li><a href="#">투자정보</a></li>
				<li><a href="#">안내데스크</a></li>
				<li><a href="#">SNS</a></li>
			</ul>
		</nav>
	</div>
</header>
<div class="bodyWrap clearfix">
	<div class="side">
			<h2>회사소개</h2>
		<nav class="lnb">
			<ul>
				<li><a href="#">회사소개</a></li>
				<li class="m"><a href="#">CEO소개</a>	</li>
				<li><a href="#">기사스크랩</a></li>
				<li><a href="#">사업영역</a></li>
				<li><a href="#">계열사정보</a></li>
				<li><a href="#">EST 연혁</a></li>
				<li><a href="#">사회적책임경영</a></li>
				<li><a href="#">CI</a></li>
				<li><a href="#">회사위치</a></li>
			</ul>
		</nav>
			<ul>
				<li><a href="http://blog.estsoft.co.kr/" target="_blank"><img src="./img/banner_1.gif" alt="이스트소프트 Blog 연결 배너 입니다."></a></li>
				<li><a href="https://www.facebook.com/estsoftfb" target="_blank"><img src="./img/banner_2.gif" alt="이스프소프트 Facebook 연결 배너입니다."></a>
				</li>
			</ul>
	</div>
	<main id="main">
		<div class="location">
			<a href="#">홈 ></a>
			<span>회사소개 ></span>
			<span class="ceo">CEO소개</span>
		</div>
		<h3>CEO소개</h3>
		<p class="mainimg1"><img src="./img/mainImg_1.jpg" alt="Emotional Science Technology"></p>
		<div class="con clearfix">
			<div class="greeting"><p>저는 99년 이스트소프트에 입사한 이래 2000년 인터넷 중흥기와 2010년 모바일 시대라는 커다란 사회적 변화를 이 회사와 함께 겪어 왔습니다. 그 과정에서 이스트소프트는 국내를 대표하는 SW기업으로 성장했고, 저 또한 회사 내에서 크고 작은 책임을 맡으며 함께 성장할 수 있었습니다. 그리고 2016년 신임 대표이사로 이스트소프트를 이끌게 되었습니다.</p>
			<p>엔지니어로서 세밀함을 키우고, 사업 기획을 통해서는 과감한 의사결정의 효과를 체감했습니다. 그리고 서비스를 마케팅하는 과정에서 고객과 소통하는 방식을 배우게 되었습니다. 개발, 기획, 마케팅과 같은 비즈니스 활동이 성공과 실패로 귀결되는 반복을 겪으면서 제가 한가지 깨우친 것은, '기본'과 '원칙'을 지켜 나갈 때 비로소 이루어놓은 성과들이 흔들림 없이 유지될 수 있다는 것이었습니다.</p>
			<p>새로운 도약의 출발선에 선 이스트소프트는 변함없이 '기본'과 '원칙'을 바탕으로 경영활동을 이어 나갈 것 입니다. 혁신적인 SW기술과 그간 축적된 서비스적인 노하우를 접목하여 새로운 시장을 '창출'하고, 임직원과 고객이 모두 함께 웃는 사회의 건강한 'Role' 모델이 되겠습니다.</p>

			<p>지켜봐 주십시오.<br>
			감사합니다.</p>
		</div>
		<div class="school">
			<h4>대표약력</h4>
			<ul>
				<li>서울대학교 수학과 졸업</li>
				<li>한양대학교 경영대학원 졸업</li>
				<li>前 ㈜이스트소프트 알툴즈 사업본부장</li>
				<li>前 ㈜줌인터넷 부사장</li>
				<li>現 ㈜이스트소프트 대표이사</li>
			</ul>
			</div>
		</div>
	</main>
</div>
<footer>
	<div class="footerWrap clearfix">
		<div class="logo_footer"><img src="./img/logo_footer.gif" alt="ESTsoft">
		</div>
		<div class="info">
			<address><span>(주)이스트소프트</span> 서울시 서초구 반포대로 3 이스트빌딩 (우)137-867</address>
			<p>대표이사:김장중 사업자등록번호:229-81-03214 통신판매업신고번호:2011-서울서초-1962</p>
			<p class="copy">Copyright (C) by ESTsoft Corp. All rights reserved.</p>
		</div>
			<ul>
				<li><a href="http://blog.estsoft.co.kr/" target="_blank"><img src="./img/btn_blog.gif" alt="이스트소프트 블로그"></a></li>
				<li><a href="https://www.facebook.com/estsoftfb" target="_blank"><img src="./img/btn_facebook.gif" alt="이스트소프트 페이스북"></a></li>
			</ul>
	</div>
</footer>
</body>
</html>