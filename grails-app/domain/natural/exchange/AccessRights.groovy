package natural.exchange

class AccessRights {

    static constraints = {
	  name(blank:false)
	  createSection()
	  createAd()
	  deleteAd()
	  readUserProfile()
	  banOtherUser()
	  canBeBanned()
	}
	static hasMany = [user:User]
	
	String name
	Boolean createSection
	Boolean createAd
	Boolean deleteAd
	Boolean readUserProfile
	Boolean banOtherUser
	Boolean canBeBanned
	
	String toString(){
		return name
	}
}
