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
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            visualTestBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 165, bottom: 0, right: 0)
            colorBlindTestBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 245, bottom: 0, right: 0)
            astigmatismBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 180, bottom: 0, right: 0)
            duochromeBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 175, bottom: 0, right: 0)
            visualTestBtn.titleLabel!.font = UIFont(name: "HelveticaNeue-Bold", size: 72)
            colorBlindTestBtn.titleLabel!.font = UIFont(name: "HelveticaNeue-Bold", size: 72)
            astigmatismBtn.titleLabel!.font = UIFont(name: "HelveticaNeue-Bold", size: 72)
            duochromeBtn.titleLabel!.font = UIFont(name: "HelveticaNeue-Bold", size: 72)
            
        }
        else {
        
        visualTestBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        colorBlindTestBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 65, bottom: 0, right: 0)
        astigmatismBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0)
        duochromeBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0)
            
        }
        
        self.view.addSubview(bannerAdView)
        
        bannerAdView.adUnitID = "ca-app-pub-9715580163444023/1992608024"
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

