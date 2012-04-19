package natural.exchange



import org.junit.*
import grails.test.mixin.*

@TestFor(ProductToGetController)
@Mock(ProductToGet)
class ProductToGetControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/productToGet/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.productToGetInstanceList.size() == 0
        assert model.productToGetInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create_product_to_get()

       assert model.productToGetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.productToGetInstance != null
        assert view == '/productToGet/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/productToGet/show/1'
        assert controller.flash.message != null
        assert ProductToGet.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/productToGet/list'


        populateValidParams(params)
        def productToGet = new ProductToGet(params)

        assert productToGet.save() != null

        params.id = productToGet.id

        def model = controller.show()

        assert model.productToGetInstance == productToGet
    }

    void testEdit() {
        controller.edit_product_to_get()

        assert flash.message != null
        assert response.redirectedUrl == '/productToGet/list'


        populateValidParams(params)
        def productToGet = new ProductToGet(params)

        assert productToGet.save() != null

        params.id = productToGet.id

        def model = controller.edit_product_to_get()

        assert model.productToGetInstance == productToGet
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/productToGet/list'

        response.reset()


        populateValidParams(params)
        def productToGet = new ProductToGet(params)

        assert productToGet.save() != null

        // test invalid parameters in update
        params.id = productToGet.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/productToGet/edit"
        assert model.productToGetInstance != null

        productToGet.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/productToGet/show/$productToGet.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        productToGet.clearErrors()

        populateValidParams(params)
        params.id = productToGet.id
        params.version = -1
        controller.update()

        assert view == "/productToGet/edit"
        assert model.productToGetInstance != null
        assert model.productToGetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/productToGet/list'

        response.reset()

        populateValidParams(params)
        def productToGet = new ProductToGet(params)

        assert productToGet.save() != null
        assert ProductToGet.count() == 1

        params.id = productToGet.id

        controller.delete()

        assert ProductToGet.count() == 0
        assert ProductToGet.get(productToGet.id) == null
        assert response.redirectedUrl == '/productToGet/list'
    }
}
