<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ּ� �˻�</title>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function(data) {
            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ��Դϴ�.
            // ������ �����Ͽ� �پ��� Ȱ����� Ȯ���� ������.
        }
    }).open();
</script>

</head>
<body>

</body>
</html>