<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
<!--script>
$(function() {
  $( "#datepicker1" ).datepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    changeMonth: true,
    changeYear: true,
    yearSuffix: '년'
  });
});
</script -->
<title>재능기부 게시판 글작성</title>
</head>
<body>
<div class="container">
    <h1>재능기부 게시판</h1>
	<form>
        <label>작성자 분류 :</label>
        <input type="radio" name="give" OnClick="window.location.href='AllBoardListServlet.do?abtype=N';">제공자
        <input type="radio" name="give">희망자
    </form>
	<select name="language">
		<option value="영어">영어</option>
		<option value="중국어">중국어</option>
		<option value="일본어">일본어</option>
		<option value="기타">기타</option>
	</select>
    <form id="addForm" action="<%=request.getContextPath()%>/controller/TalentBoardWriteActionServlet.do" method="post" >
        <div class="form-group">
            <label for="tbtitle">제목 :</label>
            <input class="form-control" name="tbtitle" id="tbtitle" type="text"/>
        </div>
        <div class="form-group">
            <label for="tbcategory1">분류1 :</label>
            <input class="form-control" name="tbcategory1" id="tbcategory1" type="text"/>
        </div>
        <div class="form-group">
            <label for="tbcategory2">분류2 :</label>
            <input class="form-control" name="tbcategory2" id="tbcategory2" type="text"/>
        </div>
        <div class="form-group">
            <label for="tbpeople">신청자</label>
            <input class="form-control" name="tbpeople" id="tbpeople" type="text"/>
        </div>
        <div class="form-group">
            <label for="tbhdate">희망 날짜 :</label>
            <input class="form-control" name="tbhdate" id="tbhdate" type="text"/>
        </div>
       	<div class="form-group">
            <label for="tbtime">희망 시간 :</label>
            <input class="form-control" name="tbtime" id="tbtime" type="text"/>
        </div>
		<div class="form-group">
            <label for="tbarea1">희망 지역 선택 : 시/도 </label>
            <input class="form-control" name="tbarea1" id="tbarea1" type="text"/>
        </div>
        <div class="form-group">
            <label for="tbarea2">희망 지역 선택 : 군/구</label>
            <input class="form-control" name="tbarea2" id="tbarea2" type="text"/>
        </div>
       	<div class="form-group">
            <label for="tbcontent">내용 :</label>
            <input class="form-control" name="tbcontent" id="tbcontent" type="text"/>
        </div>
        <div class="form-group">
            <label for="midx">회원번호 :</label>
            <input class="form-control" name="midx" id="midx" type="text"/>
        </div>
        <div class="form-group">
            <label for="tbpeoplecnt">희망 인원 :</label>
            <input class="form-control" name="tbpeoplecnt" id="tbpeoplecnt" type="text"/>
        </div>
        <div>
            <center><input class="btn btn-default" id="addButton" type="button" value="글입력"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/controller/TalentBoardListServlet.do">글목록</a></center>
        </div>
    </form>
</div>
</body>
</html>