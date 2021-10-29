//
//	TVDetails.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class TVDetails : NSObject, NSCoding{

	var backdropPath : String!
	var createdBy : [AnyObject]!
    var credits : Credit!
	var episodeRunTime : [Int]!
	var firstAirDate : String!
	var genres : [Genre]!
	var homepage : String!
	var id : Int!
	var images : Image!
	var inProduction : Bool!
	var languages : [String]!
	var lastAirDate : String!
	var lastEpisodeToAir : EpisodeToAir!
	var name : String!
	var networks : [Network]!
	var nextEpisodeToAir : EpisodeToAir!
	var numberOfEpisodes : Int!
	var numberOfSeasons : Int!
	var originCountry : [String]!
	var originalLanguage : String!
	var originalName : String!
	var overview : String!
	var popularity : Float!
	var posterPath : String!
	var productionCompanies : [Network]!
	var productionCountries : [ProductionCountry]!
	var seasons : [Season]!
	var spokenLanguages : [SpokenLanguage]!
	var status : String!
	var tagline : String!
	var type : String!
	var videos : Video!
	var voteAverage : Float!
	var voteCount : Int!
//    var informationArr : [String:String] = [:]
//    var informationArr = Array(arrayLiteral: "asa","sa")
    var informationArr : Array<(key: String, value: String)> = []


//    Array(dictionary)



	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		backdropPath = dictionary["backdrop_path"] as? String
		createdBy = dictionary["created_by"] as? [AnyObject]
        if let creditsData = dictionary["credits"] as? [String:Any]{
            credits = Credit(fromDictionary: creditsData)
        }
        episodeRunTime = dictionary["episode_run_time"] as? [Int]
		firstAirDate = dictionary["first_air_date"] as? String
		genres = [Genre]()
		if let genresArray = dictionary["genres"] as? [[String:Any]]{
			for dic in genresArray{
				let value = Genre(fromDictionary: dic)
				genres.append(value)
			}
		}
		homepage = dictionary["homepage"] as? String
		id = dictionary["id"] as? Int
		if let imagesData = dictionary["images"] as? [String:Any]{
			images = Image(fromDictionary: imagesData)
		}
		inProduction = dictionary["in_production"] as? Bool
		languages = dictionary["languages"] as? [String]
		lastAirDate = dictionary["last_air_date"] as? String
		if let lastEpisodeToAirData = dictionary["last_episode_to_air"] as? [String:Any]{
			lastEpisodeToAir = EpisodeToAir(fromDictionary: lastEpisodeToAirData)
		}
		name = dictionary["name"] as? String
		networks = [Network]()
		if let networksArray = dictionary["networks"] as? [[String:Any]]{
			for dic in networksArray{
				let value = Network(fromDictionary: dic)
				networks.append(value)
			}
		}
		if let nextEpisodeToAirData = dictionary["next_episode_to_air"] as? [String:Any]{
			nextEpisodeToAir = EpisodeToAir(fromDictionary: nextEpisodeToAirData)
		}
		numberOfEpisodes = dictionary["number_of_episodes"] as? Int
		numberOfSeasons = dictionary["number_of_seasons"] as? Int
		originCountry = dictionary["origin_country"] as? [String]
		originalLanguage = dictionary["original_language"] as? String
		originalName = dictionary["original_name"] as? String
		overview = dictionary["overview"] as? String
		popularity = Float("\(dictionary["popularity"] ?? 0.0)")
		posterPath = dictionary["poster_path"] as? String
		productionCompanies = [Network]()
		if let productionCompaniesArray = dictionary["production_companies"] as? [[String:Any]]{
			for dic in productionCompaniesArray{
				let value = Network(fromDictionary: dic)
				productionCompanies.append(value)
			}
		}
		productionCountries = [ProductionCountry]()
		if let productionCountriesArray = dictionary["production_countries"] as? [[String:Any]]{
			for dic in productionCountriesArray{
				let value = ProductionCountry(fromDictionary: dic)
				productionCountries.append(value)
			}
		}
		seasons = [Season]()
		if let seasonsArray = dictionary["seasons"] as? [[String:Any]]{
			for dic in seasonsArray{
				let value = Season(fromDictionary: dic)
				seasons.append(value)
			}
		}
		spokenLanguages = [SpokenLanguage]()
		if let spokenLanguagesArray = dictionary["spoken_languages"] as? [[String:Any]]{
			for dic in spokenLanguagesArray{
				let value = SpokenLanguage(fromDictionary: dic)
				spokenLanguages.append(value)
			}
		}
		status = dictionary["status"] as? String
		tagline = dictionary["tagline"] as? String
		type = dictionary["type"] as? String
		if let videosData = dictionary["videos"] as? [String:Any]{
			videos = Video(fromDictionary: videosData)
		}
		voteAverage = Float("\(dictionary["vote_average"] ?? 0.0)")
		voteCount = dictionary["vote_count"] as? Int
        
        let status = inProduction ? "Ongoing" : "Finished"

