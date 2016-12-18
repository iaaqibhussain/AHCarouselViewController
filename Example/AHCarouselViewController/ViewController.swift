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
        
        
        let image : [UIImage]? = [UIImage(named:"coby")!, UIImage(named:"coby")!, UIImage(named:"coby")!, UIImage(named:"coby")!, UIImage(named:"coby")!, UIImage(named:"coby")!, UIImage(named:"coby")!]
        let carousel = AHCarouselViewController(self.view.frame, carouselImages: image)
        carousel.delegate = self
        carousel.carouselAnimation = true
        carousel.carouselAnimationTimeInterval = 4
        carousel.pageIndicatorTintColor = UIColor.black
        carousel.currentPageIndicatorTintColor = UIColor.white
        
        
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

