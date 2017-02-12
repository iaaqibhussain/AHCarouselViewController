//
//  AHCache.swift
//  Pods
//
//  Created by Aaqib Hussain on 12/2/17.
//
//


import UIKit

class AHCache: NSObject {
    
    //Cache Memory can be adjusted from totalCostLimit
    static let sharedInstance : NSCache<NSString,UIImage> = {
        
        let cache = NSCache<NSString,UIImage>()
        cache.name = "AHCache"
        cache.countLimit = 20
        cache.totalCostLimit = 20*1024*1024
        cache.evictsObjectsWithDiscardedContent = true
        return cache
        
        
    }()
    
    static func clearCache(){
        
        AHCache.sharedInstance.removeAllObjects()
        
    }
    
    
}
