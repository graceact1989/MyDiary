<div id="search">
    <g:form url='[controller: "diary", action: "search"]'
            id="diarySearchForm"
            name="diarySearchForm"
            method="get">
        <g:textField name="q" value="${params.q}"/>
        <input type="submit" value="Find a diary"/>
    </g:form>
</div>