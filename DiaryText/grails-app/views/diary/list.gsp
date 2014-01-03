
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
            %{--<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>--}%
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:each in="${diaryInstanceList}" status="i" var="diaryInstance">
                <div class="diary">
                    %{--<h2>${diaryInstance.dateCreated.format("yyyy-MM-dd HH:mm:ss")}</h2>--}%

                    %{--<p class="diary-details">--}%
                        %{--<span class="question">Who:</span>--}%
                        %{--<span class="answer">--}%
                            %{--${diaryInstance.user?.userName}</span>--}%
                    %{--</p>--}%

                    <p class="diary-details">

                    <span class="question">${diaryInstance.dateCreated.format("yyyy-MM-dd HH:mm:ss")}-></span>
                    <span class="answer">
                        ${diaryInstance.text}</span>
                    </p>

                    %{--<p class="diary-details">--}%
                        %{--<span class="question">When:</span>--}%
                        %{--<span class="answer">--}%
                            %{--${diaryInstance.dateCreated.--}%
                                    %{--format("yyyy-MM-dd HH:mm:ss")}</span>--}%
                    %{--</p>--}%

                </div>
            </g:each>

            <div class="paginateButtons">
                <g:paginate total="${diaryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
