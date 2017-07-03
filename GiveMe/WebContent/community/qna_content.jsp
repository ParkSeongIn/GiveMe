<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.question.*" %>
<% 
	QuestionVo qv = (QuestionVo) request.getAttribute("qv");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA Content</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" ></script>
</head>
<body>
<div class="container">
	<div class="form-group">
		<h1>1:1문의 상세내용</h1>
	</div>
	<div class="form-group">
    	<label for="qidx">qidx :</label>
		<input class="form-control" name="qidx" id="qidx" type="text" value="<%=qv.getQidx() %>" readonly="readonly"/>
	</div> 
	<div class="form-group">
    	<label for="qtitle">qtitle :</label>
		<input class="form-control" name="qtitle" id="qtitle" type="text" value="<%=qv.getQtitle() %>" readonly="readonly"/>
	</div> 
	<div class="form-group">
	    <label for="midx">midx :</label>
	    <input class="form-control" name="midx" id="midx" type="text" value="<%=qv.getMidx() %>" readonly="readonly""/>
	</div>
	<div class="form-group">
	    <label for="qcategory">qcategory :</label>
	    <input class="form-control" name="qcategory" id="qcategory" type="text" value="<%=qv.getQcategory() %>" readonly="readonly"/>
	</div>
	<div class="form-group">
	    <label for="qwdate">qwdate :</label>
	    <input class="form-control" name="qwdate" id="qwdate" type="text" value="<%=qv.getQwdate() %>" readonly="readonly"/>
	</div>
	<div class="form-group">
	    <label for="qcontent">qcontent :</label>
	    <input class="form-control" name="qcontent" id="qcontent" type="text" value="<%=qv.getQcontent() %>" readonly="readonly"/>
	 </div>
	<div>
	 	<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/question/QuestionListServlet.do">글목록</a>
	</div>        
</div>
</body>
</html>