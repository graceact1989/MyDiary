package diarytext

class LoginTagLib {
    def loginControl = {
        if(request.getSession(false) && session.user){
            out << "Hello ${session.user.userName} "
            out << """[${link(action:"logout", controller:"user"){"Logout"}}]"""
        } else {
            out << """[${link(action:"login", controller:"user"){"Login"}}] [${link(url: "/${grailsApplication.metadata['app.name']}/user/register.gsp"){"Register"}}]"""
        }
    }
}
