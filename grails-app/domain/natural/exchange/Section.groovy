package natural.exchange

class Section {
	
	static constraints = {
		name(blank:false, maxSize:30)
    }
	static hasMany = [productToGet:ProductToGet, productToGive:ProductToGive]
	String name
	
	String toString(){
		return name
	}
}
