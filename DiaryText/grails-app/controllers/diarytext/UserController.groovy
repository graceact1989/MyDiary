package diarytext

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def beforeInterceptor = [action:this.&auth,except:['login', 'logout', 'authenticate','register','checkUserName']]
    def auth() {
       if (!session.user){
           redirect(controller:"user", action:"login")
           return false
       }else{
           redirect(controller: "diary",action: "list")
           return true
       }
    }


    def index = {
        redirect(action: "list", params: params)
    }

    def login={}

    def logout={
        flash.message = "Goodbye ${session.user.userName}"
        session.user = null
        redirect(action:"login")
    }


    def authenticate = {
//        def tmp = params.password.encodeAsSHA1();
        def user = User.findByUserNameAndPassword(params.login, params.password.encodeAsSHA1())
        if(user){
            session.user = user
//            flash.message = "Hello ${user.userName}!"
            redirect(controller:"diary", action:"list")
        }else{
            flash.message = "Sorry, ${params.login}. Please try again."
            redirect(action:"login")
        }
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 5, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create = {
        def userInstance = new User()
        userInstance.properties = params
        return [userInstance: userInstance]
    }

    def register = {
        def userInstance = new User(params)
        if (userInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.userName])}"
            redirect(action: "login", userInstance: userInstance)
        }
    }

    def checkUserName = {

        def userName = params['userName']
        if (User.findByUserName(userName)) {
            render "<span class='error'>  用户名已经存在 </span>"
        } else {
            render    "<span class='success'>  恭喜您，此账号可用！ </span>"
        }
    }

    def show = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userInstance: userInstance]
        }
    }

    def edit = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userInstance: userInstance]
        }
    }

    def update = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {

                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            try {
                userInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }
}
