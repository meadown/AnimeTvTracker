//
//	Crew.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Crew : NSObject, NSCoding{

	var adult : Bool!
	var creditId : String!
	var department : String!
	var gender : Int!
	var id : Int!
	var job : String!
	var knownForDepartment : String!
	var name : String!
	var originalName : String!
	var popularity : Float!
	var profilePath : AnyObject!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		adult = dictionary["adult"] as? Bool
		creditId = dictionary["credit_id"] as? String
		department = dictionary["department"] as? String
		gender = dictionary["gender"] as? Int
		id = dictionary["id"] as? Int
		job = dictionary["job"] as? String
		knownForDepartment = dictionary["known_for_department"] as? String
		name = dictionary["name"] as? String
		originalName = dictionary["original_name"] as? String
		popularity = dictionary["popularity"] as? Float
		profilePath = dictionary["profile_path"] as? AnyObject
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
		if creditId != nil{
			dictionary["credit_id"] = creditId
		}
		if department != nil{
			dictionary["department"] = department
		}
		if gender != nil{
			dictionary["gender"] = gender
		}
		if id != nil{
			dictionary["id"] = id
		}
		if job != nil{
			dictionary["job"] = job
		}
		if knownForDepartment != nil{
			dictionary["known_for_department"] = knownForDepartment
		}
		if name != nil{
			dictionary["name"] = name
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
         creditId = aDecoder.decodeObject(forKey: "credit_id") as? String
         department = aDecoder.decodeObject(forKey: "department") as? String
         gender = aDecoder.decodeObject(forKey: "gender") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         job = aDecoder.decodeObject(forKey: "job") as? String
         knownForDepartment = aDecoder.decodeObject(forKey: "known_for_department") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         originalName = aDecoder.decodeObject(forKey: "original_name") as? String
         popularity = aDecoder.decodeObject(forKey: "popularity") as? Float
         profilePath = aDecoder.decodeObject(forKey: "profile_path") as? AnyObject

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
		if creditId != nil{
			aCoder.encode(creditId, forKey: "credit_id")
		}
		if department != nil{
			aCoder.encode(department, forKey: "department")
		}
		if gender != nil{
			aCoder.encode(gender, forKey: "gender")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if job != nil{
			aCoder.encode(job, forKey: "job")
		}
		if knownForDepartment != nil{
			aCoder.encode(knownForDepartment, forKey: "known_for_department")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
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