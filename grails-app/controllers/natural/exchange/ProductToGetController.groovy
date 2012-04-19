package natural.exchange

import org.springframework.dao.DataIntegrityViolationException

class ProductToGetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productToGetInstanceList: ProductToGet.list(params), productToGetInstanceTotal: ProductToGet.count()]
    }

    def create_product_to_get() {
        [productToGetInstance: new ProductToGet(params)]
    }

    def save() {
        def productToGetInstance = new ProductToGet(params)
        if (!productToGetInstance.save(flush: true)) {
            render(view: "create_product_to_get", model: [productToGetInstance: productToGetInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'productToGet.label', default: 'ProductToGet'), productToGetInstance.id])
        redirect(action: "show", id: productToGetInstance.id)
    }

    def show() {
        def productToGetInstance = ProductToGet.get(params.id)
        if (!productToGetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productToGet.label', default: 'ProductToGet'), params.id])
            redirect(action: "list")
            return
        }

        [productToGetInstance: productToGetInstance]
    }

    def edit_product_to_get() {
        def productToGetInstance = ProductToGet.get(params.id)
        if (!productToGetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productToGet.label', default: 'ProductToGet'), params.id])
            redirect(action: "list")
            return
        }

        [productToGetInstance: productToGetInstance]
    }

    def update() {
        def productToGetInstance = ProductToGet.get(params.id)
        if (!productToGetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productToGet.label', default: 'ProductToGet'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productToGetInstance.version > version) {
                productToGetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'productToGet.label', default: 'ProductToGet')] as Object[],
                          "Another user has updated this ProductToGet while you were editing")
                render(view: "edit_product_to_get", model: [productToGetInstance: productToGetInstance])
                return
            }
        }

        productToGetInstance.properties = params

        if (!productToGetInstance.save(flush: true)) {
            render(view: "edit_product_to_get", model: [productToGetInstance: productToGetInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'productToGet.label', default: 'ProductToGet'), productToGetInstance.id])
        redirect(action: "show", id: productToGetInstance.id)
    }

    def delete() {
        def productToGetInstance = ProductToGet.get(params.id)
        if (!productToGetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productToGet.label', default: 'ProductToGet'), params.id])
            redirect(action: "list")
            return
        }

        try {
            productToGetInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'productToGet.label', default: 'ProductToGet'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productToGet.label', default: 'ProductToGet'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
