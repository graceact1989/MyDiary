

<%@ page import="diarytext.Diary" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'diary.label', default: 'Diary')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${diaryInstance}">
            <div class="errors">
                <g:renderErrors bean="${diaryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${diaryInstance?.id}" />
                <g:hiddenField name="version" value="${diaryInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="user"><g:message code="diary.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: diaryInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${diarytext.User.list()}" optionKey="id" value="${diaryInstance?.user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="text"><g:message code="diary.text.label" default="Text" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: diaryInstance, field: 'text', 'errors')}">
                                    <g:textField name="text" value="${diaryInstance?.text}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastModify"><g:message code="diary.lastModify.label" default="Last Modify" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: diaryInstance, field: 'lastModify', 'errors')}">
                                    <g:datePicker name="lastModify" precision="day" value="${diaryInstance?.lastModify}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="parentId"><g:message code="diary.parentId.label" default="Parent Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: diaryInstance, field: 'parentId', 'errors')}">
                                    <g:textField name="parentId" value="${fieldValue(bean: diaryInstance, field: 'parentId')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
