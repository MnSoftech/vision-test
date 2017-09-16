//
//  LeftEyeVisualAcuityVC.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 07/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit
import GoogleMobileAds

class LeftEyeVisualAcuityVC: UIViewController {

    
    @IBOutlet weak var rightEyeImage: UIImageView!
    @IBOutlet weak var leftEyeImage: UIImageView!
    @IBOutlet weak var nativeExpressAds: GADNativeExpressAdView!
    @IBOutlet weak var answerView: UIView!
    @IBOutlet var lableView: UIView!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var lableViewText: UILabel!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var rightEyeResultLabel: UILabel!
    @IBOutlet weak var leftEyeResultLabel: UILabel!
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
    
    @IBAction func readyBtn(_ sender: UIButton) {
        PerformTest1()
    }
    
    @IBAction func answerChoosed(_ sender: UIButton) {
        if (testDone == 1) {
            if sender.currentTitle == "N" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest2()
            testDone = 2
        }else if (testDone == 2) {
            if sender.currentTitle == "F" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest3()
            testDone = 3
        }else if (testDone == 3) {
            if sender.currentTitle == "Q" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest4()
            testDone = 4
        }else if (testDone == 4) {
            if sender.currentTitle == "D" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest5()
            testDone = 5
        }else if (testDone == 5) {
            if sender.currentTitle == "B" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            calculateLeftEyeResult(value: correctCount)
            //resultView.isHidden = false
        }
    }
    
    func calculateLeftEyeResult (value : Int) {
        let b = value * 100
        let result = b / 5
        leftEyeResultLabel.text = "\(result)%"
        if result < 100 {
            leftEyeImage.image = UIImage(named: "smile_bed")
        }
        
        if result == 100 {
            leftEyeImage.image = UIImage(named: "smile_well")
        }
        resultView.isHidden = false
        appDelegate.myInterstitial6?.present(fromRootViewController: self)
    }
    
    func calculateRightEyeResult (value : Int) {
        
        let b = value * 100
        let rightResult = b / 5
        rightEyeResultLabel.text = "\(rightResult)%"
        if rightResult < 100 {
            rightEyeImage.image = UIImage(named: "smile_bed")
        }
        if rightResult == 100 {
            rightEyeImage.image = UIImage(named: "smile_well")
        }
    }
    
    func PerformTest1 () {
        
        lableViewText.text = "N"
        
        lableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lableView)
        constraintAdded()
        
        self.btn1.setTitle("L", for: .normal)
        self.btn2.setTitle("J", for: .normal)
        self.btn3.setTitle("W", for: .normal)
        self.btn4.setTitle("N", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.answerView.isHidden = false
        }
    }
    
    func PerformTest2 () {
        
        lableViewText.text = "F"
        lableViewText.font = lableViewText.font.withSize(72)
        self.answerView.isHidden = true
        
        lableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lableView)
        constraintAdded()
        
        self.btn1.setTitle("N", for: .normal)
        self.btn2.setTitle("F", for: .normal)
        self.btn3.setTitle("C", for: .normal)
        self.btn4.setTitle("E", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.answerView.isHidden = false
        }
    }
    
    func PerformTest3 () {
        
        lableViewText.text = "Q"
        lableViewText.font = lableViewText.font.withSize(31)
        self.answerView.isHidden = true
        
        lableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lableView)
        constraintAdded()
        
        self.btn1.setTitle("Q", for: .normal)
        self.btn2.setTitle("P", for: .normal)
        self.btn3.setTitle("O", for: .normal)
        self.btn4.setTitle("D", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.answerView.isHidden = false
        }
    }
    
    func PerformTest4 () {
        
        lableViewText.text = "D"
        lableViewText.font = lableViewText.font.withSize(15)
        self.answerView.isHidden = true
        
        lableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lableView)
        constraintAdded()
        
        self.btn1.setTitle("G", for: .normal)
        self.btn2.setTitle("P", for: .normal)
        self.btn3.setTitle("D", for: .normal)
        self.btn4.setTitle("B", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.answerView.isHidden = false
        }
    }
    
    func PerformTest5 () {
        
        lableViewText.text = "B"
        lableViewText.font = lableViewText.font.withSize(7.5)
        self.answerView.isHidden = true
        
        lableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lableView)
        constraintAdded()
        
        self.btn1.setTitle("D", for: .normal)
        self.btn2.setTitle("L", for: .normal)
        self.btn3.setTitle("Z", for: .normal)
        self.btn4.setTitle("B", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.answerView.isHidden = false
        }
    }
    
    func constraintAdded()  {
        
        let leftSideConstraint = NSLayoutConstraint(item: lableView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: lableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let widthConstraint = NSLayoutConstraint(item: lableView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint = NSLayoutConstraint(item: lableView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0.0)
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
