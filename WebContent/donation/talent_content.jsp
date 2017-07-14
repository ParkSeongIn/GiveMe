<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="service.talentboard.TalentBoardVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("UTF-8");
TalentBoardVo tvo = (TalentBoardVo)request.getAttribute("tvo");
int tbidx = (Integer)request.getAttribute("tbidx");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재능기부 내용</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
</head>
<script>
	function dtb(){
		if(confirm("삭제 하시겠습니까?")){
        	location.href="<%=request.getContextPath()%>/controller/TalentBoardDeleteServlet.do?tbidx=<%=tbidx %>";
        	}else{
        		alert("취소 되었습니다.");
        	}
		}
</script>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar3.jsp"/>
<div class="container">
	<h1>재능기부 내용</h1>
	<div class="total_group">
	
		<c:if test="${tvo.tbpeople == '질문'}">
		<div class="form-group1">
            <label for="tbpeople">작성자 분류(제공자/희망자)</label>
            <input class="form-control" name="tbpeople" id="tbpeople" type="text" value="${tvo.tbpeople}" disabled="disabled"/>
        </div><br/>
        <div class="form-group3">
	    		<label for="tbtitle">제목 </label>
	    		<input class="form-control" name="tbtitle" id="tbtitle" type="text" value="${tvo.tbcategory2}" disabled="disabled"/>
		</div>
		 <div class="form-group7">
        	<label for="tbcontent">내용 :</label>
        	<textarea name="tbcontent" id="tbcontent" rows="10" cols="100"  disabled="disabled">${tvo.tbarea2}</textarea>
        </div>
        <br/>
        </c:if>
        
        <c:if test="${tvo.tbpeople == '질문' && sessionScope.vo.login == true}">
        <div class="bottom">
            <a class="btn btn-default" href="${ContextPath }/controller/TalentBoardReplyModifyServlet.do?tbidx=${tvo.tbidx}">수정</a>
			<a class="btn btn-default" href="${ContextPath }/controller/TalentBoardReplyServlet.do?tbidx=${tvo.tbidx}">질문하기</a>
            <input class="btn btn-default" id="DeleteButton" type="button" value="삭제" onclick="dtb()"/>
        </div>
		</c:if>
		
		<c:if test="${tvo.tbpeople != '질문'}">
        <div class="form-group1">
            <label for="tbpeople">작성자 분류(제공자/희망자)</label>
            <input class="form-control" name="tbpeople" id="tbpeople" type="text" value="${tvo.tbpeople}" disabled="disabled"/>
        </div><br/>
	        
        <div class="form-group2">
            <label for="tbcategory1">카테고리 :</label>
            <input class="form-control" name="tbcategory1" id="tbcategory1" type="text" value="${tvo.tbcategory1}" disabled="disabled"/>
        </div><br/>
        
       	<div class="form-group3">
    		<label for="tbtitle">제목 </label>
    		<input class="form-control" name="tbtitle" id="tbtitle" type="text" value="${tvo.tbcategory2}" disabled="disabled"/>
		</div>
		
		<div class="form-group3">
    		<label for="tbhdate">희망날짜</label>
    		<input class="form-control" name="tbhdate" id="tbhdate" type="text" value="${tvo.tbtitle}" disabled="disabled"/>
		</div>
		
		<div class="form-group4">
    		<label for="tbtime">희망시간</label>
    		<input class="form-control" name="tbtime" id="tbtime" type="text" value="${tvo.tbhdate}" disabled="disabled"/>
		</div>
		
		<div class="form-group5">
    		<label for="tbarea1">희망지역</label>
    		<input class="form-control" name="tbarea1" id="tbarea1" type="text" value="${tvo.tbtime}" disabled="disabled"/>
		</div>

		<div class="form-group6">
    		<label for="tbpeoplecnt">희망인원</label>
    		<input class="form-control" name="tbpeoplecnt" id="tbpeoplecnt" type="text" value="${tvo.tbarea1}" disabled="disabled"/>
		</div>
		<br/>
        
        <div class="form-group7">
        	<label for="tbcontent">내용 :</label>
        	<textarea name="tbcontent" id="tbcontent" rows="10" cols="100"  disabled="disabled">${tvo.tbarea2}</textarea>
        </div>
        <br/>
        </c:if>
        
        <c:if test="${tvo.tbpeople != '질문' && sessionScope.vo.login == true }">
        <div>
        	<a class="btn btn-default" href="${ContextPath }/controller/TalentBoardStateServlet.do?tbidx=${tvo.tbidx}">신청하기</a>
        	<a class="btn btn-default" href="${ContextPath }/controller/TalentBoardReplyServlet.do?tbidx=${tvo.tbidx}">질문하기</a>
        </div><br/>
        
        <div class="bottom">
            <a class="btn btn-default" href="${ContextPath }/controller/TalentBoardModifyServlet.do?tbidx=${tvo.tbidx}">수정</a>
            <input class="btn btn-default" id="DeleteButton" type="button" value="삭제" onclick="dtb()"/>
        </div>
        </c:if>
        
        <div class="bottom1">
        <a class="btn btn-default" href="${ContextPath }/controller/TalentBoardListServlet.do">글목록</a>
        </div>
        </div>
        
 </div>
 <c:import url="/nav/footer.jsp"/>
</body>
</html>
