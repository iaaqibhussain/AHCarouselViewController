//
//  Extensions.swift
//  Pods
//
//  Created by Aaqib Hussain on 12/2/17.
//
//


import UIKit

extension  UIImageView {
    
    
    
    typealias imageDownloadCompletion = (NSError?) -> Void
    
    //Usage :- imageView.downloadImage(url) returns NSError on completion
    //Downloads and Caches images asynchronously. Uses from cache if already downloaded
    //Loads new images only if scrolled inside the list
    
    
    func downloadImage(_ url: URL , completion: @escaping imageDownloadCompletion){
        
        if containsImageInCache(url.absoluteString as NSString) == false{
            
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: {
                data, response, error in
                if error == nil {
                    if let  data = data,
                        let image = UIImage(data: data) {
                        AHCache.sharedInstance.setObject(
                            image,
                            forKey: url.absoluteString as NSString,
                            cost: data.count)
                        DispatchQueue.main.async {
                            self.image = image
                            completion(nil)
                        }
                    }
                }
                else{
                    if let error = error as? NSError{
                        completion(error)
                    }
                    
                }
            })
            task.resume()
            
        }
        
    }
    
    fileprivate func containsImageInCache(_ key: NSString) -> Bool{
        if (AHCache.sharedInstance.object(forKey: key)  == nil){
            debugPrint("Not in Cache so download:\(key)")
            return false
            
        }
        debugPrint("In Cache")
        return true
        
    }
    
    
}
