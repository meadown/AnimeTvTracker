//
//	SpokenLanguage.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class SpokenLanguage : NSObject, NSCoding{

	var englishName : String!
	var iso6391 : String!
	var name : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		englishName = dictionary["english_name"] as? String
		iso6391 = dictionary["iso_639_1"] as? String
		name = dictionary["name"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if englishName != nil{
			dictionary["english_name"] = englishName
		}
		if iso6391 != nil{
			dictionary["iso_639_1"] = iso6391
		}
		if name != nil{
			dictionary["name"] = name
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         englishName = aDecoder.decodeObject(forKey: "english_name") as? String
         iso6391 = aDecoder.decodeObject(forKey: "iso_639_1") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if englishName != nil{
			aCoder.encode(englishName, forKey: "english_name")
		}
		if iso6391 != nil{
			aCoder.encode(iso6391, forKey: "iso_639_1")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}

	}

}