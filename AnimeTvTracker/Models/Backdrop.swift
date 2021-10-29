//
//	Backdrop.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Backdrop : NSObject, NSCoding{

	var aspectRatio : Float!
	var filePath : String!
	var height : Int!
	var iso6391 : String!
	var voteAverage : Float!
	var voteCount : Int!
	var width : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		aspectRatio = dictionary["aspect_ratio"] as? Float
		filePath = dictionary["file_path"] as? String
		height = dictionary["height"] as? Int
		iso6391 = dictionary["iso_639_1"] as? String
		voteAverage = dictionary["vote_average"] as? Float
		voteCount = dictionary["vote_count"] as? Int
		width = dictionary["width"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if aspectRatio != nil{
			dictionary["aspect_ratio"] = aspectRatio
		}
		if filePath != nil{
			dictionary["file_path"] = filePath
		}
		if height != nil{
			dictionary["height"] = height
		}
		if iso6391 != nil{
			dictionary["iso_639_1"] = iso6391
		}
		if voteAverage != nil{
			dictionary["vote_average"] = voteAverage
		}
		if voteCount != nil{
			dictionary["vote_count"] = voteCount
		}
		if width != nil{
			dictionary["width"] = width
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         aspectRatio = aDecoder.decodeObject(forKey: "aspect_ratio") as? Float
         filePath = aDecoder.decodeObject(forKey: "file_path") as? String
         height = aDecoder.decodeObject(forKey: "height") as? Int
         iso6391 = aDecoder.decodeObject(forKey: "iso_639_1") as? String
         voteAverage = aDecoder.decodeObject(forKey: "vote_average") as? Float
         voteCount = aDecoder.decodeObject(forKey: "vote_count") as? Int
         width = aDecoder.decodeObject(forKey: "width") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if aspectRatio != nil{
			aCoder.encode(aspectRatio, forKey: "aspect_ratio")
		}
		if filePath != nil{
			aCoder.encode(filePath, forKey: "file_path")
		}
		if height != nil{
			aCoder.encode(height, forKey: "height")
		}
		if iso6391 != nil{
			aCoder.encode(iso6391, forKey: "iso_639_1")
		}
		if voteAverage != nil{
			aCoder.encode(voteAverage, forKey: "vote_average")
		}
		if voteCount != nil{
			aCoder.encode(voteCount, forKey: "vote_count")
		}
		if width != nil{
			aCoder.encode(width, forKey: "width")
		}

	}

}