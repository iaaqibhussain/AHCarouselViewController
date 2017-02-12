//
//  AHCache.swift
//  Pods
//
//  Created by Aaqib Hussain on 12/2/17.
//
//


import UIKit
import Foundation

public class AHCache: NSObject {
    
    var cache : NSCache<NSString,UIImage>
    static let sharedInstance = AHCache()
    
    //Cache Memory can be adjusted from totalCostLimit
    
   
    override init() {
        cache = NSCache<NSString,UIImage>()
        cache.name = "AHCache"
        cache.countLimit = 20
        cache.totalCostLimit = 20*1024*1024
        cache.evictsObjectsWithDiscardedContent = true
    }
//    static let sharedInstance : NSCache<NSString,UIImage> = {
//        
//        let cache = NSCache<NSString,UIImage>()
//        cache.name = "AHCache"
//        cache.countLimit = 20
//        cache.totalCostLimit = 20*1024*1024
//        cache.evictsObjectsWithDiscardedContent = true
//        return cache
//        
//        
//    }()
    
     func clearCache(){
        
        AHCache.sharedInstance.cache.removeAllObjects()
        
    }
    
    
}
