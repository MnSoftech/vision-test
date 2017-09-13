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

    
    @IBOutlet weak var bannerAdView: GADBannerView!
    @IBOutlet weak var visualTestBtn: UIButton!
    @IBOutlet weak var colorBlindTestBtn: UIButton!
    @IBOutlet weak var astigmatismBtn: UIButton!
    @IBOutlet weak var duochromeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        visualTestBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 0)
        colorBlindTestBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 65, bottom: 0, right: 0)
        astigmatismBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 0)
        duochromeBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 0)
        
        self.view.addSubview(bannerAdView)
        
        bannerAdView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
        bannerAdView.rootViewController = self
        bannerAdView.load(GADRequest())
        
        //nativeExpressAdView.adUnitID = "ca-app-pub-3940256099942544/4270592515"
        //nativeExpressAdView.rootViewController = self
        
       // let request = GADRequest()
       // nativeExpressAdView.load(request)
        //bannerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

