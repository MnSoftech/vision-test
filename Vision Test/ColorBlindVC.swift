//
//  ColorBlindVC.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 07/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit

class ColorBlindVC: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var slideScrollView: UIScrollView!
    @IBOutlet weak var scrollHeightConstaint: NSLayoutConstraint!
    @IBOutlet weak var slidePageControl: UIPageControl!
    
    let slide1 = ["image": "ipad 1", "lable": "Hold at arm's lenght"]
    let slide2 = ["image": "ipad 2", "lable": "Keep head straight and the device in front of your eyes"]
    let slideiPhone1 = ["image": "1", "lable": "Hold at arm's lenght"]
    let slideiPhone2 = ["image": "2", "lable": "Keep head straight and the device in front of your eyes"]
    
    var slideArray = [Dictionary<String, String>]()
    var slideArrayiPhone = [Dictionary<String, String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            scrollHeightConstaint.constant = 600
        }
        slideArray = [slide1, slide2]
        slideArrayiPhone = [slideiPhone1, slideiPhone2]
        
        slideScrollView.isPagingEnabled = true
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone ) {
            slideScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(slideArrayiPhone.count), height: 305)
        } else if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad ) {
            slideScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(slideArray.count), height: 600)
        }
        slideScrollView.showsHorizontalScrollIndicator = false
        slideScrollView.delegate = self
        loadSlide()
    }
    
    func loadSlide() {
        
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            for (index, slide) in slideArray.enumerated() {
                if let slideViews = Bundle.main.loadNibNamed("slide", owner: self, options: nil)?.first as? SlideView {
                    slideViews.mainImage.image = UIImage(named: slide["image"]!)
                    slideViews.textLbl.text = slide["lable"]
                    slideScrollView.addSubview(slideViews)
                    slideViews.frame.size.width = self.view.bounds.width
                    slideViews.frame.origin.x =  CGFloat(index) * self.view.bounds.size.width
                }
            }
        }
        else {
            for (index, slide) in slideArrayiPhone.enumerated() {
                if let slideViews = Bundle.main.loadNibNamed("slideiPad", owner: self, options: nil)?.first as? SlideiPadView {
                    slideViews.slideiPadImage.image = UIImage(named: slide["image"]!)
                    slideViews.slideiPadLabel.text = slide["lable"]
                    slideScrollView.addSubview(slideViews)
                    slideViews.frame.size.width = self.view.bounds.width
                    slideViews.frame.origin.x =  CGFloat(index) * self.view.bounds.size.width
                }
            }
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        
        slidePageControl.currentPage = Int(page)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
