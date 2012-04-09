package natural.exchange

class ProductToGet {
	String name
	String description
	Section section
	
	static hasMany = [ad:Advertisement]
	
   /*static constraints = {
		name(blank:false, maxSize:100)
		description(maxSize:1500)
		section(blank:false)
    }*/
}
