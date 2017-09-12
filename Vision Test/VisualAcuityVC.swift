//
//  VisualAcuityVC.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 07/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit
import GoogleMobileAds

class VisualAcuityVC: UIViewController {
    
    var interstitial: GADInterstitial!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/1033173712")
       // let request = GADRequest()
       // interstitial.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startBtn(_ sender: UIButton) {
        
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
