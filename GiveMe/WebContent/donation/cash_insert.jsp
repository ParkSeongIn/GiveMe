<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.*" %>
<%@ page import ="service.cashdonation.*" %>
<% 
	CashDonationVo cv = (CashDonationVo)request.getAttribute("cv");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ŀ��ϱ�</title>
<!-- bootstrap�� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery�� ����ϱ����� CDN�ּ� -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript�ҽ��� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script>
    $(document).ready(function(){
    //    alert('jquery test');
    /* �Է��� ��ȿ�� ���� �䱸����
        1. ��� ���� ���� �Ǵ� "" ���ڴ� �ԷµǸ� �ȵȴ�.
        2. ��й�ȣ�� 4���̻� �Է��Ͽ��� �Ѵ�.
    */
        $('#addButton').click(function(){
            if($('#cway').val().length <1) {
                alert('�Է��ϼ���');
                $('#cway').focus();
            } else if($('#cmoney').val()=='') {
                alert('�Է��ϼ���');
                $('#cmoney').focus();
            } else if($('#creceipt').val()=='') {
                alert('�Է��ϼ���');
                $('#creceipt').focus();
            } else if($('#cpaydate1').val()=='') {
                alert('�Է��ϼ���');
                $('#cpaydate1').focus();
            } else if($('#cpaydate2').val()=='') {
                alert('�Է��ϼ���');
                $('#cpaydate2').focus();
            } else if($('#cstate').val()=='') {
                alert('�Է��ϼ���');
                $('#cstate').focus();
            } else if($('#cpoint').val()=='') {
                alert('�Է��ϼ���');
                $('#cpoint').focus();
            } else if($('#cdbdate').val()=='') {
                alert('�Է��ϼ���');
                $('#cdbdate').focus();
            } else if($('#midx').val()=='') {
                alert('�Է��ϼ���');
                $('#midx').focus();
            } else if($('#dlidx').val()=='') {
                alert('�Է��ϼ���');
                $('#dlidx').focus();
            } else if($('#cpay').val()=='') {
                alert('�Է��ϼ���');
                $('#cpay').focus();
            } else if($('#capst').val()=='') {
                alert('�Է��ϼ���');
                $('#capst').focus();
            }else {
                $('#addForm').submit();
            }
        });
    });
</script>
<title>(��2 ���)</title>
</head>
<body>
<div style="width:800px;margin:0 auto;margin-top:100px;">

<h1>���ݱ�� �Ŀ��ϱ�</h1>
    <form id="addForm" action="<%=request.getContextPath()%>/controller/CashDonationInsertServlet.do" method="post">
    	<div class="form-group">
    		<label for="midx">ȸ����ȣ</label>
			<input class="form-control" name="midx" id="midx" type="text" value="<%=cv.getMidx() %>" readonly="readonly"/>
		</div> 
        <div class="form-group">
            <label for="cway">���ݱ�� ���</label>
            <input class="form-control" name="cway" id="cway" type="text" autocomplete="off"/>
        </div>
        <div class="form-group">
            <label for="cmoney">���ݱ�� �ݾ�</label>
            <input class="form-control" name="cmoney" id="cmoney" type="text" autocomplete="off"/>
        </div>
         <div class="form-group">
            <label for="cpaydate1">�����Ŀ� �����</label>
            <input class="form-control" name="cpaydate1" id="cpaydate1" type="text" autocomplete="off"/>
        </div>
        <div class="form-group">
            <label for="cstate">���ݱ�� ����</label>
            <input class="form-control" name="cstate" id="cstate" type="text" autocomplete="off"/>
        </div>
        <div class="form-group">
            <label for="cpoint">���ݱ�� ���ϸ���</label>
            <input class="form-control" name="cpoint" id="cpoint" type="text" autocomplete="off"/>
        </div>

		<div class="form-group">
    		<label for="dlidx">���ó ��ȣ</label>
			<input class="form-control" name="dlidx" id="dlidx" type="text" value="<%=cv.getDlidx() %>" readonly="readonly"/>
		</div>
        <div class="form-group">
            <label for="cpay">���ݱ�� �������</label>
            <input class="form-control" name="cpay" id="cpay" type="text" autocomplete="off"/>
        </div>
        <div class="form-group">
            <label for="capst">���ݱ�� ���� ����</label>
            <input class="form-control" name="capst" id="capst" type="text" autocomplete="off"/>
        </div>
        <div class="form-group">
            <label for="creceipt">���ݱ�� ������</label>
            <input class="form-control" name="creceipt" id="creceipt" type="text" autocomplete="off"/>
        </div>
        <div>
            <input class="btn btn-default" id="addButton" type="button" value="���Է�"/>
            <input class="btn btn-default" type="reset" value="�ʱ�ȭ"/>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/controller/cashdonation/CashDonationListServlet.do">�۸��</a>
        </div>
    </form>



<!--<form>
<h1>�Ŀ��ϱ�</h1> 
<p>1. ��ι��</p>
<p><input type="radio" name="cway" value="P"> �����Ŀ�
	<input type="radio" name="cway" value="D"> �Ͻ��Ŀ� </p>
	
<p>2. ��αݾ�</p>
<p><input type="radio" name="cmoney" value="P"> 
<select name="cpaydate1">
    <option value="">��αݾ� ����</option>
    <option value="one">�� 1����</option>
    <option value="five">�� 5����</option>
    <option value="ten">�� 10����</option>
</select>
	<input type="radio" name="cway" value="D">  
	<label for="sex">���� �Է�</label>
	<input class="form-control" name="cmoney" id="cmoney" type="text" autocomplete="off"/></p>

<p>3. �Ŀ�ó</p>

<p>4. ���� ���</p>
<p><input type="radio" name="cpay" value="C">�ſ�ī��
	<input type="radio" name="cpay" value="H">�ڵ��� ���� 
	<input type="radio" name="cpay" value="A">������ü
<select name="cpaydate">
    <option value="">����� ����</option>
    <option value="ten">10��</option>
    <option value="twenty">20��</option>
    <option value="thirty">30��</option>
</select>
</p>

<p>5. ������ �߱�</p>
<p><input type="radio" name="creceipt" value="Y">��
	<input type="radio" name="creceipt" value="N">�ƴϿ�</p>

<a class="btn btn-default" href="<%=request.getContextPath()%>/donation/cash_confirm.jsp">����</a>
<a class="btn btn-default" href="<%=request.getContextPath()%>/main.jsp">���</a>
</form>  -->

</div>
</body>
</html>