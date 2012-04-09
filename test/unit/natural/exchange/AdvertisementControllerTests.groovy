package natural.exchange



import org.junit.*
import grails.test.mixin.*

@TestFor(AdvertisementController)
@Mock(Advertisement)
class AdvertisementControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/advertisement/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.advertisementInstanceList.size() == 0
        assert model.advertisementInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.advertisementInstance != null
    }

    void testSave() {
        controller.save()

        assert model.advertisementInstance != null
        assert view == '/advertisement/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/advertisement/show/1'
        assert controller.flash.message != null
        assert Advertisement.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/advertisement/list'


        populateValidParams(params)
        def advertisement = new Advertisement(params)

        assert advertisement.save() != null

        params.id = advertisement.id

        def model = controller.show()

        assert model.advertisementInstance == advertisement
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/advertisement/list'


        populateValidParams(params)
        def advertisement = new Advertisement(params)

        assert advertisement.save() != null

        params.id = advertisement.id

        def model = controller.edit()

        assert model.advertisementInstance == advertisement
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/advertisement/list'

        response.reset()


        populateValidParams(params)
        def advertisement = new Advertisement(params)

        assert advertisement.save() != null

        // test invalid parameters in update
        params.id = advertisement.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/advertisement/edit"
        assert model.advertisementInstance != null

        advertisement.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/advertisement/show/$advertisement.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        advertisement.clearErrors()

        populateValidParams(params)
        params.id = advertisement.id
        params.version = -1
        controller.update()

        assert view == "/advertisement/edit"
        assert model.advertisementInstance != null
        assert model.advertisementInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/advertisement/list'

        response.reset()

        populateValidParams(params)
        def advertisement = new Advertisement(params)

        assert advertisement.save() != null
        assert Advertisement.count() == 1

        params.id = advertisement.id

        controller.delete()

        assert Advertisement.count() == 0
        assert Advertisement.get(advertisement.id) == null
        assert response.redirectedUrl == '/advertisement/list'
    }
}
