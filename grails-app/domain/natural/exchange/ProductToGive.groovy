package natural.exchange

class ProductToGive {
	static constraints = {
		name(blank:false, maxSize:100)
		description(maxSize:1500)
		section()
		imgUrl(url:true)
    }
	static hasMany = [ad:Advertisement]
	
	String name
	String description
	Section section
	String imgUrl
	
	String toString(){
		return name
	}
}
