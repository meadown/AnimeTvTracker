//
//	EpisodeToAir.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class EpisodeToAir : NSObject, NSCoding{

	var airDate : String!
	var episodeNumber : Int!
	var id : Int!
	var name : String!
	var overview : String!
	var productionCode : String!
	var seasonNumber : Int!
	var stillPath : String!
	var voteAverage : Float!
	var voteCount : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		airDate = dictionary["air_date"] as? String
		episodeNumber = dictionary["episode_number"] as? Int
		id = dictionary["id"] as? Int
		name = dictionary["name"] as? String
		overview = dictionary["overview"] as? String
		productionCode = dictionary["production_code"] as? String
		seasonNumber = dictionary["season_number"] as? Int
		stillPath = dictionary["still_path"] as? String
		voteAverage = dictionary["vote_average"] as? Float
		voteCount = dictionary["vote_count"] as? Int
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
		if episodeNumber != nil{
			dictionary["episode_number"] = episodeNumber
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
		if productionCode != nil{
			dictionary["production_code"] = productionCode
		}
		if seasonNumber != nil{
			dictionary["season_number"] = seasonNumber
		}
		if stillPath != nil{
			dictionary["still_path"] = stillPath
		}
		if voteAverage != nil{
			dictionary["vote_average"] = voteAverage
		}
		if voteCount != nil{
			dictionary["vote_count"] = voteCount
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
         episodeNumber = aDecoder.decodeObject(forKey: "episode_number") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         overview = aDecoder.decodeObject(forKey: "overview") as? String
         productionCode = aDecoder.decodeObject(forKey: "production_code") as? String
         seasonNumber = aDecoder.decodeObject(forKey: "season_number") as? Int
         stillPath = aDecoder.decodeObject(forKey: "still_path") as? String
         voteAverage = aDecoder.decodeObject(forKey: "vote_average") as? Float
         voteCount = aDecoder.decodeObject(forKey: "vote_count") as? Int

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
		if episodeNumber != nil{
			aCoder.encode(episodeNumber, forKey: "episode_number")
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
		if productionCode != nil{
			aCoder.encode(productionCode, forKey: "production_code")
		}
		if seasonNumber != nil{
			aCoder.encode(seasonNumber, forKey: "season_number")
		}
		if stillPath != nil{
			aCoder.encode(stillPath, forKey: "still_path")
		}
		if voteAverage != nil{
			aCoder.encode(voteAverage, forKey: "vote_average")
		}
		if voteCount != nil{
			aCoder.encode(voteCount, forKey: "vote_count")
		}

	}

}
