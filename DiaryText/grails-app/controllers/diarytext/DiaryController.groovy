package diarytext

class DiaryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def beforeInterceptor = [action:this.&auth]
    def auth() {
        if (!session.user){
            redirect(controller:"user", action:"login")
            return false
        }
    }

    def search={
        if(!params.q){
            params.q="*"
        }
        def resultsMap = Diary.search(params.q, params)
        render(view:'list',
                model:[
                        diaryInstanceList:resultsMap.results,
                        diaryInstanceTotal:Diary.countHits(params.q)
                ]
        )
    }

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [diaryInstanceList: Diary.list(params), diaryInstanceTotal: Diary.count()]
    }

    def create = {
        def diaryInstance = new Diary()
        diaryInstance.properties = params
        return [diaryInstance: diaryInstance]
    }

    def save = {
        def diaryInstance = new Diary(params)
        if (diaryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'diary.label', default: 'Diary'), diaryInstance.id])}"
            redirect(action: "show", id: diaryInstance.id)
        }
        else {
            render(view: "create", model: [diaryInstance: diaryInstance])
        }
    }

    def show = {
        def diaryInstance = Diary.get(params.id)
        if (!diaryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'diary.label', default: 'Diary'), params.id])}"
            redirect(action: "list")
        }
        else {
            [diaryInstance: diaryInstance]
        }
    }

    def edit = {
        def diaryInstance = Diary.get(params.id)
        if (!diaryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'diary.label', default: 'Diary'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [diaryInstance: diaryInstance]
        }
    }

    def update = {
        def diaryInstance = Diary.get(params.id)
        if (diaryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (diaryInstance.version > version) {
                    
                    diaryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'diary.label', default: 'Diary')] as Object[], "Another user has updated this Diary while you were editing")
                    render(view: "edit", model: [diaryInstance: diaryInstance])
                    return
                }
            }
            diaryInstance.properties = params
            if (!diaryInstance.hasErrors() && diaryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'diary.label', default: 'Diary'), diaryInstance.id])}"
                redirect(action: "show", id: diaryInstance.id)
            }
            else {
                render(view: "edit", model: [diaryInstance: diaryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'diary.label', default: 'Diary'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def diaryInstance = Diary.get(params.id)
        if (diaryInstance) {
            try {
                diaryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'diary.label', default: 'Diary'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'diary.label', default: 'Diary'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'diary.label', default: 'Diary'), params.id])}"
            redirect(action: "list")
        }
    }
}
