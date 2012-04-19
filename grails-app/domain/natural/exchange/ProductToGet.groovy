package natural.exchange

class ProductToGet {
	static constraints = {
		name(blank:false, maxSize:100)
		description(maxSize:1500)
		section()
    }
	static hasMany = [ad:Advertisement]
	
	String name
	String description
	Section section
	
	String toString(){
		return name
	}
}
