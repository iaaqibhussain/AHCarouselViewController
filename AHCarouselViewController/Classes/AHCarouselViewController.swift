//
//  AHCarouselViewController.swift
//  Carousel
//
//  Created by Aaqib Hussain on 10/12/16.
//  Copyright © 2016 Aaqib Hussain. All rights reserved.
//

import UIKit

 @objc public protocol AHCarouselDelegate {
    @objc optional func carouselDidChange(carouselViewController :AHCarouselViewController , carousel: carouselView)
}

public typealias carouselView = UIScrollView
public class AHCarouselViewController: UIViewController, UIScrollViewDelegate {
    
    private var carouselImages : [UIImage]?
    var scrollView : UIScrollView!
    var pageControl : UIPageControl!
    public var delegate : AHCarouselDelegate?
    private var pageCount : Int = -1
    
    
    /**
     * For changing time interval during animtion, works only if carouselAnimation property is set to true
     */
    public var carouselAnimationTimeInterval : TimeInterval{
        willSet(timeInterval){
            if (carouselAnimation){
                self.timer?.invalidate()
                self.timer = Timer.scheduledTimer(timeInterval: timeInterval , target: self, selector: #selector(self.updateImage), userInfo: nil, repeats: true)
            }
        }
        
        
    }
    /**
     * Starts auto animating if set to true with delay of 1 second
     */
    public var carouselAnimation : Bool {
        willSet(value){
            if (value){
                self.timer = Timer.scheduledTimer(timeInterval: 1 , target: self, selector: #selector(self.updateImage), userInfo: nil, repeats: true)
                
            }
        }
    }
    private var timer : Timer?
    
    /**
     *Changes Page Indicator Tint Color
     */
    public var pageIndicatorTintColor : UIColor{
        willSet(tintColor){
            
            pageControl.pageIndicatorTintColor = tintColor
            
            
        }
        
        
    }
    /**
     *Changes current Page Indicator Color
     */
    public var currentPageIndicatorTintColor : UIColor{
        willSet(tintColor){
            
            pageControl.currentPageIndicatorTintColor = tintColor
            
            
        }
        
        
    }
    /**
     *Hides Page Indicator
     */
    public var isPageIndicatorHidden : Bool{
        
        willSet(value){
            
            pageControl.isHidden = value
            
        }
        
    }
    
    //MARK: Init functions
    init() {
        self.carouselAnimationTimeInterval = 1
        self.carouselAnimation = false
        self.pageIndicatorTintColor = UIColor.gray
        self.currentPageIndicatorTintColor = UIColor.white
        self.isPageIndicatorHidden = false
        super.init(nibName: nil, bundle: nil)
        
    }
    public convenience init(_ frame: CGRect? , carouselImages : [UIImage]?){
        
        self.init()
        
        print(#function)
        if let carouselFrame = frame{
            self.scrollView = UIScrollView()
            self.scrollView.showsHorizontalScrollIndicator = false
            self.scrollView.frame = carouselFrame
            // self.scrollView.delegate = self
            print(self.scrollView!.frame)
        }
        if let carousel = carouselImages{
            self.carouselImages = [UIImage]()
            self.carouselImages = carousel
        }
        if let noOfPages = carouselImages{
            pageControl = UIPageControl()
            pageControl.frame = CGRect(x: self.scrollView.frame.size.width / 2 - 13 * CGFloat(noOfPages.count) / 2, y: self.scrollView.frame.maxY - 37, width: 13 * CGFloat(noOfPages.count), height: 37)
            pageControl.pageIndicatorTintColor = UIColor.white
            pageControl.currentPage = 0
            pageControl.numberOfPages = noOfPages.count
            
        }
        
        print("Carousel Images:\(carouselImages?.count)")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override public func viewDidLoad() {
        
        
        for i in 0  ..< self.carouselImages!.count{
            let imageView = UIImageView()
            imageView.frame = CGRect(x: self.scrollView.frame.size.width * CGFloat(i), y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height)
            
            if let image = carouselImages?[i]{
                imageView.image = image
                
            }
            self.scrollView.addSubview(imageView)
        }
        self.scrollView.isPagingEnabled = true
        self.scrollView.isScrollEnabled = true
        self.scrollView.delegate = self
        
        self.view.addSubview(self.scrollView)
        self.view.addSubview(self.pageControl)
        
        
    }
    override public func viewDidDisappear(_ animated: Bool) {
        if let timer = self.timer{
            if (timer.isValid){
                timer.invalidate()
                
            }
        }
    }
    override public func viewDidLayoutSubviews() {
        self.scrollView.contentSize.width = self.scrollView.frame.size.width * CGFloat(self.carouselImages!.count)
        
    }
    
    //MARK:ScrollDelegate
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if !self.carouselAnimation{
            let pageWidth = scrollView.frame.size.width
            let page = scrollView.contentOffset.x / pageWidth
            
            self.pageControl.currentPage = Int(page)
            if CGFloat(page + 1) > CGFloat(self.carouselImages!.count){
                scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            }
            else if page < 0{
                scrollView.setContentOffset(CGPoint(x: scrollView.frame.size.width * CGFloat(self.carouselImages!.count - 1), y: 0), animated: true)
                
                
            }
        }
        //Passing data to carousel delegate
        delegate!.carouselDidChange!(carouselViewController: self, carousel: scrollView)
        
    }
    //MARK: Animation function
    @objc private func updateImage(){
        
        if pageCount < self.carouselImages!.count - 1{
            self.pageCount += 1
            scrollView.setContentOffset(CGPoint(x: scrollView.frame.size.width * CGFloat(pageCount), y: 0), animated: true)
            
            
        }
            
        else {
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            self.pageCount = -1
        }
        print("Count:\(pageCount)")
        self.pageControl.currentPage = pageCount
        
    }
    deinit {
        if let timer = self.timer{
        if (timer.isValid){
            timer.invalidate()
            
        }
    }
    }
    
}
