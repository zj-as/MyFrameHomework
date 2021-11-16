<%--
  Created by IntelliJ IDEA.
  User: Kurenai
  Date: 2021/10/26
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录成功页面</title>
    <base href="http://localhost:8080/07-SpringMVC/index.jsp"/>
</head>
<body>
<div align="center">
    <h3>${ message }</h3>
    <p>用户名：${ username }</p>
    <p>密码：${password}</p>
    <p><a href="index.jsp">返回登录页面</a></p>
</div>
</body>
</html>
