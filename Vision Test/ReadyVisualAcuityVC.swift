//
//  ReadyVisualAcuityVC.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 07/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit
//import GoogleMobileAds

class ReadyVisualAcuityVC: UIViewController {

    
    @IBOutlet var lableTextView: UIView!
    @IBOutlet weak var lableViewText: UILabel!
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    var correctCount = 0
    var testDone = 1
    
    
    
    //var interstitial: GADInterstitial!

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        appDelegate.myInterstitial1?.present(fromRootViewController: self)
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
            if sender.currentTitle == "M" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest2()
            testDone = 2
        }else if (testDone == 2) {
            if sender.currentTitle == "W" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest3()
            testDone = 3
        }else if (testDone == 3) {
            if sender.currentTitle == "R" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest4()
            testDone = 4
        }else if (testDone == 4) {
            if sender.currentTitle == "E" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest5()
            testDone = 5
        }else if (testDone == 5) {
            if sender.currentTitle == "C" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            self.performSegue(withIdentifier: "leftTestStart", sender: self)
            
        }
    }
    
    func PerformTest1 () {
        
        lableViewText.text = "M"
        
        lableTextView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lableTextView)
        constraintAdded()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.btn1.setTitle("M", for: .normal)
            self.btn2.setTitle("N", for: .normal)
            self.btn3.setTitle("T", for: .normal)
            self.btn4.setTitle("Q", for: .normal)
            self.answerView.isHidden = false
        }
    }
    
    func PerformTest2 () {
        
        lableViewText.text = "W"
        lableViewText.font = lableViewText.font.withSize(72)
        self.answerView.isHidden = true
        
        lableTextView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lableTextView)
        constraintAdded()

        self.btn1.setTitle("N", for: .normal)
        self.btn2.setTitle("W", for: .normal)
        self.btn3.setTitle("P", for: .normal)
        self.btn4.setTitle("A", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.answerView.isHidden = false
        }
    }
    
    func PerformTest3 () {
        
        lableViewText.text = "R"
        lableViewText.font = lableViewText.font.withSize(31)
        self.answerView.isHidden = true
        
        lableTextView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lableTextView)
        constraintAdded()

        self.btn1.setTitle("V", for: .normal)
        self.btn2.setTitle("P", for: .normal)
        self.btn3.setTitle("R", for: .normal)
        self.btn4.setTitle("Z", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.answerView.isHidden = false
        }
    }
    
    func PerformTest4 () {
        
        lableViewText.text = "E"
        lableViewText.font = lableViewText.font.withSize(15)
        self.answerView.isHidden = true
        
        lableTextView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lableTextView)
        constraintAdded()

        self.btn1.setTitle("G", for: .normal)
        self.btn2.setTitle("S", for: .normal)
        self.btn3.setTitle("E", for: .normal)
        self.btn4.setTitle("W", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.answerView.isHidden = false
        }
    }
    
    func PerformTest5 () {
        
        lableViewText.text = "C"
        lableViewText.font = lableViewText.font.withSize(7.5)
        self.answerView.isHidden = true
        
        lableTextView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lableTextView)
        constraintAdded()

        self.btn1.setTitle("G", for: .normal)
        self.btn2.setTitle("C", for: .normal)
        self.btn3.setTitle("O", for: .normal)
        self.btn4.setTitle("M", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.answerView.isHidden = false
        }
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "leftTestStart"  {
            let nextVC = (segue.destination as! LeftEyeVisualAcuityVC)
            nextVC.calculateRightEyeResult(value: correctCount)
        }
    }
    
    func constraintAdded()  {
        
        let leftSideConstraint = NSLayoutConstraint(item: lableTextView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: lableTextView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let widthConstraint = NSLayoutConstraint(item: lableTextView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint = NSLayoutConstraint(item: lableTextView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0.0)
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
