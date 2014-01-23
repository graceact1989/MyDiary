<%--
  Created by IntelliJ IDEA.
  User: xpyan
  Date: 12-4-13
  Time: 下午2:51
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <title>Register</title>
    <meta name="layout" content="main" />
    %{--<link rel="stylesheet" href="${resource(dir: 'css/user', file: 'register.css')}"/>--}%
    <script src="${resource(dir: "js/diary", file: "jquery-1.6.2.min.js")}" type="text/javascript" charset="utf-8"></script>
    <script src="${resource(dir: "js/diary", file: "manager.js")}" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        function login_1(){
            window.open("/${grailsApplication.metadata['app.name']}/user/login.gsp")
        }

    </script>
</head>

<body>

<div  id="register">
    <div class="clear">
        <h1>用户注册</h1>
    </div>

    <g:form action="register" controller="user" method="post">
        <div class="dialog">
            <table align="center" cellpadding="0" >
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userName"><g:message code="user.userName.label" default="用户名"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'userName', 'errors')}">
                        <g:textField name="userName" maxlength="18" value="${userInstance?.userName}"></g:textField>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="password"><g:message code="user.password.label" default="密码"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                        <g:passwordField name="password" maxlength="18" value="${userInstance?.password}"/>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>

        <div class="kland_reg">
            <input type="submit" id="submit" value="注册" />
            %{--<span class="button"><g:actionSubmit  class="save" value="注册" action="register" ></g:actionSubmit></span>--}%
            %{--<span class="button"><g:actionSubmit  value="登陆" action="login"></g:actionSubmit></span>--}%
            <input type="button" onclick="login_1()"  value="登陆" >
        </div>
    </g:form>

</div>

<div class="clear"></div>

</body>
</html>