//
//	Image.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Image : NSObject, NSCoding{

	var backdrops : [Backdrop]!
	var logos : [Backdrop]!
	var posters : [Backdrop]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		backdrops = [Backdrop]()
		if let backdropsArray = dictionary["backdrops"] as? [[String:Any]]{
			for dic in backdropsArray{
				let value = Backdrop(fromDictionary: dic)
				backdrops.append(value)
			}
		}
		logos = [Backdrop]()
		if let logosArray = dictionary["logos"] as? [[String:Any]]{
			for dic in logosArray{
				let value = Backdrop(fromDictionary: dic)
				logos.append(value)
			}
		}
		posters = [Backdrop]()
		if let postersArray = dictionary["posters"] as? [[String:Any]]{
			for dic in postersArray{
				let value = Backdrop(fromDictionary: dic)
				posters.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if backdrops != nil{
			var dictionaryElements = [[String:Any]]()
			for backdropsElement in backdrops {
				dictionaryElements.append(backdropsElement.toDictionary())
			}
			dictionary["backdrops"] = dictionaryElements
		}
		if logos != nil{
			var dictionaryElements = [[String:Any]]()
			for logosElement in logos {
				dictionaryElements.append(logosElement.toDictionary())
			}
			dictionary["logos"] = dictionaryElements
		}
		if posters != nil{
			var dictionaryElements = [[String:Any]]()
			for postersElement in posters {
				dictionaryElements.append(postersElement.toDictionary())
			}
			dictionary["posters"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         backdrops = aDecoder.decodeObject(forKey :"backdrops") as? [Backdrop]
         logos = aDecoder.decodeObject(forKey :"logos") as? [Backdrop]
         posters = aDecoder.decodeObject(forKey :"posters") as? [Backdrop]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if backdrops != nil{
			aCoder.encode(backdrops, forKey: "backdrops")
		}
		if logos != nil{
			aCoder.encode(logos, forKey: "logos")
		}
		if posters != nil{
			aCoder.encode(posters, forKey: "posters")
		}

	}

}