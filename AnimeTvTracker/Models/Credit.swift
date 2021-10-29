//
//	Credit.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Credit : NSObject, NSCoding{

	var cast : [Cast]!
	var crew : [Crew]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		cast = [Cast]()
		if let castArray = dictionary["cast"] as? [[String:Any]]{
			for dic in castArray{
				let value = Cast(fromDictionary: dic)
				cast.append(value)
			}
		}
		crew = [Crew]()
		if let crewArray = dictionary["crew"] as? [[String:Any]]{
			for dic in crewArray{
				let value = Crew(fromDictionary: dic)
				crew.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if cast != nil{
			var dictionaryElements = [[String:Any]]()
			for castElement in cast {
				dictionaryElements.append(castElement.toDictionary())
			}
			dictionary["cast"] = dictionaryElements
		}
		if crew != nil{
			var dictionaryElements = [[String:Any]]()
			for crewElement in crew {
				dictionaryElements.append(crewElement.toDictionary())
			}
			dictionary["crew"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         cast = aDecoder.decodeObject(forKey :"cast") as? [Cast]
         crew = aDecoder.decodeObject(forKey :"crew") as? [Crew]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if cast != nil{
			aCoder.encode(cast, forKey: "cast")
		}
		if crew != nil{
			aCoder.encode(crew, forKey: "crew")
		}

	}

}