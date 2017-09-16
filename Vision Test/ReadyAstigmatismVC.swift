//
//  ReadyAstigmatismVC.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 08/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ReadyAstigmatismVC: UIViewController {

    @IBOutlet weak var nativeExpressAds: GADNativeExpressAdView!
    @IBOutlet var astigSubView: UIView!
    @IBOutlet weak var astagImageView: UIImageView!
    @IBOutlet weak var answerView: UIView!
    var testDone = 1
    var correctCount = 0
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        nativeExpressAds.adUnitID = "ca-app-pub-9715580163444023/5312195496"
        nativeExpressAds.rootViewController = self
        let request = GADRequest()
        nativeExpressAds.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        appDelegate.myInterstitial2?.present(fromRootViewController: self)
    }
    
    @IBAction func readyBtn(_ sender: UIButton) {
        
        astigSubView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(astigSubView)
        constraintAdded()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
            self.answerView.isHidden = false
        }
    }
    
    @IBAction func answerChoosed(_ sender: UIButton) {
        
        if (testDone == 1) {
            if sender.currentTitle == "All lines look the same" {
               correctCount = correctCount + 1
                    print(correctCount)
        }
            PerformTest1()
            testDone = 2
        }else if (testDone == 2){
            
            if sender.currentTitle == "All lines look the same" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            print("Result here")
            self.performSegue(withIdentifier: "leftScreen", sender: self)
        }
    }

    func PerformTest1 () {
        
        astagImageView.image = UIImage (named: "22")
        self.answerView.isHidden = true
        self.astagImageView.isHidden = false
        
        astigSubView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(astigSubView)
        constraintAdded()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.astagImageView.isHidden = true
            self.answerView.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "leftScreen"  {
            let nextVC = (segue.destination as! LeftEyeAstigVC)
            nextVC.calculateRightEyeResult(value: correctCount)
        }

    }
    
    func constraintAdded()  {
        
        let leftSideConstraint = NSLayoutConstraint(item: astigSubView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: astigSubView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let widthConstraint = NSLayoutConstraint(item: astigSubView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint = NSLayoutConstraint(item: astigSubView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraints([leftSideConstraint, bottomConstraint, heightConstraint, widthConstraint])
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
