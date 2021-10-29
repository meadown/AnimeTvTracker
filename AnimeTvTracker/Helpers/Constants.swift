//
//  Constants.swift
//  AnimeTvTracker
//
//  Created by Danyal on 22/07/2021.
//

import UIKit

class Constants{
    
    
    static var summaryCellHeight : CGFloat =  150.0
    static var bannderAdUnitID = "ca-app-pub-6070224121254548/1578709703"
    static var nativeAdUnitID = "ca-app-pub-6070224121254548/5717908805"
    static var InterstitialAdUnitID = "ca-app-pub-6070224121254548/9265628034"

    static var youtubeBaseUrl = "https://youtu.be/"

    
    static var tvID = "tvID"
    static var personID = "personID"

    
    static var apiKey = "?api_key=" + "cb18af292fe58b8cccf251899c845834"
    static var genreAnimation = "with_genres=16"
    static var baseUrl = "https://api.themoviedb.org/3"
    
    static var keyPart = "\(apiKey)&\(genreAnimation)"
    //Home Apis
    static var recentUrl = baseUrl + "/tv/airing_today\(keyPart)"
    static var onAirUrl = baseUrl + "/tv/on_the_air\(keyPart)"
    static var popularUrl = baseUrl + "/tv/popular\(keyPart)"
    static var topRatedUrl = baseUrl + "/tv/top_rated\(keyPart)"
    
    //Search
    static var searchUrl = baseUrl + "/search/tv\(keyPart)&include_adult=false" // append page and query str "&query=***" "&page=*"
    static var query = "&query="
    
    //Tv details
    static var tvDetailsUrl = baseUrl + "/tv/\(tvID)" + "\(apiKey)"
    static var tvCast = baseUrl + "/tv/\(tvID)/credits" + "\(apiKey)"
    static var tvImages = baseUrl + "/tv/\(tvID)/images" + "\(apiKey)"
    static var tvVideos = baseUrl + "/tv/\(tvID)/videos" + "\(apiKey)"

    static var cast = "credits"
    static var videos = "videos"
    static var images = "images"
    static var appendToResponse = "&append_to_response="
    
    static var tvDetailsAllUrl = baseUrl + "/tv/\(tvID)" + "\(apiKey)" + "\(appendToResponse)\(cast),\(videos),\(images)"


    //Person Details
    static var personDetailsUrl = baseUrl + "/person/\(personID)" + "\(apiKey)"

    //Original Image
    static var baseImgUrl = "https://www.themoviedb.org/t/p/"
    
    static var width200Img = "w200"
    static var width300Img = "w300"
    static var width500Img = "w500"
    static var height100Img = "h100"
    
    static var orginalImg = "original"

    static var appOpenCount : Int{
        get{
            return UserDefaults.standard.integer(forKey: "appOpenCount")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "appOpenCount")
        }
    }
    
}
