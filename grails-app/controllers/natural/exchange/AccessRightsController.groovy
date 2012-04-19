package natural.exchange

import org.springframework.dao.DataIntegrityViolationException

class AccessRightsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [accessRightsInstanceList: AccessRights.list(params), accessRightsInstanceTotal: AccessRights.count()]
    }

    def create() {
        [accessRightsInstance: new AccessRights(params)]
    }

    def save() {
        def accessRightsInstance = new AccessRights(params)
        if (!accessRightsInstance.save(flush: true)) {
            render(view: "create", model: [accessRightsInstance: accessRightsInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'accessRights.label', default: 'AccessRights'), accessRightsInstance.id])
        redirect(action: "show", id: accessRightsInstance.id)
    }

    def show() {
        def accessRightsInstance = AccessRights.get(params.id)
        if (!accessRightsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'accessRights.label', default: 'AccessRights'), params.id])
            redirect(action: "list")
            return
        }

        [accessRightsInstance: accessRightsInstance]
    }

    def edit() {
        def accessRightsInstance = AccessRights.get(params.id)
        if (!accessRightsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'accessRights.label', default: 'AccessRights'), params.id])
            redirect(action: "list")
            return
        }

        [accessRightsInstance: accessRightsInstance]
    }

    def update() {
        def accessRightsInstance = AccessRights.get(params.id)
        if (!accessRightsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'accessRights.label', default: 'AccessRights'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (accessRightsInstance.version > version) {
                accessRightsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'accessRights.label', default: 'AccessRights')] as Object[],
                          "Another user has updated this AccessRights while you were editing")
                render(view: "edit", model: [accessRightsInstance: accessRightsInstance])
                return
            }
        }

        accessRightsInstance.properties = params

        if (!accessRightsInstance.save(flush: true)) {
            render(view: "edit", model: [accessRightsInstance: accessRightsInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'accessRights.label', default: 'AccessRights'), accessRightsInstance.id])
        redirect(action: "show", id: accessRightsInstance.id)
    }

    def delete() {
        def accessRightsInstance = AccessRights.get(params.id)
        if (!accessRightsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'accessRights.label', default: 'AccessRights'), params.id])
            redirect(action: "list")
            return
        }

        try {
            accessRightsInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'accessRights.label', default: 'AccessRights'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'accessRights.label', default: 'AccessRights'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
