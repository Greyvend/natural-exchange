package natural.exchange

class User {
	static constraints = {
    	login(blank:false, maxSize:10)
		hashedPassword(blank:false, maxSize:20)
		email(blank:false, email:true)
		accessRights(blank:false)
	}
	static hasMany = [ad:Advertisement]
	String login
	Integer hashedPassword
	String email
	AccessRights accessRights
	
	String toString(){
		return login
	}
}
