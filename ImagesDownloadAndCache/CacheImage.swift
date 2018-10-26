//
//  CacheImage.swift
//  ImagesDownloadAndCache
//
//  Created by Hiếu Nguyễn on 8/13/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import Foundation

class CacheImage {
    static var images: NSCache<NSString, AnyObject> = {
        var result = NSCache<NSString, AnyObject>()
        result.totalCostLimit = 20
        result.countLimit = 10 * 1024 * 1024
        return result
    }()
}
