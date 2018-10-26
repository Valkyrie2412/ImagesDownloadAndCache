//
//  ViewController.swift
//  ImagesDownloadAndCache
//
//  Created by Hiếu Nguyễn on 8/12/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var refreshUI: UIActivityIndicatorView!
    @IBOutlet weak var photoView: UIImageView!
    
    var disPatchWorkItem: DispatchWorkItem?
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        refreshUI.startAnimating()
        
        downloadImage(urlString: "https://i.imgur.com/SlqIxoE.jpg")
        
        
//        downloadImage(urlString: "https://pre00.deviantart.net/cd87/th/pre/f/2018/049/b/5/7s_by_wlop-dc3mnhn.jpg")
        
        
//        downloadImageItem(from: "http://s1.picswalls.com/wallpapers/2016/06/10/4k-high-definition-wallpaper_065229159_309.jpg") { (image) in
//            self.photoView.image = image
//            self.refreshUI.isHidden = true
//            self.refreshUI.stopAnimating()
//        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        disPatchWorkItem?.cancel()
    }

    // Cach 1:

    func downloadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return  }
        if let cachedImage = CacheImage.images.object(forKey: url.absoluteString as NSString) as? UIImage {
            photoView.image = cachedImage
        } else {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        CacheImage.images.setObject(image, forKey: url.absoluteString as NSString)
                        DispatchQueue.main.async {
                            self.photoView.image = image
                            self.refreshUI.isHidden = true
                            self.refreshUI.stopAnimating()
                        }
                    }
                }
            }
        }
    }
    
    // Cach 2:
//    func downloadImageItem(from urlString: String, completedHandler: @escaping(UIImage?) -> Void) {
//        var image: UIImage?
//        disPatchWorkItem = DispatchWorkItem(block: {
//            guard let url = URL(string: urlString) else {return}
//            if let cachedImage = CacheImage.images.object(forKey: url.absoluteString as NSString) as? UIImage {
//                image = cachedImage
//            } else {
//                if let data = try? Data(contentsOf: url) {
//                        image = UIImage(data: data)
//                        CacheImage.images.setObject(image!, forKey: url.absoluteString as NSString)
//                }
//            }
//        })
//        DispatchQueue.global().async {
//            self.disPatchWorkItem?.perform()
//            DispatchQueue.main.async {
//                completedHandler(image)
//            }
//        }
//    }
    
    
    
    
    
}
