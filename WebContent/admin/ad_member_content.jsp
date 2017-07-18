<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "service.member.MemberVo" %>
<%@ page import = "service.member.MemberServiceImpl" %>  
<%@ page import = "common.Values" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 <%
 	request.setCharacterEncoding("UTF-8");
	 String diff = "@@"; 
	if(request.getParameter("diff") != null){
		diff = request.getParameter("diff").trim();
	}
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
		
	div.col-sm-4{
		float: left;
    	padding-right: -50px;
   		 margin-left: 15px;	
	}	
	div.input.col-sm-4{
		margin-left:-200px;
		margin-right: 25px;		
	}
	div.birth.col-sm-4{
		margin-left: 12px;
		margin-right: -201px;
		width: 32%;
	}
	div.name.col-sm-4{
		margin-left: 1px;
	    margin-right: -215px;
	    margin-left: 15px;
	}	
	div.title.col-sm-3{
		margin-left: 12px;
		margin-right:-120px;
	}
	div.title.col-sm-5{
		margin-left: 12px;
		margin-right:-120px;
		width:28%
	}	
	select{
		height: 34px;
		width: 70px;
		margin-right: 50px;		
	}
	div.select.col-sm-3{
		margin-right: -155px;
   	 	margin-left: -20px;
   	 	padding-left: 10px;					
	}
	div.content2.col-sm-3{
		margin-left:-10px;
	}
	div.title.col-sm-1{
		margin-left: 12px;
		margin-right: 83px;	
	}
	div.at.col-sm-1{
		padding-left: -20px;
	}
	div.select.col-sm-6{		
		margin-left: -50px;								
	}
	#mmail2{
		width: 150px;
	}
	div.post.col-sm-3{
		margin-left: 12px;
		margin-right: -118px;		
	}
	div.post.col-sm-5{
		padding-left: 137px;			
	}
	div.addr.col-sm-3{
		margin-left: 12px;
		margin-right: -107px;
		width: 24%;
	}
	div.prim1.col-sm-3{
		margin-left: 12px;
		margin-right: -108px;
		width: 24%;
	}
	div.prim2.col-sm-3{
		margin-left: 12px;
		margin-right: -108px;
		width: 24%;
	}
	div.footer.col-sm-5{
		padding-left:160px;
	}
	#mphone{
		overflow: hidden;
		white-space: nowrap;
		text-overflow:clip;
	}
	div.phone {
	display: block;
    width: 100%;
    padding: 6px 12px;
	}
</style>
<script>

window.onload=function(){
	<% if (diff.equals("1")){ %>
	alert("비밀번호를 잘못 입력하셨습니다.");
	<% } %>

	// 비밀번호 미 입력시 알림 기능.
	
	function chkValue(){
	//	alert("ddd");
		if(!document.ModifyForm.mpwd.value){
			alert("비밀번호를 입력하세요.");
			document.ModifyForm.mpwd.focus();
					
		}else{
			ModifyForm.submit();				
		}
		return false;
	}	
	}
	
</script>

</head>
<link rel="stylesheet" href="../css/font.css" type="text/css">
<body>
<c:import url="/nav/header.jsp"/>
<c:import url="/nav/sidebar5.jsp"/>
	<div class="container">
	<div class="col-sm-10">
		<h2>내 정보 수정</h2>
			<br><br><br>
			<div class="body">	
				<div class="col-sm-4">
				<label class="control-label">회원번호</label>
				</div>
				<%=vo.getMidx() %>
				</div>
				<div class="col-sm-4">
					<label class="control-label">아이디</label>					
				</div>
				<div class="input col-sm-4">
					<%=vo.getMid() %>
				</div>
				<br><br>						
				
				<div class="col-sm-4">
					<label  class="control-label">비밀번호</label>	
				</div>	
				<div class="input col-sm-4">	
					<%=vo.getMpwd() %>
				</div>	
				<br><br>				
				
				<div class="name col-sm-4">
					<label  class="control-label">이름</label>	
				</div>	
				<div class="name col-sm-4">	
					<%=vo.getMname() %>
				</div>	
				<br><br>			
				
				<div class="birth col-sm-4">
					<label  class="control-label">생년월일</label>	
				</div>	
				<div class="birth2 col-sm-4">	
					<%=vo.getMbirth() %>
				</div>	
				<br><br>			
				
				<div class="title col-sm-5">
					<label class="control-label">핸드폰번호</label>
				</div>
				<div class="phone">
					
				<div class="content1 col-sm-3">									
					<%=vo.getMphone() %>				
				</div>		
				<div class="content2 col-sm-3">
					<%=vo.getMphone() %>
				</div>
				<br><br>	
				</div>
				
				<div class="title col-sm-3">
					<label class="control-label">이메일</label>
				</div>
				
				<div class="input col-sm-3">						
					<%=vo.getMmail() %>
				</div>
								
					
				<div class="post col-sm-5">
					<%=vo.getMpost()%>
				</div>	
					<br><br>
				
				<div class="addr col-sm-3">
					<label class="control-label">주소</label>
				</div>
				<div class="addr1 col-sm-8">	
					<%=vo.getMaddr1() %>																
				</div>
					<br><br>
			
				<div class="addr col-sm-3">
					<label class="control-label">상세주소</label>
				</div>
				<div class="addr2 col-sm-8">	
					<%=vo.getMaddr2() %>																	
				</div>
					<br><br>
				
				<div class="prim1 col-sm-3">				
					<label> 가입날짜</label>
				</div>
				<div class="col-sm-3">		
					<%=vo.getMenter() %>
				</div>	
				
				<div class="prim1 col-sm-3">				
					<label>수정날짜</label>
				</div>
				<div class="col-sm-3">		
					<%=vo.getMmdate() %>
				</div>
					<br><br>							
				
				<div class="prim2 col-sm-3">
					<label>탈퇴날짜</label>
				</div>	
				<div class="col-sm-3">		
					<%=((vo.getMbreakdate()+" ").replace("null", ""))%>
				</div>						
				
				<div class="prim1 col-sm-3">
					<label>총 마일리지</label>
				</div>
				<div class="col-sm-3">						
					<%=vo.getMpoint() %>
				</div>	
					<br><br><br>
				
				<div class="row" style="margin-top:10px">
					<div class="footer col-sm-7"></div>
					<div class="footer col-sm-5">
						<div>
							<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
	 										회원정보 수정
							</button>
							<a class="btn btn-default" href="<%=request.getContextPath()%>/controller/MemberDeleteActionServlet.do?midx=<%=vo.getMidx()%>">탈퇴</a>	  						
						</div>	
					</div>
				</div>				
			
				<form name="ModifyForm" id="ModifyForm" action="<%=request.getContextPath()%>/controller/MemberModifyServlet.do" method="post">	
				
					<div class="modal fade memberModify" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					        <span aria-hidden="true">&times;</span>
					        </button>
					        <h4 class="modal-title" id="myModalLabel">비밀번호를 입력해주세요.</h4>
					      </div>
					      <div class="modal-body">
					      	 <input class="form-control" type="password" name="mpwd" id="mpwd">
					      </div>
					      <div class="modal-footer">
					        <button type="submit" id="Modifybutton" class="btn btn-default" onclick="chkValue();return false;">입력</button>
					      </div>
					    </div>
					  </div>
					</div>				
  				</form>
				<div>	
	  		</div>
	</div>			
	</div>
</div>
	<br><br>
<c:import url="/nav/footer.jsp"/>
</body>

</html>