<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="entity.User" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ taglib prefix="fm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    <title>登录页面</title>
    <base href="http://localhost:8080/11_SSM/">
    <script type="text/javascript" src="js/jQuery-3.6.0.js"></script>
    <script type="text/javascript">
        function userLogin(form){
            $.post({
                url:"login",
                data:"username=" + form.username.value + "&password=" + form.password.value,
                traditional:true, // 使用传统的方式来序列化数据
                success:function(data){
                    if (data.code == "200") {
                        let a = document.createElement("a");
                        a.href = "index";
                        a.click();
                    } else {
                        alert(data.message);
                    }
                },
                dataType:"json"
            })
        };

        function registerUser(form) {
            let username = form.username.value;
            let password = form.password.value;
            let confirmPassword = form.confirmPassword.value;

            if (username.length > 0) {
                if (password != confirmPassword) {
                    alert("两次密码输入不一致");
                }else {
                    // 将列表（爱好）的值变为字符串进行存储
                    let hobby = "";
                    for(let i = 0; i < form.hobby.length; i++){
                        if(form.hobby[i].checked) {
                            hobby = hobby + form.hobby[i].value + "_";
                        }
                    }
                    hobby = hobby.substring(0, hobby.length-1);

                    $.post(
                        "register",
                        {
                            username: form.username.value,
                            password: form.password.value,
                            sex: form.sex.value,
                            profession: form.profession.value,
                            hobby: hobby,
                            personalDescription: form.personalDescription.value
                        },
                        function (data) {
                            alert(data.message);
                        },
                        "json"
                    )
                }
            }else {
                alert("用户名不能为空");
            }
        }
    </script>
    <style>
        #main{
            position: relative;
            text-align: center;
        }
        #area_login{
            position: absolute;
            top: 50px;
            left: 20%;
        }
        #area_register{
            position: absolute;
            top: 50px;
            left: 52%;
        }
        table, tr, td{
            border:1px solid #035000;
            border-spacing: 0; /* 去掉单元格间的间隔 */
        }
        tr, td{
            width: 200px;
            height: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
<div id="main">
    <a href="changeLocale?locale=zh_CH">中文</a>
    <a href="changeLocale?locale=en_US">English</a>
    <%
        if (request.getAttribute("user") == null) {
            User user = new User();
            request.setAttribute("user", user);
        }

        /*
         * 以下操作是对选项框中的内容进行国际化
         */
        Locale locale = null;
        if (session.getAttribute("locale") != null) {
            if (session.getAttribute("locale").equals("zh_CH")) {
                locale = Locale.CHINA;
            } else if (session.getAttribute("locale").equals("en_US")) {
                locale = Locale.US;
            } else {
                locale = Locale.getDefault();
            }
        } else {
            locale = Locale.getDefault();
        }
        ResourceBundle i18n = ResourceBundle.getBundle("i18n", locale);
    %>

    <div id="area_login">
        <%--@elvariable id="user" type="entity.User"--%>
        <fm:form modelAttribute="user">
            <table>
                <tr>
                    <td colspan="2">登录</td>
                </tr>
                <tr>
                    <td><spring:message code="username"/>：</td>
                    <td><fm:input path="username"/></td>
                </tr>
                <tr>
                    <td><spring:message code="password"/>：</td>
                    <td><fm:input path="password"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" value="<spring:message code="login"/>" onclick="userLogin(this.form)"/>
                        &nbsp;&nbsp;&nbsp;
                        <input type="reset" value="<spring:message code="reset"/>"/>
                    </td>
                </tr>
            </table>
        </fm:form>
    </div>

    <div id="area_register">
        <%-- 使用fm标签之前要先注册监听器 --%>
        <%--@elvariable id="user" type="entity.User"--%>
        <fm:form modelAttribute="user">
            <table>
                <tr>
                    <td colspan="2">注册</td>
                </tr>
                <tr>
                    <td><spring:message code="username"/>：</td>
                    <td><fm:input path="username"/></td>
                </tr>
                <tr>
                    <td><spring:message code="password"/>：</td>
                    <td><fm:input path="password"/></td>
                </tr>
                <tr>
                    <td><spring:message code="confirmPassword"/>：</td>
                    <td><input id="confirmPassword" type="text"/></td>
                </tr>
                <tr>
                    <td><spring:message code="sex"/>：</td>
                    <td>
                        <%
                            Map<String, String> genders = new HashMap<>();
                            genders.put("男", i18n.getString("boy"));
                            genders.put("女", i18n.getString("girl"));
                            request.setAttribute("genders", genders);
                        %>
                        <fm:radiobuttons path="sex" items="${ genders }" delimiter="&nbsp;&nbsp;&nbsp;"/>
                    </td>
                </tr>
                <tr>
                    <td><spring:message code="profession"/>：</td>
                    <td>
                        <%
                            Map<String, String> professions = new HashMap<>();
                            professions.put("学生", i18n.getString("student"));
                            professions.put("老师", i18n.getString("teacher"));
                            professions.put("工人", i18n.getString("worker"));
                            request.setAttribute("profession", professions);
                        %>
                        <fm:select path="profession" items="${ profession }"/>
                    </td>
                </tr>
                <tr>
                    <td><spring:message code="hobby"/>：</td>
                    <td>
                        <%
                            Map<String, String> hobbies = new HashMap<>();
                            hobbies.put("音乐", i18n.getString("music"));
                            hobbies.put("电影", i18n.getString("movie"));
                            hobbies.put("阅读", i18n.getString("read"));
                            request.setAttribute("hobbies", hobbies);
                        %>
                        <fm:checkboxes class="sss" path="hobby" items="${ hobbies }" delimiter="&nbsp;&nbsp;"/>
                    </td>
                </tr>
                <tr>
                    <td><spring:message code="personalDescription"/>：</td>
                    <td><fm:textarea path="personalDescription" rows="6" cols="30"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" value="<spring:message code="register"/>" onclick="registerUser(this.form)"/>
                        &nbsp;&nbsp;&nbsp;
                        <input type="reset" value="<spring:message code="reset"/>"/>
                    </td>
                </tr>
            </table>
        </fm:form>
    </div>
</div>
</body>
</html>
