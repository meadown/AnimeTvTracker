//
//  ApiManager.swift
//  AnimeTvTracker
//
//  Created by Danyal on 22/07/2021.
//

//https://github.com/Ahmed-Ali/JSONExport

import Foundation
import UIKit
import Alamofire


class ApiManager : NSObject{
    
    private static var _obj : ApiManager? = nil
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    class var shared:ApiManager{
        get{
            if _obj == nil{
                _obj = ApiManager()
            }
            let lockQueue = DispatchQueue(label: "_obj")
            return lockQueue.sync{
                return _obj!
            }
        }
    }
    
    
    func loadImages(urlStr : String = Constants.baseImgUrl, completion : @escaping (Data?,String?)->Swift.Void){
        let url = URL(string : urlStr)
        AF.request( url!,method: .get).response{ response in

            switch response.result {
                case .success(let responseData):
                   completion( responseData!,nil)

                case .failure(let error):
                    print("error--->",error)
                    completion( nil,error.localizedDescription)
                }
            
        }

    }
    
    func getTvShowsList(urlStr : String = Constants.recentUrl, tag : Int, completion : @escaping (TvMain?,Int,String?)->Swift.Void){
        let url = URL(string : urlStr)
        
        AF.request(url!, method: .get).responseJSON { (response) in
            switch response.result{
            case .success(let value):
                if let res = value as? [String:Any]{
                    let mainRes = TvMain(fromDictionary: res)
                    completion(mainRes,tag,response.error?.localizedDescription)
                }
            case .failure(let error):
                completion(nil,tag,error.localizedDescription)
                print("error :\(error.localizedDescription)")
            }
        }
    }
    
    func getTvDetails( id : Int, completion : @escaping (TVDetails?,String?)->Swift.Void){
        let urlStr = Constants.tvDetailsAllUrl.replacingOccurrences(of: Constants.tvID, with: "\(id)")
        let url = URL(string : urlStr)
        
        AF.request(url!, method: .get).responseJSON { (response) in
            switch response.result{
            case .success(let value):
                if let res = value as? [String:Any]{
                    let mainRes = TVDetails(fromDictionary: res)
                    completion(mainRes,response.error?.localizedDescription)
                }
            case .failure(let error):
                completion(nil,error.localizedDescription)
                print("error :\(error.localizedDescription)")
            }
        }
    }
}
