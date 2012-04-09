package natural.exchange

class ProductToGive {
	String name
	String description
	Section section
	String imgUrl
	
	static hasMany = [ad:Advertisement]
	
    /*static constraints = {
		name(blank:false, maxSize:100)
		description(maxSize:1500)
		section(blank:false)
		imgUrl(url:true)
    }*/
}
