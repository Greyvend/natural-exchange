package natural.exchange



import org.junit.*
import grails.test.mixin.*

@TestFor(AccessRightsController)
@Mock(AccessRights)
class AccessRightsControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/accessRights/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.accessRightsInstanceList.size() == 0
        assert model.accessRightsInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.accessRightsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.accessRightsInstance != null
        assert view == '/accessRights/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/accessRights/show/1'
        assert controller.flash.message != null
        assert AccessRights.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/accessRights/list'


        populateValidParams(params)
        def accessRights = new AccessRights(params)

        assert accessRights.save() != null

        params.id = accessRights.id

        def model = controller.show()

        assert model.accessRightsInstance == accessRights
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/accessRights/list'


        populateValidParams(params)
        def accessRights = new AccessRights(params)

        assert accessRights.save() != null

        params.id = accessRights.id

        def model = controller.edit()

        assert model.accessRightsInstance == accessRights
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/accessRights/list'

        response.reset()


        populateValidParams(params)
        def accessRights = new AccessRights(params)

        assert accessRights.save() != null

        // test invalid parameters in update
        params.id = accessRights.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/accessRights/edit"
        assert model.accessRightsInstance != null

        accessRights.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/accessRights/show/$accessRights.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        accessRights.clearErrors()

        populateValidParams(params)
        params.id = accessRights.id
        params.version = -1
        controller.update()

        assert view == "/accessRights/edit"
        assert model.accessRightsInstance != null
        assert model.accessRightsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/accessRights/list'

        response.reset()

        populateValidParams(params)
        def accessRights = new AccessRights(params)

        assert accessRights.save() != null
        assert AccessRights.count() == 1

        params.id = accessRights.id

        controller.delete()

        assert AccessRights.count() == 0
        assert AccessRights.get(accessRights.id) == null
        assert response.redirectedUrl == '/accessRights/list'
    }
}
