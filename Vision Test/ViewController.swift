//
//  ViewController.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 06/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    
    @IBOutlet weak var visualTestBtn: UIButton!
    @IBOutlet weak var colorBlindTestBtn: UIButton!
    @IBOutlet weak var astigmatismBtn: UIButton!
    @IBOutlet weak var duochromeBtn: UIButton!
    var bannerView: GADBannerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        visualTestBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 0)
        colorBlindTestBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 65, bottom: 0, right: 0)
        astigmatismBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 0)
        duochromeBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 0)
        
         bannerView = GADBannerView(adSize: kGADAdSizeFullBanner)
        bannerView.frame = CGRect(x:0.0,
                              y:self.view.frame.size.height - bannerView.frame.size.height,
                              width:bannerView.frame.size.width,
                            height:bannerView.frame.size.height)
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bannerView)
        
        let leftSideConstraint = NSLayoutConstraint(item: bannerView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: bannerView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let rightConstraint = NSLayoutConstraint(item: bannerView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0.0)
        view.addConstraints([leftSideConstraint, bottomConstraint, rightConstraint])
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        //bannerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

