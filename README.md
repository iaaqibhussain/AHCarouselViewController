# AHCarouselViewController


[![Version](https://img.shields.io/cocoapods/v/AHCarouselViewController.svg?style=flat)](http://cocoapods.org/pods/AHCarouselViewController)
[![License](https://img.shields.io/cocoapods/l/AHCarouselViewController.svg?style=flat)](http://cocoapods.org/pods/AHCarouselViewController)
[![Platform](https://img.shields.io/cocoapods/p/AHCarouselViewController.svg?style=flat)](http://cocoapods.org/pods/AHCarouselViewController)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

AHCarouselViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "AHCarouselViewController"
```
Is installing pod too much work? Just download the repo, copy and paste AHCarouselViewController.swift in your project.

## Usage
Using AHCarouselViewController is pretty simple. 
<pre>
//If using pod, import AHCarouselViewController
        //Create and object 
        let carousel = AHCarouselViewController(self.view.frame, carouselImages: --image array goes here--)
        //Auto animate default time is 1 sec
        carousel.carouselAnimation = true
        //Change animation duration
        carousel.carouselAnimationTimeInterval = 4
        //Change Page Indicator color
        carousel.pageIndicatorTintColor = UIColor.black
        carousel.currentPageIndicatorTintColor = UIColor.white
        //Hide Page Indicator
        carousel.isPageIndicatorHidden = true
        //Delegate
        carousel.delegate = self
        
</pre>

## Protocol
Conform your class to protocol AHCarouselDelegate
<pre>
    //Get you the number of page you are currently on
    func carouselDidChange(carouselViewController: AHCarouselViewController, carousel: carouselView) {
        let pageWidth = carousel.frame.size.width
        let page = carousel.contentOffset.x / pageWidth
        print(page)
    }

</pre>

## Result
![alt tag](https://github.com/iaaqib/AHCarouselViewController/blob/master/Gif/carousel.gif)

## Author

Aaqib Hussain, iaaqibhussain@outlook.com

## License

AHCarouselViewController is available under the MIT license. See the LICENSE file for more info.
