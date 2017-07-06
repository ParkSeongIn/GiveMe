<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.talentboard.TalentBoardVo" %>
<%

request.setCharacterEncoding("UTF-8");
int tbidx = (Integer)request.getAttribute("tbidx");
TalentBoardVo tv = (TalentBoardVo)request.getAttribute("tv");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
        $('#ModifyButton').click(function(){ 
        	if($('#tbpeople').val().length <1) { 
                alert('분류를 선택하세요');
                $('#tbpeople').focus(); 
            } else if($('#tbcategory1').val().length <1) { 
                alert('카테고리를 선택하세요');
                $('#tbcategory1').focus(); 
            } else if($('#tbcategory2').val().length <1) { 
                alert('상세 카테고리를 선택하세요');
                $('#tbcategory2').focus(); 
            } else if($('#tbtitle').val().length <1) { 
                alert('제목을 입력하세요');
                $('#tbtitle').focus(); 
            } else if($('#tbhdate').val()=='') { 
                alert('희망 날짜를 입력하세요');
                $('#tbhdate').focus();
            } else if($('#tbtime').val()=='') { 
                alert('희망 시간를 입력하세요');
                $('#tbtime').focus();
            } else if($('#tbpeoplecnt').val()=='') { 
                alert('희망 인원을 입력해 주세요.');
                $('#tbpeoplecnt').focus();
            } else if($('#tbarea1').val()=='') { 
                alert('희망 지역를 입력하세요');
                $('#tbarea1').focus();
            } else if($('#tbarea2').val()=='') { 
                alert('희망 날짜를 입력하세요');
                $('#tbarea2').focus();
            } else if($('#tbcontent').val()=='') { 
                alert('내용을 입력하세요');
                $('#tbcontent').focus();
            } else {
                $('#ModifyForm').submit();
            }
        });
    });
</script>
<title>기부동향</title>
</head>
<body>
<div class="container">
    <h1>재능기부 수정</h1>
    <form id="ModifyForm" action="<%=request.getContextPath()%>/controller/TalentBoardModifyActionServlet.do" method="post">
    <div class="form-group">
		<label for="tbidx">글번호 : <%= tbidx %></label>
		<input class="form-control" name="tbidx" id="tbidx" type="hidden" value="<%=tbidx %>"/>
    </div>
	<div class="form-group">
		<label for="tbpeople">작성자 분류 :</label>
		<input class="form-control" name="tbpeople" id="tbpeople" type="text" value="<%=tv.getTbpeople() %>"/>
	</div>
	<div class="form-group">
		<label for="tbcategory1">분류1 :</label>
		<input class="form-control" name="tbcategory1" id="tbcategory1" type="text" value="<%=tv.getTbcategory1() %>"/>
	</div>    
	<div class="form-group">
		<label for="tbcategory2">분류2 :</label>
		<input class="form-control" name="tbcategory2" id="tbcategory2" type="text" value="<%=tv.getTbcategory2() %>"/>
	</div>
	<div class="form-group">
		<label for="tbtitle">제목 :</label>
		<input class="form-control" name="tbtitle" id="tbtitle" type="text" value="<%=tv.getTbtitle() %>"/>
	</div>
	<div class="form-group">
		<label for="tbhdate">희망 날짜 :</label>
		<input class="form-control" name="tbhdate" id="tbhdate" type="text" value="<%=tv.getTbhdate() %>"/>
	</div>
	<div class="form-group">
		<label for="tbtime">희망 시간 :</label>
		<input class="form-control" name="tbtime" id="tbtime" type="text" value="<%=tv.getTbtime() %>"/>
	</div>
	<div class="form-group">
		<label for="tbpeoplecnt">희망 인원 :</label>
		<input class="form-control" name="tbpeoplecnt" id="tbpeoplecnt" type="text" value="<%=tv.getTbpeoplecnt() %>"/>
	</div>
	<div class="form-group">
		<label for="tbarea1">지역1 :</label>
		<input class="form-control" name="tbarea1" id="tbarea1" type="text" value="<%=tv.getTbarea1() %>"/>
	</div>
	<div class="form-group">
		<label for="tbarea2">지역2 :</label>
		<input class="form-control" name="tbarea2" id="tbarea2" type="text" value="<%=tv.getTbarea2() %>"/>
	</div>
    <div class="form-group">
		<label for="tbfile">파일 첨부 :</label>
		<input class="form-control" name="tbfile" id="tbfile" type="text" value="<%=tv.getTbfile() %>"/>
	</div>
	<div class="form-group">
		<label for="tbcontent">내용 :</label>
		<input class="form-control" name="tbcontent" id="tbcontent" type="text" value="<%=tv.getTbcontent() %>"/>
	</div>
        <div>
            <center><input class="btn btn-default" id="ModifyButton" type="button" value="수정"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/controller/TalentBoardListServlet.do">글목록</a></center>
        </div>
    </form>
</div>
</body>
</html>