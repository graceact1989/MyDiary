<%@ page import="diarytext.Diary" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'diary.label', default: 'Diary')}"/>
    <g:javascript src="diary/jquery-1.6.2.min.js" />
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

                <div class="question">${diaryInstance.dateCreated.format("yyyy-MM-dd HH:mm:ss")}</div>
                <div class="answer" name="${diaryInstance.id}">
                    <g:subText name="${diaryInstance.id}" text="${diaryInstance.text}" length="30" />
                </div>
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

    <script type="text/javascript">
        %{--内容的动态显示--}%
        function showText(name){
            var showId = "#show"+name;
            $(showId).css({display:"none"});
            var hiddenId=  "#hidden"+name;
            $(hiddenId).css({display:"inline"});
        }
        function hiddenText(name){
            var showId = "#show"+name;
            $(showId).css({display:"inline"});
            var hiddenId=  "#hidden"+name;
            $(hiddenId).css({display:"none"});
        }

    </script>

    <script>
    %{--输入框的聚焦、Ctrl+Enter提交--}%
        var areaId = document.getElementById('textareaId');
        areaId.focus();
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
