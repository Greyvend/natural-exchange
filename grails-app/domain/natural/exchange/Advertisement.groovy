package natural.exchange

import java.util.Date

class Advertisement {
	static constraints = {
		exchanger()
		productToGive()
		productToGet()
		placementDate()
    }
	
	User exchanger
	ProductToGive productToGive
	ProductToGet productToGet
	Date placementDate
}
