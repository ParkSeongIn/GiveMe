<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="service.allboard.AllBoardVo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	AllBoardVo av = (AllBoardVo)request.getAttribute("av");
	int abidx = (Integer)request.getAttribute("abidx");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기부동향 게시판 게시글 내용</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script>
	function dab(){
		if(confirm("삭제 하시겠습니까?")){
        	location.href="<%=request.getContextPath()%>/controller/AllBoardDeleteServlet.do?abidx=<%=abidx %>";
        	}else{
        		alert("취소 되었습니다.");
        	}
		}
</script>
</head>
<style>
.total_group {
	width:700px;
	float:right;
}
.form-group1, .form-group2, .form-group3, .form-group4, .form-group5, .form-group6 {
	width:300px;
}
.bottom{
	float:right;
}
.bottom1{
	float:left;
}

</style>
<c:import url="/nav/header.jsp" />
<c:import url="/nav/sidebar4.jsp" />
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<div class="container"> <!-- div로 묶음 -->
<h1>기부동향 내용</h1>
	<div class="total_group">
	
		<div class="form-group1">
	         <label for="abtitle">제목</label>
	         <input class="form-control" name="abtitle" id="abtitle" type="text" value="${av.abtitle}" readonly="readonly"/>
	    </div>
		<div class="form-group1">
		     <label for="abid">작성자</label>
		     <input class="form-control" name="abid" id="abid" type="text" value="${av.abid}" readonly="readonly"/>
	    </div>
	    <div class="form-group1">
	         <label for="abhit">조회수</label>
	         <input class="form-control" name="abhit" id="abhit" type="text" value="${av.abhit}" readonly="readonly"/>
	    </div>
	    <div class="form-group1">
	         <label for="abwdate">작성날짜</label>
	         <input class="form-control" name="abwdate" id="abwdate" type="text" value="${av.abwdate}" readonly="readonly"/>
	    </div>
	    <div class="form-group1">
             <label for="abmdate">수정날짜</label>
             <input class="form-control" name="abmdate" id="abmdate" type="text" value="${av.abmdate}" readonly="readonly"/>
        </div>
        <div class="form-group1">
            <label for="abimage">이미지</label>
            <input class="form-control" name="abimage" id="abimage" type="image" value="${av.abimage}" readonly="readonly"/>
        </div>
    	<div class="form-group7">
        	<label for="abcontent">내용 :</label>
        	<textarea name="abcontent" id="abcontent" rows="10" cols="100"  disabled="disabled">${av.abcontent}</textarea>
        </div><br/>
        
	<div class="col-sm-8"></div>
	<div class="col-sm-4">
	
	<c:if test="${sessionScope.vo.mgrade == 'A' }">
	<div>
		<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AllBoardModifyServlet.do?abidx=<%=abidx %>">수정</a>
		<input class="btn btn-default" id="DeleteButton" type="button" value="삭제" onclick="dab()"/>
	</div>
	</c:if><br/>
	<div class="bottom1">
		<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AllBoardListServlet.do?abtype=N">글목록</a>
	</div>
	</div>
	</div>
	
</div>
<c:import url="/nav/footer.jsp" />
</body>
</html>