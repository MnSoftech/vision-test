//
//  LeftEyeAstigVC.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 08/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit
import GoogleMobileAds

class LeftEyeAstigVC: UIViewController {

   
    @IBOutlet weak var leftResultImage: UIImageView!
    @IBOutlet weak var rightResultImage: UIImageView!
    @IBOutlet weak var nativeExpressAds: GADNativeExpressAdView!
    @IBOutlet weak var nativeAds: GADNativeExpressAdView!
    @IBOutlet var leftSubView: UIView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var leftResulLabel: UILabel!
    @IBOutlet weak var rightResultLabel: UILabel!
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

        nativeAds.adUnitID = "ca-app-pub-9715580163444023/5312195496"
        nativeAds.rootViewController = self
        let requestAnother = GADRequest()
        nativeAds.load(requestAnother)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func readyBtn(_ sender: UIButton) {
        
        leftSubView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(leftSubView)
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
            calculateLeftEyeResult(value: correctCount)
            print("Result here")
        }
    }
    
    func calculateLeftEyeResult (value : Int) {
        let b = value * 100
        let result = b / 2
        leftResulLabel.text = "\(result)%"
        if result < 100 {
            leftResultImage.image = UIImage(named: "smile_bed")
        }
        
        if result == 100 {
            leftResultImage.image = UIImage(named: "smile_well")
        }

        resultView.isHidden = false
        appDelegate.myInterstitial8?.present(fromRootViewController: self)
    }
    
    func calculateRightEyeResult (value : Int) {
        let b = value * 100
        let result = b / 2
        rightResultLabel.text = "\(result)%"
        if result < 100 {
            rightResultImage.image = UIImage(named: "smile_bed")
        }
        
        if result == 100 {
            rightResultImage.image = UIImage(named: "smile_well")
        }

    }

    
    func PerformTest1 () {
        
        leftImageView.image = UIImage (named: "22")
        self.answerView.isHidden = true
        self.leftImageView.isHidden = false
        
        leftSubView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(leftSubView)
        constraintAdded()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.leftImageView.isHidden = true
            self.answerView.isHidden = false
        }
    }

    func constraintAdded()  {
        
        let leftSideConstraint = NSLayoutConstraint(item: leftSubView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: leftSubView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let widthConstraint = NSLayoutConstraint(item: leftSubView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint = NSLayoutConstraint(item: leftSubView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0.0)
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
