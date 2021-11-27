<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kurenai
  Date: 2021/11/11
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
</head>
<body>
<div style="text-align: center">
    <h3>登录成功！用户信息如下</h3>
    <p>用户ID：${ sessionScope.user.userId }</p>
    <p>用户名：${ sessionScope.user.username }</p>
    <p>密码：${ sessionScope.user.password }</p>
    <p>性别：${ sessionScope.user.sex }</p>
    <p>职业：${ sessionScope.user.profession }</p>
    <p>
        爱好：
        <c:forEach items="${ sessionScope.user.hobbies }" var="hobby">
            ${ hobby }&nbsp;
        </c:forEach>
    </p>
    <p>个人简介：${ sessionScope.user.personalDescription }</p>
</div>
</body>
</html>
