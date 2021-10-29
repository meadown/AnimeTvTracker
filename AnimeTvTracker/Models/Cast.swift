//
//	Cast.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Cast : NSObject, NSCoding{

	var adult : Bool!
	var character : String!
	var creditId : String!
	var gender : Int!
	var id : Int!
	var knownForDepartment : String!
	var name : String!
	var order : Int!
	var originalName : String!
	var popularity : Float!
	var profilePath : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		adult = dictionary["adult"] as? Bool
		character = dictionary["character"] as? String
		creditId = dictionary["credit_id"] as? String
		gender = dictionary["gender"] as? Int
		id = dictionary["id"] as? Int
		knownForDepartment = dictionary["known_for_department"] as? String
		name = dictionary["name"] as? String
		order = dictionary["order"] as? Int
		originalName = dictionary["original_name"] as? String
		popularity = dictionary["popularity"] as? Float
		profilePath = dictionary["profile_path"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if adult != nil{
			dictionary["adult"] = adult
		}
		if character != nil{
			dictionary["character"] = character
		}
		if creditId != nil{
			dictionary["credit_id"] = creditId
		}
		if gender != nil{
			dictionary["gender"] = gender
		}
		if id != nil{
			dictionary["id"] = id
		}
		if knownForDepartment != nil{
			dictionary["known_for_department"] = knownForDepartment
		}
		if name != nil{
			dictionary["name"] = name
		}
		if order != nil{
			dictionary["order"] = order
		}
		if originalName != nil{
			dictionary["original_name"] = originalName
		}
		if popularity != nil{
			dictionary["popularity"] = popularity
		}
		if profilePath != nil{
			dictionary["profile_path"] = profilePath
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         adult = aDecoder.decodeObject(forKey: "adult") as? Bool
         character = aDecoder.decodeObject(forKey: "character") as? String
         creditId = aDecoder.decodeObject(forKey: "credit_id") as? String
         gender = aDecoder.decodeObject(forKey: "gender") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         knownForDepartment = aDecoder.decodeObject(forKey: "known_for_department") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         order = aDecoder.decodeObject(forKey: "order") as? Int
         originalName = aDecoder.decodeObject(forKey: "original_name") as? String
         popularity = aDecoder.decodeObject(forKey: "popularity") as? Float
         profilePath = aDecoder.decodeObject(forKey: "profile_path") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if adult != nil{
			aCoder.encode(adult, forKey: "adult")
		}
		if character != nil{
			aCoder.encode(character, forKey: "character")
		}
		if creditId != nil{
			aCoder.encode(creditId, forKey: "credit_id")
		}
		if gender != nil{
			aCoder.encode(gender, forKey: "gender")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if knownForDepartment != nil{
			aCoder.encode(knownForDepartment, forKey: "known_for_department")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if order != nil{
			aCoder.encode(order, forKey: "order")
		}
		if originalName != nil{
			aCoder.encode(originalName, forKey: "original_name")
		}
		if popularity != nil{
			aCoder.encode(popularity, forKey: "popularity")
		}
		if profilePath != nil{
			aCoder.encode(profilePath, forKey: "profile_path")
		}

	}

}