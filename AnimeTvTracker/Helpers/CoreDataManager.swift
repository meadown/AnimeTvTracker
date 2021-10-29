//
//  CoreDataManager.swift
//  AnimeTvTracker
//
//  Created by Danyal Naveed on 28/07/2021.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    private static var _obj : CoreDataManager? = nil
    class var shared:CoreDataManager{
        get{
            if _obj == nil{
                _obj = CoreDataManager()
                
            }
            let lockQueue = DispatchQueue(label: "_coreDataObj")
            return lockQueue.sync{
                return _obj!
            }
        }
        
    }
    
    func addFavourite(fvrtTV : FavouriteTVModel){
        
        if !isFavourite(id: fvrtTV.id){
            print("saving :id\(fvrtTV.id) , name :\(fvrtTV.name)")

            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "FavouriteTV", in: context)
            
            let dict : [String:Any] = ["id": fvrtTV.id , "name" : fvrtTV.name, "rating":fvrtTV.rating]
            
            let db_obj = NSManagedObject(entity: entity!, insertInto: context)
            db_obj.setValuesForKeys(dict)
            do {
                try context.save()
            }//do
            catch {  print("something went wrong while saving FavouriteTV record")
            }
            
            
            if let imgurl = fvrtTV.imagePath{
                let urlStr = Constants.baseImgUrl + Constants.width200Img + imgurl
                ApiManager.shared.loadImages(urlStr: urlStr) { (data, err) in
                    DispatchQueue.main.async {
                        if let imgData = data{
                            self.saveImage(data: imgData, id: fvrtTV.id)
                        }else{
                        }
                    }
                }
            }else{
                print("image path not found :id\(fvrtTV.id) , name :\(fvrtTV.name)")
            }
            
        }else{
            print("tv already saved")
        }
       
        
    }
    
    func getFavouriteList()-> [FavouriteTVModel]{
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteTV")
            request.returnsObjectsAsFaults = false
        var arr : [FavouriteTVModel] = []
        do {
            let result = try context.fetch(request)
            let data = (result as! [NSManagedObject])
            
            for i in 0 ..< data.count {
                let id = data[i].value(forKey: "id") as? Int ?? 0
                let name = data[i].value(forKey: "name") as? String ?? ""
                let rating = data[i].value(forKey: "rating") as? Float ?? 0.0

                let tv = FavouriteTVModel(id :id , name : name, rating: rating)
                arr.append(tv)
            }
            
            return arr
            
        }catch {
            print("Failed")
        }
        
        return arr
    }
    
    func isFavourite(id : Int)-> Bool{
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteTV")

        do {
            request.predicate = NSPredicate(format: " id = %i", id)
            request.returnsObjectsAsFaults = false
            let result = try context.fetch(request)
            if result.count > 0{
                return true
            }else{
                return false
            }

//            for i in 0 ..< data.count {
//                let id = data[i].value(forKey: "id") as? Int ?? 0
//                let name = data[i].value(forKey: "name") as? String ?? ""
//                let rating = data[i].value(forKey: "rating") as? Float ?? 0.0
//
//                let tv = FavouriteTVModel(id :id , name : name, rating: rating)
//                arr.append(tv)
//            }

//            return arr

        }catch {
            print("Failed")
        }

        return false
    }
    
    
    func removeFavourite(id : Int, completion : (()->Void)? = nil ) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteTV" )
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: " id = %i", id)
        do {
            let result = try context.fetch(request) as? [NSManagedObject] ?? []
            
            for res in result{
                context.delete(res)
            }
            
            do{
//                try context.save()
                completion?()
            }catch{
                print("Failed")
            }
                
              
            
        }catch {
            print("Failed")
        }
        
    }
    
    
    func saveImage(data: Data , id : Int) {
      
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return
        }
        do {
            try data.write(to: directory.appendingPathComponent("TV\(id).png")!)
        } catch {
            print(error.localizedDescription)
        }
    }
    
     func getSavedImage(id: Int, quality : JPEGQuality? = nil) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            let image = UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent("TV\(id)").path)
            return image
//            if let quality = quality,let img = image{
//                if let compressData = img.jpeg(quality){
//                    let image = UIImage(data: compressData)
//                    return image
//                }else{
//                    return img
//                }
//
//            }else{
//                return image
//            }
        }
        return nil
    }
}