//        informationArr.updateValue(firstAirDate, forKey: "First Air Date")
//        informationArr.updateValue(lastAirDate, forKey: "Last Air Date")
//        informationArr.updateValue(nextEpisodeToAir.airDate, forKey: "Next Air Date")
//
//        informationArr.updateValue("\(episodeRunTime.first ?? 20)", forKey: "Episode Duration")
//        informationArr.updateValue(status, forKey: "Airing Status")
//        informationArr.updateValue("\(numberOfEpisodes ?? 0)", forKey: "Total Episodes")
//        informationArr.updateValue("\(popularity ?? 0)", forKey: "Popularity")
//        informationArr.updateValue("\(voteAverage ?? 0)", forKey: "Rating")
//
        if let date = firstAirDate{
            informationArr.append((key: "First Air Date", value: date ))
        }
        if let date = lastAirDate{
            informationArr.append((key: "Last Air Date", value: date ))
        }
        if let nextEp = nextEpisodeToAir{
            informationArr.append((key: "Next Air Date", value: nextEp.airDate ))
        }
        if let country = originCountry{
            informationArr.append((key: "Origin Country", value: country.first ?? ""))
        }
        if let epNum = numberOfEpisodes{
            informationArr.append((key: "Total Episodes", value: "\(epNum)"))
        }
        if let item = episodeRunTime{
            informationArr.append((key: "Episode Duration", value: "\(item.first ?? 0)"))
        }
        informationArr.append((key: "Airing Status", value: status))
       
       
        
        informationArr.append((key: "Popularity", value: "\(popularity ?? 0)"))
        informationArr.append((key: "Rating", value: "\(voteAverage ?? 0)"))
        print("names :\(informationArr.map({$0.value}))")
        print("keys :\(informationArr.map({$0.key}))")

