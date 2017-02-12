//
//  Extenstions.swift
//  
//
//  Created by Aaqib Hussain on 09/10/2016.
//  Copyright © 2016 Kode Snippets. All rights reserved.
//

import UIKit

extension  UIImageView {
    
    

    typealias imageDownloadCompletion = (NSError?) -> Void
    
    //Usage :- imageView.downloadImage(url) returns NSError on completion
    //Downloads and Caches images asynchronously. Uses from cache if already downloaded
    //Loads new images only if scrolled inside the list
    
    
    func downloadImage(_ url: URL , completion: @escaping imageDownloadCompletion){
        
        if containsImageInCache(url.absoluteString) == false{
            
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: {
                data, response, error in
                if error == nil {
                    if let  data = data,
                        let image = UIImage(data: data) {
                        AHCache.sharedInstance.setObject(
                            image,
                            forKey: url.absoluteString,
                            cost: data.count)
                        DispatchQueue.main.async {
                            self.image = image
                            completion(nil)
                        }
                    }
                }
                else{
                    if let error = error{
                        completion(error as NSError?)
                    }
                    
                }
            }) 
            task.resume()
            
        }
        
    }
    
    fileprivate func containsImageInCache(_ key: String) -> Bool{
        if (AHCache.sharedInstance.object(forKey: key) as? UIImage == nil){
            debugPrint("Not in Cache so download:\(key)")
            return false
            
        }
        debugPrint("In Cache")
        return true
        
    }
    
    
}

extension URL {
    
    typealias dataFinishedDownloading = (AnyObject?, URLResponse? , NSError?) -> Void
    //Usage:- NSURL(url).fetchData
    //Downloads and Auto Cache JSON
    func fetchData(_ completion: @escaping dataFinishedDownloading){
        
        
        
        
        
        
        let task =  URLSession.shared.dataTask(with: self, completionHandler: { (data, response, error) in
            
            
            
            
            if  error == nil{
                if let fetchedData = data{
                    
                    do {
                        //If array run this
                        if  let jsonArray = try  JSONSerialization.jsonObject(with: fetchedData, options: .mutableContainers) as? NSArray{
                            //Cache array
                            AHCache.sharedInstance.setObject(
                                jsonArray,
                                forKey: self.absoluteString,
                                cost: fetchedData.count)
                            return  completion(jsonArray, response, nil)
                            
                            
                        }
                        //if dictionary run this
                        if  let jsonObject = try  JSONSerialization.jsonObject(with: fetchedData, options: .mutableContainers) as? NSDictionary{
                            //Cache Dictionary
                            AHCache.sharedInstance.setObject(
                                jsonObject,
                                forKey: self.absoluteString,
                                cost: fetchedData.count)
                            return  completion(jsonObject, response, nil)
                            
                        }
                        
                        
                    }
                    catch let error as NSError {
                        print(error.localizedDescription)
                        return  completion(nil, response, error)
                        
                    }
                    
                    
                }
                
                
            }
            else{
                
                
                return  completion(nil,response,error as NSError?)
            }
            
        })
        task.resume()
        
    }
    
    
    
    
}









