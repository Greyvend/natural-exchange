package natural.exchange

class User {
	String login
	Integer hashedPassword
	String email
	String accessRights
	
	static hasMany = [ad:Advertisement]
	
    /*static constraints = {
    	login(blank:false, maxSize:10)
		hashedPassword(blank:false, maxSize:20)
		email(email:true)
		group(blank:false)
	}*/
}