//
//        var val = (key: "dasda",value: "")
//        informationArr.append(val)

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
		if createdBy != nil{
			dictionary["created_by"] = createdBy
		}
        if credits != nil{
            dictionary["credits"] = credits.toDictionary()
        }
		if episodeRunTime != nil{
			dictionary["episode_run_time"] = episodeRunTime
		}
		if firstAirDate != nil{
			dictionary["first_air_date"] = firstAirDate
		}
		if genres != nil{
			var dictionaryElements = [[String:Any]]()
			for genresElement in genres {
				dictionaryElements.append(genresElement.toDictionary())
			}
			dictionary["genres"] = dictionaryElements
		}
		if homepage != nil{
			dictionary["homepage"] = homepage
		}
		if id != nil{
			dictionary["id"] = id
		}
		if images != nil{
			dictionary["images"] = images.toDictionary()
		}
		if inProduction != nil{
			dictionary["in_production"] = inProduction
		}
		if languages != nil{
			dictionary["languages"] = languages
		}
		if lastAirDate != nil{
			dictionary["last_air_date"] = lastAirDate
		}
		if lastEpisodeToAir != nil{
			dictionary["last_episode_to_air"] = lastEpisodeToAir.toDictionary()
		}
		if name != nil{
			dictionary["name"] = name
		}
		if networks != nil{
			var dictionaryElements = [[String:Any]]()
			for networksElement in networks {
				dictionaryElements.append(networksElement.toDictionary())
			}
			dictionary["networks"] = dictionaryElements
		}
		if nextEpisodeToAir != nil{
			dictionary["next_episode_to_air"] = nextEpisodeToAir.toDictionary()
		}
		if numberOfEpisodes != nil{
			dictionary["number_of_episodes"] = numberOfEpisodes
		}
		if numberOfSeasons != nil{
			dictionary["number_of_seasons"] = numberOfSeasons
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
		if productionCompanies != nil{
			var dictionaryElements = [[String:Any]]()
			for productionCompaniesElement in productionCompanies {
				dictionaryElements.append(productionCompaniesElement.toDictionary())
			}
			dictionary["production_companies"] = dictionaryElements
		}
		if productionCountries != nil{
			var dictionaryElements = [[String:Any]]()
			for productionCountriesElement in productionCountries {
				dictionaryElements.append(productionCountriesElement.toDictionary())
			}
			dictionary["production_countries"] = dictionaryElements
		}
		if seasons != nil{
			var dictionaryElements = [[String:Any]]()
			for seasonsElement in seasons {
				dictionaryElements.append(seasonsElement.toDictionary())
			}
			dictionary["seasons"] = dictionaryElements
		}
		if spokenLanguages != nil{
			var dictionaryElements = [[String:Any]]()
			for spokenLanguagesElement in spokenLanguages {
				dictionaryElements.append(spokenLanguagesElement.toDictionary())
			}
			dictionary["spoken_languages"] = dictionaryElements
		}
		if status != nil{
			dictionary["status"] = status
		}
		if tagline != nil{
			dictionary["tagline"] = tagline
		}
		if type != nil{
			dictionary["type"] = type
		}
		if videos != nil{
			dictionary["videos"] = videos.toDictionary()
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
         createdBy = aDecoder.decodeObject(forKey: "created_by") as? [AnyObject]
        credits = aDecoder.decodeObject(forKey: "credits") as? Credit
        episodeRunTime = aDecoder.decodeObject(forKey: "episode_run_time") as? [Int]
         firstAirDate = aDecoder.decodeObject(forKey: "first_air_date") as? String
         genres = aDecoder.decodeObject(forKey :"genres") as? [Genre]
         homepage = aDecoder.decodeObject(forKey: "homepage") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         images = aDecoder.decodeObject(forKey: "images") as? Image
         inProduction = aDecoder.decodeObject(forKey: "in_production") as? Bool
         languages = aDecoder.decodeObject(forKey: "languages") as? [String]
         lastAirDate = aDecoder.decodeObject(forKey: "last_air_date") as? String
         lastEpisodeToAir = aDecoder.decodeObject(forKey: "last_episode_to_air") as? EpisodeToAir
         name = aDecoder.decodeObject(forKey: "name") as? String
         networks = aDecoder.decodeObject(forKey :"networks") as? [Network]
         nextEpisodeToAir = aDecoder.decodeObject(forKey: "next_episode_to_air") as? EpisodeToAir
         numberOfEpisodes = aDecoder.decodeObject(forKey: "number_of_episodes") as? Int
         numberOfSeasons = aDecoder.decodeObject(forKey: "number_of_seasons") as? Int
         originCountry = aDecoder.decodeObject(forKey: "origin_country") as? [String]
         originalLanguage = aDecoder.decodeObject(forKey: "original_language") as? String
         originalName = aDecoder.decodeObject(forKey: "original_name") as? String
         overview = aDecoder.decodeObject(forKey: "overview") as? String
         popularity = aDecoder.decodeObject(forKey: "popularity") as? Float
         posterPath = aDecoder.decodeObject(forKey: "poster_path") as? String
         productionCompanies = aDecoder.decodeObject(forKey :"production_companies") as? [Network]
         productionCountries = aDecoder.decodeObject(forKey :"production_countries") as? [ProductionCountry]
         seasons = aDecoder.decodeObject(forKey :"seasons") as? [Season]
         spokenLanguages = aDecoder.decodeObject(forKey :"spoken_languages") as? [SpokenLanguage]
         status = aDecoder.decodeObject(forKey: "status") as? String
         tagline = aDecoder.decodeObject(forKey: "tagline") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String
         videos = aDecoder.decodeObject(forKey: "videos") as? Video
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
		if createdBy != nil{
			aCoder.encode(createdBy, forKey: "created_by")
		}
        if credits != nil{
            aCoder.encode(credits, forKey: "credits")
        }
		if episodeRunTime != nil{
			aCoder.encode(episodeRunTime, forKey: "episode_run_time")
		}
		if firstAirDate != nil{
			aCoder.encode(firstAirDate, forKey: "first_air_date")
		}
		if genres != nil{
			aCoder.encode(genres, forKey: "genres")
		}
		if homepage != nil{
			aCoder.encode(homepage, forKey: "homepage")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if images != nil{
			aCoder.encode(images, forKey: "images")
		}
		if inProduction != nil{
			aCoder.encode(inProduction, forKey: "in_production")
		}
		if languages != nil{
			aCoder.encode(languages, forKey: "languages")
		}
		if lastAirDate != nil{
			aCoder.encode(lastAirDate, forKey: "last_air_date")
		}
		if lastEpisodeToAir != nil{
			aCoder.encode(lastEpisodeToAir, forKey: "last_episode_to_air")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if networks != nil{
			aCoder.encode(networks, forKey: "networks")
		}
		if nextEpisodeToAir != nil{
			aCoder.encode(nextEpisodeToAir, forKey: "next_episode_to_air")
		}
		if numberOfEpisodes != nil{
			aCoder.encode(numberOfEpisodes, forKey: "number_of_episodes")
		}
		if numberOfSeasons != nil{
			aCoder.encode(numberOfSeasons, forKey: "number_of_seasons")
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
		if productionCompanies != nil{
			aCoder.encode(productionCompanies, forKey: "production_companies")
		}
		if productionCountries != nil{
			aCoder.encode(productionCountries, forKey: "production_countries")
		}
		if seasons != nil{
			aCoder.encode(seasons, forKey: "seasons")
		}
		if spokenLanguages != nil{
			aCoder.encode(spokenLanguages, forKey: "spoken_languages")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if tagline != nil{
			aCoder.encode(tagline, forKey: "tagline")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if videos != nil{
			aCoder.encode(videos, forKey: "videos")
		}
		if voteAverage != nil{
			aCoder.encode(voteAverage, forKey: "vote_average")
		}
		if voteCount != nil{
			aCoder.encode(voteCount, forKey: "vote_count")
		}

	}

}
