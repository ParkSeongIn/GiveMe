<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.allboard.AllBoardVo" %>
<%
ArrayList<AllBoardVo> ablist = (ArrayList<AllBoardVo>)request.getAttribute("ablist");
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
 
 <!-- 내용 작성하는 페이지-->
<script>
    $(document).ready(function(){
        $('#addButton').click(function(){
            if($('#abtype').val().length <1) { 
                alert('타입을 입력하세요');
                $('#abtype').focus();
            } else if($('#abtitle').val()=='') {
                alert('제목을 입력하세요');
                $('#abtitle').focus();
            } else if($('#abcontent').val()=='') {
                alert('내용을 입력하세요');
                $('#abcontent').focus();
            } else {
                $('#addForm').submit();
            }
        });
    });
</script>
<style>
div.panel-body{
	padding: 80px;
}
div.panel.panel-default{
	margin-left: 100px;
}
div.bottom.col-sm-4{
    padding-left: 80px;
    padding-top: 20px;
}
h2{
	padding-left: 50px;
}
.form-horizontal .form-group {
    margin-right: -10px;
    margin-left: -12px;
    margin-bottom: -125px;
}
input#abid.form-control{
	margin-bottom: 10px;
}
input#abtitle.form-control{
	margin-bottom: 10px;
}
input#abcontent.form-control{
	margin-bottom: 10px;
}
</style>
<title>공지사항</title>
<link rel="stylesheet" href="../css/font.css" type="text/css">
</head>
<%@ include file="/nav/header.jsp" %>
<%@ include file="/nav/sidebar4.jsp" %>
<body>
<div class="container">
	<div class="panel panel-default">
    <h2>글작성</h2>
    <div class="panel-body">
    <form id="addForm" action="<%=request.getContextPath()%>/controller/AllBoardIfWriteActionServlet.do" method="post">
       	<div class="form-horizontal">
       
       	<div class="form-group">
  			<label class="control-label col-sm-4" for="abid">작성자 : </label>
  			<div class="col-sm-4">
  			<input class="form-control" name="abid" id="abid" type="text" value="${sessionScope.vo.mid}" readonly="readonly"/>
  			</div>
  		</div>
        <input class="form-control" name="abtype" id="abtype" type="hidden" value="I" readonly="readonly"/>
		<div class="form-group" >
            <label class="control-label col-sm-4" for="abtitle">제목 :</label>
            <div class="col-sm-5">
            <input class="form-control" name="abtitle" id="abtitle" type="text"/>
        	</div>
        </div>
       	
       	<div class="form-group">
            <label class="control-label col-sm-4" for="abcontent">내용 :</label>
            <div class="col-sm-5">
            <textarea name="abcontent" id="abcontent" rows="10" cols="80"></textarea>
        	</div>
        </div>
        <div class="row" style="margin-top:10px">
        	<div class="col-sm-8"></div>
        	<div class="bottom col-sm-4">
            <input class="btn btn-default" id="addButton" type="button" value="글입력"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AllBoardIfListServlet.do?abtype=I">글목록</a>
        	</div>
        </div>
    </div>
    </form>
    </div>
    </div>
    </div>
<%@ include file="/nav/footer.jsp" %>
</body>
</html>