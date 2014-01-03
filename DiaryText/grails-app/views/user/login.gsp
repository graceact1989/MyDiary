<%--
  Created by IntelliJ IDEA.
  User: xpyan
  Date: 14-1-3
  Time: 下午1:32
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
  <title>Login</title>
</head>
<body>
<div id="loginPage">
    <h1>Login</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:form controller="user" action="authenticate" method="post" >
        <div class="dialog">
            <table>
                <tbody>
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="login">Login:</label>
                    </td>
                    <td valign="top">
                        <input type="text" id="login" name="login"/>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="password">Password:</label>
                    </td>
                    <td valign="top">
                        <input type="password" id="password" name="password"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="buttons">
            <span class="button">
                <input type="submit" value="Login" />
            </span>
        </div>
    </g:form>
</div>
</body>
</html>