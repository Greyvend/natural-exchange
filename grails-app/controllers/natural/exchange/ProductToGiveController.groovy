package natural.exchange

import org.springframework.dao.DataIntegrityViolationException

class ProductToGiveController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productToGiveInstanceList: ProductToGive.list(params), productToGiveInstanceTotal: ProductToGive.count()]
    }

    def create() {
        [productToGiveInstance: new ProductToGive(params)]
    }

    def save() {
        def productToGiveInstance = new ProductToGive(params)
        if (!productToGiveInstance.save(flush: true)) {
            render(view: "create", model: [productToGiveInstance: productToGiveInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'productToGive.label', default: 'ProductToGive'), productToGiveInstance.id])
        redirect(action: "show", id: productToGiveInstance.id)
    }

    def show() {
        def productToGiveInstance = ProductToGive.get(params.id)
        if (!productToGiveInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productToGive.label', default: 'ProductToGive'), params.id])
            redirect(action: "list")
            return
        }

        [productToGiveInstance: productToGiveInstance]
    }

    def edit_product_to_give() {
        def productToGiveInstance = ProductToGive.get(params.id)
        if (!productToGiveInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productToGive.label', default: 'ProductToGive'), params.id])
            redirect(action: "list")
            return
        }

        [productToGiveInstance: productToGiveInstance]
    }

    def update() {
        def productToGiveInstance = ProductToGive.get(params.id)
        if (!productToGiveInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productToGive.label', default: 'ProductToGive'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productToGiveInstance.version > version) {
                productToGiveInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'productToGive.label', default: 'ProductToGive')] as Object[],
                          "Another user has updated this ProductToGive while you were editing")
                render(view: "edit_product_to_give", model: [productToGiveInstance: productToGiveInstance])
                return
            }
        }

        productToGiveInstance.properties = params

        if (!productToGiveInstance.save(flush: true)) {
            render(view: "edit_product_to_give", model: [productToGiveInstance: productToGiveInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'productToGive.label', default: 'ProductToGive'), productToGiveInstance.id])
        redirect(action: "show", id: productToGiveInstance.id)
    }

    def delete() {
        def productToGiveInstance = ProductToGive.get(params.id)
        if (!productToGiveInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productToGive.label', default: 'ProductToGive'), params.id])
            redirect(action: "list")
            return
        }

        try {
            productToGiveInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'productToGive.label', default: 'ProductToGive'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productToGive.label', default: 'ProductToGive'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
