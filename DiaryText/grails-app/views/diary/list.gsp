
<%@ page import="diarytext.Diary" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'diary.label', default: 'Diary')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'diary.id.label', default: 'Id')}" />
                        
                            <th><g:message code="diary.user.label" default="User" /></th>
                        
                            <g:sortableColumn property="text" title="${message(code: 'diary.text.label', default: 'Text')}" />
                        
                            <g:sortableColumn property="lastModify" title="${message(code: 'diary.lastModify.label', default: 'Last Modify')}" />
                        
                            <g:sortableColumn property="parentId" title="${message(code: 'diary.parentId.label', default: 'Parent Id')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${diaryInstanceList}" status="i" var="diaryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${diaryInstance.id}">${fieldValue(bean: diaryInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: diaryInstance, field: "user")}</td>
                        
                            <td>${fieldValue(bean: diaryInstance, field: "text")}</td>
                        
                            <td><g:formatDate date="${diaryInstance.lastModify}" /></td>
                        
                            <td>${fieldValue(bean: diaryInstance, field: "parentId")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${diaryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
