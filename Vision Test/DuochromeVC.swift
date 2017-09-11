//
//  DuochromeVC.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 11/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit

class DuochromeVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var slideScollView: UIScrollView!
    @IBOutlet weak var slidePageControl: UIPageControl!
    
    let slide1 = ["image": "1", "lable": "Hold at arm's lenght"]
    let slide2 = ["image": "2", "lable": "Keep head straight and the device in front of your eyes"]
    //let slide3 = ["image": "3", "lable": "Try to identify object, does it look blurry or clear?"]
    var slideArray = [Dictionary<String, String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        slideArray = [slide1, slide2]
        slideScollView.isPagingEnabled = true
        slideScollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(slideArray.count), height: 262)
        slideScollView.showsHorizontalScrollIndicator = false
        slideScollView.delegate = self
        loadSlide()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSlide() {
        for (index, slide) in slideArray.enumerated() {
            if let slideViews = Bundle.main.loadNibNamed("slide", owner: self, options: nil)?.first as? SlideView {
                slideViews.mainImage.image = UIImage(named: slide["image"]!)
                slideViews.textLbl.text = slide["lable"]
                slideScollView.addSubview(slideViews)
                slideViews.frame.size.width = self.view.bounds.width
                slideViews.frame.origin.x =  CGFloat(index) * self.view.bounds.size.width
                
            }
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        
        slidePageControl.currentPage = Int(page)
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
