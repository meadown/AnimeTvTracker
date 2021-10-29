//
//	VideoResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class VideoResult : NSObject, NSCoding{

	var id : String!
	var iso31661 : String!
	var iso6391 : String!
	var key : String!
	var name : String!
	var site : String!
	var size : Int!
	var type : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		id = dictionary["id"] as? String
		iso31661 = dictionary["iso_3166_1"] as? String
		iso6391 = dictionary["iso_639_1"] as? String
		key = dictionary["key"] as? String
		name = dictionary["name"] as? String
		site = dictionary["site"] as? String
		size = dictionary["size"] as? Int
		type = dictionary["type"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if id != nil{
			dictionary["id"] = id
		}
		if iso31661 != nil{
			dictionary["iso_3166_1"] = iso31661
		}
		if iso6391 != nil{
			dictionary["iso_639_1"] = iso6391
		}
		if key != nil{
			dictionary["key"] = key
		}
		if name != nil{
			dictionary["name"] = name
		}
		if site != nil{
			dictionary["site"] = site
		}
		if size != nil{
			dictionary["size"] = size
		}
		if type != nil{
			dictionary["type"] = type
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         id = aDecoder.decodeObject(forKey: "id") as? String
         iso31661 = aDecoder.decodeObject(forKey: "iso_3166_1") as? String
         iso6391 = aDecoder.decodeObject(forKey: "iso_639_1") as? String
         key = aDecoder.decodeObject(forKey: "key") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         site = aDecoder.decodeObject(forKey: "site") as? String
         size = aDecoder.decodeObject(forKey: "size") as? Int
         type = aDecoder.decodeObject(forKey: "type") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if iso31661 != nil{
			aCoder.encode(iso31661, forKey: "iso_3166_1")
		}
		if iso6391 != nil{
			aCoder.encode(iso6391, forKey: "iso_639_1")
		}
		if key != nil{
			aCoder.encode(key, forKey: "key")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if site != nil{
			aCoder.encode(site, forKey: "site")
		}
		if size != nil{
			aCoder.encode(size, forKey: "size")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}

	}

}
