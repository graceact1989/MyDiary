package diarytext

class DiaryTagLib {
    def subText={
        arrs->
        String content = arrs.text
        content=content.replaceAll("<[^><]*?>","")
        int limit = Integer.parseInt(arrs.length)
        if (content.length() > limit){
            out<<"""${content.substring(0,limit)}<span id="show${arrs.name}">...<a href="#" onclick="javascript:void(0);showText('${arrs.name}')">【详情】</a></span>"""
            out<< """<span id="hidden${arrs.name}" style='display:none'>${content.substring(limit)}<a href="#" onclick="javascript:void(0);hiddenText('${arrs.name}')">【隐藏】</a></span>"""
        }else{
            out<< content
        }
    }
}
