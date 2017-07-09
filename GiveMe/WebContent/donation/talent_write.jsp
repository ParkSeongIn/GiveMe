<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>현금기부 페이지</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
div.panel-body{
	padding: 30px;
}
div.panel.panel-default{
	margin-left: 100px;
}
h2{
	padding-left: 50px;
}
select{
	width :200px; /* 원하는 너비설정 */ 
	padding: .8em .5em; /* 여백으로 높이 설정 */ 
	font-family: inherit; /* 폰트 상속 */ 
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; 
	border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none; 
}
select::-ms-expand { /* for IE 11 */
    display: none;
}
</style>
</head>
<body>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar3.jsp"/>
	<div class="container" style="margin-top:80px">
		<div class="panel panel-default">
			<h2>현금기부</h2>
			<div class="panel-body">
			<form id="addForm" action="#" method="post">
				<div class="form-horizontal">
					<%-- 이 양식과 똑같이 하나하나 추가 --%>
					<div class="col-sm-10">
					<label class="radio-inline"><input type="radio" name="">Option 1</label>
					<label class="radio-inline"><input type="radio" name="">Option 2</label>
					</div>
					<div class="col-sm-10">
						<select id="" name="">
							<option value=""></option>
						</select>
					</div>
					<div class="form-group" >
						<label class="control-label col-sm-4" for="cway">제목</label>
						<div class="col-sm-4">
							<input type="text" id="cway" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="">날짜선택</label>
						<div class="col-sm-4">
							<input type="text" id="" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="">희망시간입력</label>
						<div class="col-sm-3">
							<input type="text" id="" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="">희망인원입력</label>
						<div class="col-sm-3">
							<input type="text" id="" class="form-control"/>
						</div>
					</div>
					<label class="control-label col-sm-4" for="">지역선택</label>
					<div class="col-sm-3">
							<select id="" name="">
								<option value=""></option>
							</select>
					</div>
					<div class="col-sm-3">
							<select id="" name="">
								<option value=""></option>
							</select>
					</div>
					<div class="col-sm-2"></div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="">내용작성</label>
						<div class="col-sm-6">
							<textarea name="" id="" rows="10" cols="80"></textarea>
						</div>
					</div>
					<div class="row" style="margin-top:10px">
						<div class="col-sm-7"></div>
						<div class="col-sm-3">
							<%-- 버튼 입력 자리 --%>
						</div>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
<c:import url="/nav/footer.jsp"/>	
</body>
</html>