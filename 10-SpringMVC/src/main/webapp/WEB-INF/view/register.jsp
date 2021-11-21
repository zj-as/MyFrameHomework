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
    <title>注册页面</title>
</head>
<body>
<div>
    <a href="changeLocale.do?locale=zh_CH">中文</a>
    <a href="changeLocale.do?locale=en_US">English</a>
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
        ResourceBundle message = ResourceBundle.getBundle("message", locale);
    %>
    <%-- 使用fm标签之前要先注册监听器 --%>
    <%--@elvariable id="user" type="entity.User"--%>
    <fm:form action="register.do" method="post" modelAttribute="user">
        <table>
            <tr>
                <td><spring:message code="username"/>：</td>
                <td><fm:input path="username"/>&nbsp;*&nbsp;<fm:errors path="username"/></td>
            </tr>
            <tr>
                <td><spring:message code="password"/>：</td>
                <td>
                    <fm:input path="password"/>&nbsp;*
                    <fm:errors path="password"/>&nbsp;&nbsp;
                    <fm:errors path="sameUsername"/>
                </td>
            </tr>
            <tr>
                <td><spring:message code="confirmPassword"/>：</td>
                <td><fm:input path="confirmPassword"/>&nbsp;*&nbsp;<fm:errors path="samePassword"/></td>
            </tr>
            <tr>
                <td><spring:message code="sex"/>：</td>
                <td>
                    <%
                        Map<String, String> genders = new HashMap<>();
                        genders.put("0", message.getString("boy"));
                        genders.put("1", message.getString("girl"));
                        request.setAttribute("genders", genders);
                    %>
                    <fm:radiobuttons path="sex" items="${ genders }" delimiter="&nbsp;&nbsp;&nbsp;"/>
                </td>
            </tr>
            <tr>
                <td><spring:message code="work"/>：</td>
                <td>
                    <%
                        Map<String, String> works = new HashMap<>();
                        works.put("0", message.getString("student"));
                        works.put("1", message.getString("teacher"));
                        works.put("2", message.getString("worker"));
                        request.setAttribute("works", works);
                    %>
                    <fm:select path="work" items="${ works }"/>
                </td>
            </tr>
            <tr>
                <td><spring:message code="hobby"/>：</td>
                <td>
                    <%
                        Map<String, String> hobbies = new HashMap<>();
                        hobbies.put("0", message.getString("music"));
                        hobbies.put("1", message.getString("movie"));
                        hobbies.put("2", message.getString("read"));
                        request.setAttribute("hobbies", hobbies);
                    %>
                    <fm:checkboxes path="hobby" items="${ hobbies }" delimiter="&nbsp;&nbsp;"/>
                </td>
            </tr>
            <tr>
                <td><spring:message code="note"/>：</td>
                <td><fm:textarea path="note" rows="6" cols="30"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="<spring:message code="submit"/>"/>
                    &nbsp;&nbsp;&nbsp;
                    <input type="reset" value="<spring:message code="reset"/>"/>
                </td>
            </tr>
        </table>
    </fm:form>
</div>
</body>
</html>
