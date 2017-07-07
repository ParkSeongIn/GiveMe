<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="service.talentboard.TalentBoardVo" %>
<%
	request.setCharacterEncoding("UTF-8");
	TalentBoardVo tvo = (TalentBoardVo)request.getAttribute("tvo");
	int tbidx = (Integer)request.getAttribute("tbidx");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재능기부 내용</title>
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
	function tbe(){
		if(confirm("승인 하시겠습니까?")){
        	location.href="<%=request.getContextPath()%>/controller/TalentBoardEtimeServlet.do?tbidx=<%=tbidx %>";
        	alert("완료 되었습니다.");
        	}else{
        		alert("취소 되었습니다.");
        	}
		}
</script>
</head>
<%@ include file="/nav/header.jsp" %>
<%@ include file="/nav/sidebar4.jsp" %>
<body>
<div class="container"> <!-- div로 묶음 -->

<table class="table table-striped table-bordered table-hover ">
<tr>
<td>제공자 : <%=tvo.getTbpeople() %></td><td>희망자 : <%=tvo.getTbpeople() %></td>
</tr>
<tr>
<td>전화번호 : <%=tvo.getTbcategory2() %> </td><td>전화 : <%=tvo.getTbcategory2() %> </td>
</tr>
<tr>
<td>메일 : <%=tvo.getTbtitle() %></td><td>메일 : <%=tvo.getTbhdate() %></td>
</tr>
<tr>
<td>분야1 : <%=tvo.getTbcategory1() %></td><td></td>
</tr>
<tr>
<td>내용 : <%=tvo.getTbarea2() %></td>
</tr>
</table>
	<div>
		<center><input class="btn btn-default" id="EtimeButton" type="button" value="승인" onclick="tbe()"/></center>
		<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/TalentBoardAdListServlet.do">글목록</a>
	</div>
</div>
<%@ include file="/nav/footer.jsp" %>
</body>
</html>