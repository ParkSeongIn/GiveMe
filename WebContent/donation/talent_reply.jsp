<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "service.talentboard.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>재능기부 페이지</title>
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
<script>
    $(document).ready(function(){
        $('#addButton').click(function(){
            if($('#tbtitle').val().length <1) { 
                alert('제목을 입력하세요');
                $('#tbtitle').focus();
            } else if($('#tbhdate').val()=='') {
                alert('날짜를 입력하세요');
                $('#tbhdate').focus();
            } else if($('#tbtime').val()=='') {
                alert('시간을 입력하세요');
                $('#tbtime').focus();
            } else if($('#tbpeoplecnt').val()=='') {
                alert('희망인원을 입력하세요');
                $('#tbpeoplecnt').focus();
            } else if($('#tbarea1').val()=='') {
                alert('주소를 입력하세요');
                $('#tbarea1').focus();
            } else if($('#tbarea2').val()=='') {
                alert('나머지 주소를 입력하세요');
                $('#tbarea2').focus();
            } else if($('#tbcontent').val()=='') {
                alert('내용을 입력하세요');
                $('#tbcontent').focus();
            } else {
                $('#addForm').submit();
            }
        });
    });

</script>
</head>
<%
int tbidx = (Integer)request.getAttribute("tbidx");
%>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar3.jsp"/>
	<div class="container" style="margin-top:80px">
		<div class="panel panel-default">
			<h2>재능기부</h2>
			<div class="panel-body">
			<form id="addForm" action="${ContextPath }/controller/TalentBoardReplyActionServlet.do" method="post">
				<div class="form-horizontal">
				<input type="hidden" id="tbidx" name="tbidx" value="${tbidx}" class="form-control" readonly="readonly" />	
					<%-- 이 양식과 똑같이 하나하나 추가 --%>
					</div>
					
					<div class="form-group" >
						<label class="control-label col-sm-4" for="tbtitle">제목</label>
						<div class="col-sm-4">
							<input type="text" id="tbtitle" name="tbtitle" class="form-control"/>
						</div>
					</div>
					<div class="form-group" >
						<label class="control-label col-sm-4" for="mid">작성자</label>
						<div class="col-sm-4">
							<input type="text" id="mid" name="mid" value="${sessionScope.vo.mid }" class="form-control" readonly="readonly" />
						</div>
					</div>						
					<div class="form-group">
						<label class="control-label col-sm-4" for="midx">회원번호</label>
						<div class="col-sm-4">
							<input type="text" id="midx" name="midx" class="form-control" value="${sessionScope.vo.midx}" readonly="readonly"	/>
						</div>
					</div>
					<div class="col-sm-2"></div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="tbcontent">내용작성</label>
						<div class="col-sm-6">
							<textarea name="tbcontent" id="tbcontent" name="tbcontent" rows="10" cols="80"></textarea>
						</div>
					</div>
					<div class="row" style="margin-top:10px">
						<div class="col-sm-7"></div>
						<div class="col-sm-3">
							<%-- 버튼 입력 자리 --%>
							<input class="btn btn-default" id="addButton" type="button" value="글입력"/>
            				<input class="btn btn-default" type="reset" value="초기화"/>
            				<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/TalentBoardListServlet.do">글목록</a>
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