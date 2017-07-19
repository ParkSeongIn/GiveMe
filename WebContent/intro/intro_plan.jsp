<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import ="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기획의도</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<style>
#purpose{
	padding-top: 180px;
	width: 490px;
}
div.col-sm-5{
	padding-top: 50px;
}
div.col-sm-8{
    margin-left: 180px;
    padding-bottom: 100px;
}
</style>
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar1.jsp"/>
<div class="container">
	<div class="col-sm-5">
	<span class="glyphicon glyphicon-edit" style="font-size:40px;"></span><font style="font-size:30px;">Give Me 기획의도</font>
	<h3>1. 기부의 통합화</h3>
	<p align="justify">구체적으로 말하면 현금 기부 언론기관의 비중은 줄고, 대상자 직접 기부나 모금 단체를 통한 기부가 상승하는 등
	개인 기부 방식에 있어 변화가 나타나고 있음을 알 수 있습니다. 
	현물 기부의 경우 종교 단체의 비중은 급감하고 모금 단체를 통한 기부가 큰 폭으로 증가하는 추세입니다.
	개인 기부에 있어 추세를 보면 전세계 140여개국의 나눔 수준 조사 결과에 따르면, 평균 기부 참여율은 31.4%(2015년 기준)
	로 최근 3년간 전세계적으로 증가하는 양상을 보임. 특히 한국은 조사 대상 국가 중 유일하게 기부 참여 수준이 꾸준하게
	증가하고 있음을 알수 있습니다.</p>
	
  <h3>2. 기부로 인한 혜택 제공</h3>
   <p align="justify">현재 기부를 통해 얻는 혜택으로는 "소득 공제"가 있습니다.
   카드 사용 또는 쇼핑몰 구매 후 특징은 사용 금액의 일부가 포인트로 적립되고 이를 다시 추후에 사용할 수 있습니다.
   즉, 이용자가 단순히 돈을 지불하는 개념에서 벗어나 일거양득할 수 있다는 장점이 있습니다.
   이러한 생각을 기부에도 적용하면 어떨까? 생각해 보았습니다.
   예전에는 기부에 대한 인식은 돈 있는 사람이 돈 없는 사람에게 베푼다는 인식이 강했지만
   기부 추세를 보면 앞에서 언급한 점도 특징도 있지만 또 다른 특징으로 현재 기부 추세는 소득 수준과 반드시 비례하지 않는다는 것을 알 수 있습니다.
   즉, 기부는 사명감에서 자기만족으로 변화하고 있다고 볼 수 있습니다.
   이러한 변화에 발 맞춰 일방적인 기부가 아니라 상호에게 도움이 되는 기부 문화를 만드는 게 필요하다고 생각했고 
   그에 대한 대안으로 기부 금액의 몇 %를 마일리지로 변환하는 방식을 적용해 보았습니다.</p> 
  </div>
  
  <div class="col-sm-8">
	<h3>3. 기부함에 있어 투명성 강조.</h3>
   	<p align="justify">기부는 기관에 대한 신뢰성이 가장 큰 비중을 차지합니다.
   	즉, 기부를 담당하는 기관에 대한 신뢰 부족을 극복하는 것이 가장 큰 과제입니다.</p>
	
	<h3>4. 기부 결정 요인</h3>
    <p align="justify">기관에 대한 신뢰성이 가장 큰 비중을 차지하고 이는 기부자들이 더 능동적인 태도를 지니게 되었다는 점을 의미합니다. 
    기부에 불참하는 원인으로 대부분의 사람들이 "경제적 여유 부족"을 들고 있습니다.
    기부에 대한 관심이나 기부 방법 인지에 있어서는 사람들의 정보가 늘어나고 있으나, 기관에 대한 신뢰 부족 및
    기부 요청의 부재로 인해 기부에 불참하는 원인은 증가하는 추세입니다.</p>
	</div>
	<img id="purpose" src="../image/helping.jpg" alt="후원이미지">
</div>
<c:import url="/nav/footer.jsp"/>

</body>
</html>