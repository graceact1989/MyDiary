<%@ page import="diarytext.Diary" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'diary.label', default: 'Diary')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
%{--diary 列表--}%
<div id="diary-list">
    %{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
    <h1>${entityName}</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:each in="${diaryInstanceList}" status="i" var="diaryInstance">
        <div class="diary">

            <p class="diary-details">

                <span class="question">${diaryInstance.dateCreated.format("yyyy-MM-dd HH:mm:ss")}-></span>
                <span class="answer">
                    ${diaryInstance.text}</span>
            </p>

        </div>
    </g:each>

    <div class="paginateButtons">
        <g:paginate total="${diaryInstanceTotal}"/>
    </div>
</div>

%{--加入新的Diary--}%
<div id="diary-create">
    <g:form action="save">
        <input name="user.id" type="text" value="${session?.user?.id}" style="display: none;"/>
        <label for="text"><h1><g:message code="diary.text.label" default="Text"/></h1></label>
        <g:textArea id="textareaId" name="text" rows="10" cols="30" value="${diaryInstance?.text}"/>

        <div >
            <span class="button"><g:submitButton name="create" class="save" value="Enter"/></span>
        </div>
    </g:form>

    <script>
        var areaId = document.getElementById('textareaId');
        areaId.onkeydown = function(e){
            e = e?e:window.event;
            if(e.ctrlKey && 13==e.keyCode){
                this.form.submit();
            }
        }
    </script>

</div>
</body>
</html>
