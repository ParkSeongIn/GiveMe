<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.allboard.AllBoardVo" %>
<%@ page import = "service.admin.AdminServiceImpl" %>
<%

request.setCharacterEncoding("UTF-8");
int abidx = (Integer)request.getAttribute("abidx");
AllBoardVo av = (AllBoardVo)request.getAttribute("av");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/nav/header.jsp" %>
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
            if($('#abtitle').val().length <1) { 
                alert('제목을 입력하세요');
                $('#abtitle').focus(); 
            } else if($('#abcontent').val()=='') { 
                alert('내용을 입력하세요');
                $('#abcontent').focus();
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
    <h1>기부동향 수정하기(관리자 전용)</h1>
    <form id="ModifyForm" action="<%=request.getContextPath()%>/controller/AllBoardModifyActionServlet.do" method="post">
    <div class="form-group">
		<label for="abidx">글번호 : <%= abidx %></label>
		<input class="form-control" name="abidx" id="abidx" type="hidden" value="<%=abidx %>"/>
    </div>
	<div class="form-group">
		<label for="abtitle">제목 :</label>
		<input class="form-control" name="abtitle" id="abtitle" type="text" value="<%=av.getAbtitle() %>"/>
	</div>
	<div class="form-group">
		<label for="abimage">사진 : <img src="/GiveMe/img/<%=av.getAbimage() %>"> </label>
		<input class="form-control" name="abimage" id="abimage" type="file" value="<%=av.getAbimage() %>"/>
	</div>
	<div class="form-group">
		<label for="abcontent">내용 :</label>
		<input class="form-control" name="abcontent" id="abcontent" type="text" value="<%=av.getAbcontent() %>"/>
	</div>
        <div>
            <center><input class="btn btn-default" id="ModifyButton" type="button" value="수정"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AllBoardListServlet.do?abtype=N">글목록</a></center>
        </div>
    </form>
</div>
<%@ include file="/nav/footer.jsp" %>
</body>
</html>