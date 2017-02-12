//
//  ViewController.swift
//  AHCarouselViewController
//
//  Created by Aaqib Hussain on 12/18/2016.
//  Copyright (c) 2016 Aaqib Hussain. All rights reserved.
//

import UIKit
import AHCarouselViewController

class ViewController: UIViewController , AHCarouselDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageUrl = ["http://i.dailymail.co.uk/i/pix/2016/02/23/05/3177D8C300000578-3459590-Me_ow_It_s_not_known_where_Colby_lives_although_he_is_often_dres-a-31_1456207181528.jpg","https://ig-s-b-a.akamaihd.net/hphotos-ak-xat1/t51.2885-15/e35/16583458_1682786262020497_3091610119285243904_n.jpg"]
        
//        let image : [UIImage]? = [UIImage(named:"coby")!, UIImage(named:"coby")!, UIImage(named:"coby")!, UIImage(named:"coby")!, UIImage(named:"coby")!, UIImage(named:"coby")!, UIImage(named:"coby")!]
//        let carousel = AHCarouselViewController(self.view.frame, carouselImages: image)

        let carousel = AHCarouselViewController(self.view.frame, carouselImagesUrl: imageUrl)
        carousel.delegate = self
        carousel.carouselAnimation = true
        carousel.pageIndicatorTintColor = UIColor.gray

        
        
        self.view.addSubview(carousel.view)
        self.addChildViewController(carousel)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //CarouselDelegate
    func carouselDidChange(carouselViewController: AHCarouselViewController, carousel: carouselView) {
        let pageWidth = carousel.frame.size.width
        let page = carousel.contentOffset.x / pageWidth
        print(page)
    }
    
}

