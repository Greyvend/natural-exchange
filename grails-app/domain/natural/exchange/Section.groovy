package natural.exchange

class Section {
	String name
	static hasMany = [productToGet:ProductToGet, productToGive:ProductToGive]
	
    /*static constraints = {
		name(blank:false)
    }*/
}
