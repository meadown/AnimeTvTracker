//
//	Season.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Season : NSObject, NSCoding{

	var airDate : String!
	var episodeCount : Int!
	var id : Int!
	var name : String!
	var overview : String!
	var posterPath : String!
	var seasonNumber : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		airDate = dictionary["air_date"] as? String
		episodeCount = dictionary["episode_count"] as? Int
		id = dictionary["id"] as? Int
		name = dictionary["name"] as? String
		overview = dictionary["overview"] as? String
		posterPath = dictionary["poster_path"] as? String
		seasonNumber = dictionary["season_number"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if airDate != nil{
			dictionary["air_date"] = airDate
		}
		if episodeCount != nil{
			dictionary["episode_count"] = episodeCount
		}
		if id != nil{
			dictionary["id"] = id
		}
		if name != nil{
			dictionary["name"] = name
		}
		if overview != nil{
			dictionary["overview"] = overview
		}
		if posterPath != nil{
			dictionary["poster_path"] = posterPath
		}
		if seasonNumber != nil{
			dictionary["season_number"] = seasonNumber
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         airDate = aDecoder.decodeObject(forKey: "air_date") as? String
         episodeCount = aDecoder.decodeObject(forKey: "episode_count") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         overview = aDecoder.decodeObject(forKey: "overview") as? String
         posterPath = aDecoder.decodeObject(forKey: "poster_path") as? String
         seasonNumber = aDecoder.decodeObject(forKey: "season_number") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if airDate != nil{
			aCoder.encode(airDate, forKey: "air_date")
		}
		if episodeCount != nil{
			aCoder.encode(episodeCount, forKey: "episode_count")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if overview != nil{
			aCoder.encode(overview, forKey: "overview")
		}
		if posterPath != nil{
			aCoder.encode(posterPath, forKey: "poster_path")
		}
		if seasonNumber != nil{
			aCoder.encode(seasonNumber, forKey: "season_number")
		}

	}

}