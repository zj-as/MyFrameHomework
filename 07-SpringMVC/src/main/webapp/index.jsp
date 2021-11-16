<%--
  Created by IntelliJ IDEA.
  User: Kurenai
  Date: 2021/7/17
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>07-SpringMVC</title>
    <script type="text/javascript" src="js/jQuery-3.6.0.js"></script>
    <script type="text/javascript">
        function loginByAjax(form){
            $.post(
                "loginByAjax.do",
                {
                    username:form.username.value,
                    password:form.password.value
                },
                function(data){
                    if (data == "阿沙登录成功") {
                        alert(data);
                        // 创建表单标签
                        const formElement = document.createElement("form");
                        // 将表单添加到body中
                        document.body.appendChild(formElement);
                        formElement.action = "login.do?username=阿沙&password=123456";
                        formElement.method = "post";
                        formElement.submit();
                        // 删除该表单标签
                        document.body.removeChild(formElement);
                    }else {
                        alert(data);
                    }
                },
                "text"
            )
        }
    </script>
</head>
<body>
<div align="center">
    <form action="login.do" method="post">
        <p>用户名：<input name="username" type="text"/></p>
        <p>密码：<input name="password" type="password"/></p>
        <p><input type="submit" value="登录"/></p>
    </form>
    <br/>
    <form>
        <p>用户名：<input name="username" type="text"/></p>
        <p>密码：<input name="password" type="password"/></p>
        <p><input type="button" value="登录" onclick="loginByAjax(this.form)"/></p>
    </form>
</div>
</body>
</html>
