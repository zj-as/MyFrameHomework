<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="entity.User" %>
<%@ taglib prefix="fm" uri="http://www.springframework.org/tags/form" %>
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
    <title>注册页面</title>
</head>
<body>
<div>
    <%
        if (request.getAttribute("user") == null) {
            User user = new User();
            request.setAttribute("user", user);
        }
    %>
    <%-- 使用fm标签之前要先注册监听器 --%>
    <%--@elvariable id="user" type="entity.User"--%>
    <fm:form action="register.do" method="post" modelAttribute="user">
        <table>
            <tr>
                <td>用&nbsp;户&nbsp;名：</td>
                <td><fm:input path="username"/>&nbsp;*&nbsp;<fm:errors path="username"/></td>
            </tr>
            <tr>
                <td>密&nbsp;&nbsp;&nbsp;码：</td>
                <td>
                    <fm:input path="password"/>&nbsp;*
                    <fm:errors path="password"/>&nbsp;&nbsp;
                    <fm:errors path="sameUsername"/>
                </td>
            </tr>
            <tr>
                <td>确认密码：</td>
                <td><fm:input path="confirmPassword"/>&nbsp;*&nbsp;<fm:errors path="samePassword"/></td>
            </tr>
            <tr>
                <td>性&nbsp;&nbsp;&nbsp;别：</td>
                <td>
                    <%
                        Map<String, String> genders = new HashMap<>();
                        genders.put("0", "男");
                        genders.put("1", "女");
                        request.setAttribute("genders", genders);
                    %>
                    <fm:radiobuttons path="sex" items="${ genders }" delimiter="&nbsp;&nbsp;&nbsp;"/>
                </td>
            </tr>
            <tr>
                <td>职&nbsp;&nbsp;&nbsp;业：</td>
                <td>
                    <%
                        Map<String, String> works = new HashMap<>();
                        works.put("0", "学生");
                        works.put("1", "老师");
                        works.put("2", "工人");
                        request.setAttribute("works", works);
                    %>
                    <fm:select path="work" items="${ works }"/>
                </td>
            </tr>
            <tr>
                <td>爱&nbsp;&nbsp;&nbsp;好：</td>
                <td>
                    <%
                        Map<String, String> hobbies = new HashMap<>();
                        hobbies.put("0", "音乐");
                        hobbies.put("1", "电影");
                        hobbies.put("2", "阅读");
                        request.setAttribute("hobbies", hobbies);
                    %>
                    <fm:checkboxes path="hobby" items="${ hobbies }" delimiter="&nbsp;&nbsp;"/>
                </td>
            </tr>
            <tr>
                <td>个性签名：</td>
                <td><fm:textarea path="note" rows="6" cols="30"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="提交"/>
                    &nbsp;&nbsp;&nbsp;
                    <input type="reset" value="重置"/>
                </td>
            </tr>
        </table>
    </fm:form>
</div>
</body>
</html>
