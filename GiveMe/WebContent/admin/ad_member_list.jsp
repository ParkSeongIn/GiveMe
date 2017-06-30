<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.util.*" %>
<%@ page import = "service.member.MemberVo" %>
<%@ page import = "service.admin.AdminServiceImpl" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보(관리자용)</title>
</head>
<body>
	<div class = "adminlist">
<%
ArrayList<MemberVo> list = (ArrayList<MemberVo>)request.getAttribute("list");
%>
		
		<table>
			<tr>
				<td>회원번호</td><td>이름</td><td>아이디</td><td>이메일</td><td>회원가입날짜</td><td>회원상태</td>
			</tr>
			<%for(MemberVo vo : list) {%>
			<tr>
				<td><%=vo.getMidx()%></td>
				<td>
					<a href="<%=request.getContextPath()%>/controller.member/MemberContentServlet.do?midx=<%=vo.getMidx() %>"><%=vo.getMname()%></a>
				</td>
				<td><%=vo.getMid()%></td>
				<td><%=vo.getMmail() %></td>
				<td><%=vo.getMenter() %></td>
				<td><%=vo.getMvalue() %></td>			
			</tr>
			<%} %>		
		</table>	
	</div>

</body>
</html>