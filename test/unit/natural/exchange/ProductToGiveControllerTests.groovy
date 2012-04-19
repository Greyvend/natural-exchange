package natural.exchange



import org.junit.*
import grails.test.mixin.*

@TestFor(ProductToGiveController)
@Mock(ProductToGive)
class ProductToGiveControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/productToGive/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.productToGiveInstanceList.size() == 0
        assert model.productToGiveInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.productToGiveInstance != null
    }

    void testSave() {
        controller.save()

        assert model.productToGiveInstance != null
        assert view == '/productToGive/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/productToGive/show/1'
        assert controller.flash.message != null
        assert ProductToGive.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/productToGive/list'


        populateValidParams(params)
        def productToGive = new ProductToGive(params)

        assert productToGive.save() != null

        params.id = productToGive.id

        def model = controller.show()

        assert model.productToGiveInstance == productToGive
    }

    void testEdit() {
        controller.edit_product_to_give()

        assert flash.message != null
        assert response.redirectedUrl == '/productToGive/list'


        populateValidParams(params)
        def productToGive = new ProductToGive(params)

        assert productToGive.save() != null

        params.id = productToGive.id

        def model = controller.edit_product_to_give()

        assert model.productToGiveInstance == productToGive
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/productToGive/list'

        response.reset()


        populateValidParams(params)
        def productToGive = new ProductToGive(params)

        assert productToGive.save() != null

        // test invalid parameters in update
        params.id = productToGive.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/productToGive/edit"
        assert model.productToGiveInstance != null

        productToGive.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/productToGive/show/$productToGive.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        productToGive.clearErrors()

        populateValidParams(params)
        params.id = productToGive.id
        params.version = -1
        controller.update()

        assert view == "/productToGive/edit"
        assert model.productToGiveInstance != null
        assert model.productToGiveInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/productToGive/list'

        response.reset()

        populateValidParams(params)
        def productToGive = new ProductToGive(params)

        assert productToGive.save() != null
        assert ProductToGive.count() == 1

        params.id = productToGive.id

        controller.delete()

        assert ProductToGive.count() == 0
        assert ProductToGive.get(productToGive.id) == null
        assert response.redirectedUrl == '/productToGive/list'
    }
}
