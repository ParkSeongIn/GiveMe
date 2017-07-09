<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "service.member.MemberVo" %>
<%@ page import = "service.member.MemberServiceImpl" %>  
<%@ page import = "common.Values" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 <%
	MemberVo vo = (MemberVo)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 Content</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.admin{
		height:500px;
}
table{
	    float: right;
   		margin-right: 560px;
}
</style>
</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>

<div id="wrap">
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar5.jsp"/>
	<div class="admin">
		<table>
			
			
			<tr>
				<td> 아이디</td>
				<td>					
					<%=vo.getMid() %>				
				</td>
			</tr>
			
			<tr>
				<td> 비밀번호 </td>
				<td>				
					<%=vo.getMpwd()%>
				</td>
			</tr>			
			
			<tr>
				<td> 이름 </td>
				<td>
					<%=vo.getMname() %>
				</td>
			</tr>
			
			<tr>
				<td> 생년월일 </td>
				<td>
					<%=vo.getMbirth() %>					
				</td>
			</tr>
			
			<tr>
				<td> 핸드폰 번호</td>
				<td>							
					<%=vo.getMphone() %>				
				</td>	
			</tr>
			
			<tr>
				<td> email</td>
				<td>
					<%=vo.getMmail() %>					
				</td>
			</tr>
			
			<tr>
				<td>우편번호</td>
				<td>				
					<%=vo.getMpost()%>				
				</td>
			</tr>
			
			<tr>
				<td>주소1</td>
				<td>					
					<%=vo.getMaddr1() %>
				</td>
			</tr>
			
			<tr>
				<td>주소2</td>	
				<td>					
					<%=vo.getMaddr2() %>
				</td>
			</tr>			
			
			<tr>
				<td>가입날짜</td>	
				<td>					
					<%=vo.getMenter() %>
				</td>
			</tr>
			
			<tr>
				<td>수정날짜</td>	
				<td>					
					<%=vo.getMmdate() %>
				</td>
			</tr>
			
			<tr>
				<td>탈퇴날짜</td>	
				<td>					
					<%=vo.getMbreakdate() %>
				</td>
			</tr>
			
			<tr>
				<td>총 마일리지</td>	
				<td>					
					<%=vo.getMpoint() %>
				</td>
			</tr>
			
				<div>	
	  			<input class="btn btn-default" id="DeleteButton" type="button" value="탈퇴" onclick="de()"/>
	  			<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/MemberModifyServlet.do?midx=<%=vo.getMidx()%>">수정</a>
  				</div>
  		</table>	
	</div>			
	
</div>
<c:import url="/nav/footer.jsp"/>
</body>

</html>