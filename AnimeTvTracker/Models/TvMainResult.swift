//
//	Result.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class TvMainResult : NSObject, NSCoding{

	var backdropPath : String!
	var firstAirDate : String!
	var genreIds : [Int]!
	var id : Int!
	var name : String!
	var originCountry : [AnyObject]!
	var originalLanguage : String!
	var originalName : String!
	var overview : String!
	var popularity : Float!
	var posterPath : String!
	var voteAverage : Float!
	var voteCount : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		backdropPath = dictionary["backdrop_path"] as? String
		firstAirDate = dictionary["first_air_date"] as? String
		genreIds = dictionary["genre_ids"] as? [Int]
		id = dictionary["id"] as? Int
		name = dictionary["name"] as? String
		originCountry = dictionary["origin_country"] as? [AnyObject]
		originalLanguage = dictionary["original_language"] as? String
		originalName = dictionary["original_name"] as? String
		overview = dictionary["overview"] as? String
        popularity = Float("\(dictionary["popularity"] ?? 0.0)")// as? Float
		posterPath = dictionary["poster_path"] as? String
		voteAverage = Float("\(dictionary["vote_average"] ?? 0.0)") //dictionary["vote_average"] as? Int
		voteCount = dictionary["vote_count"] as? Int
        
        
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if backdropPath != nil{
			dictionary["backdrop_path"] = backdropPath
		}
		if firstAirDate != nil{
			dictionary["first_air_date"] = firstAirDate
		}
		if genreIds != nil{
			dictionary["genre_ids"] = genreIds
		}
		if id != nil{
			dictionary["id"] = id
		}
		if name != nil{
			dictionary["name"] = name
		}
		if originCountry != nil{
			dictionary["origin_country"] = originCountry
		}
		if originalLanguage != nil{
			dictionary["original_language"] = originalLanguage
		}
		if originalName != nil{
			dictionary["original_name"] = originalName
		}
		if overview != nil{
			dictionary["overview"] = overview
		}
		if popularity != nil{
			dictionary["popularity"] = popularity
		}
		if posterPath != nil{
			dictionary["poster_path"] = posterPath
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
         backdropPath = aDecoder.decodeObject(forKey: "backdrop_path") as? String
         firstAirDate = aDecoder.decodeObject(forKey: "first_air_date") as? String
         genreIds = aDecoder.decodeObject(forKey: "genre_ids") as? [Int]
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         originCountry = aDecoder.decodeObject(forKey: "origin_country") as? [AnyObject]
         originalLanguage = aDecoder.decodeObject(forKey: "original_language") as? String
         originalName = aDecoder.decodeObject(forKey: "original_name") as? String
         overview = aDecoder.decodeObject(forKey: "overview") as? String
         popularity = aDecoder.decodeObject(forKey: "popularity") as? Float
         posterPath = aDecoder.decodeObject(forKey: "poster_path") as? String
         voteAverage = aDecoder.decodeObject(forKey: "vote_average") as? Float
         voteCount = aDecoder.decodeObject(forKey: "vote_count") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if backdropPath != nil{
			aCoder.encode(backdropPath, forKey: "backdrop_path")
		}
		if firstAirDate != nil{
			aCoder.encode(firstAirDate, forKey: "first_air_date")
		}
		if genreIds != nil{
			aCoder.encode(genreIds, forKey: "genre_ids")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if originCountry != nil{
			aCoder.encode(originCountry, forKey: "origin_country")
		}
		if originalLanguage != nil{
			aCoder.encode(originalLanguage, forKey: "original_language")
		}
		if originalName != nil{
			aCoder.encode(originalName, forKey: "original_name")
		}
		if overview != nil{
			aCoder.encode(overview, forKey: "overview")
		}
		if popularity != nil{
			aCoder.encode(popularity, forKey: "popularity")
		}
		if posterPath != nil{
			aCoder.encode(posterPath, forKey: "poster_path")
		}
		if voteAverage != nil{
			aCoder.encode(voteAverage, forKey: "vote_average")
		}
		if voteCount != nil{
			aCoder.encode(voteCount, forKey: "vote_count")
		}

	}

}
