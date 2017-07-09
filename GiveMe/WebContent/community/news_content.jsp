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
.wrap {
height : 550px;
}
.table {
width : 930px;
height : 80px;
margin-bottom : 10px;
text-align : center;
vertical-align : middle;
}
</style>
<%@ include file="/nav/header.jsp" %>
<%@ include file="/nav/sidebar.jsp" %>
<body>
<div class="wrap"> <!-- div로 묶음 -->

<table class="table table-striped table-bordered table-hover ">
<tr>
<td>제목</td><td>작성자</td><td>조회수</td><td>작성날짜</td><td>수정날짜</td>
<td>이미지</td><td>내용</td>
</tr>
<tr>
<td><%=av.getAbtitle() %></td><td><%=av.getAbdbdate() %></td>
<td><%=av.getAbhit() %></td><td><%=av.getAbwdate() %></td><td><%=av.getAbmdate() %></td>
<td><img src="/upload/<%=av.getAbimage() %>"></td><td><%=av.getAbcontent() %></td>
</tr>
</table>
<c:choose>
<c:when test="${sessionScope.vo.mgrade == 'A' }">
	<div>
		<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AllBoardModifyServlet.do?abidx=<%=abidx %>">수정</a> <!--idx 값을 못 불러오니까 getidx였지만 설정을 안해둬서 그냥 idx 값을 불러와서 실행 -->
		<input class="btn btn-default" id="DeleteButton" type="button" value="삭제" onclick="dab()"/>
		<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AllBoardListServlet.do?abtype=N">글목록</a>
	</div>
</c:when>
	<c:otherwise>
		<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/AllBoardListServlet.do?abtype=N">글목록</a>
	</c:otherwise>
</c:choose>
</div>
<%@ include file="/nav/footer.jsp" %>
</body>
</html>