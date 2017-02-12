//
//  AHCache.swift
//  ImageCache
//
//  Created by Aaqib Hussain on 09/10/2016.
//  Copyright © 2016 Kode Snippets. All rights reserved.
//

import UIKit

class AHCache: NSObject {
    
    //Cache Memory can be adjusted from totalCostLimit
    static let sharedInstance : NSCache = {
    
        let cache = Cache()
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
