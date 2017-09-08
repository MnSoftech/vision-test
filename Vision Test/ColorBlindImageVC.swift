//
//  ColorBlindImageVC.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 08/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit

class ColorBlindImageVC: UIViewController {

    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet var imageSubView: UIView!
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    var testDone = 0
    var correctCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if testDone == 0 {
            firstTimeCall()
        }
        
        
    }

    func firstTimeCall () {
        self.view.addSubview(imageSubView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.btn1.setTitle("4", for: .normal)
            self.btn2.setTitle("8", for: .normal)
            self.btn3.setTitle("3", for: .normal)
            self.btn4.setTitle("6", for: .normal)
            self.answerView.isHidden = false
            self.testDone = 1
        }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answerChoosed(_ sender: UIButton) {
        
        if (testDone == 1) {
            if sender.currentTitle == "8" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest2()
            testDone = 2
        }else if (testDone == 2) {
            if sender.currentTitle == "12" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest3()
            testDone = 3
        }else if (testDone == 3) {
            if sender.currentTitle == "3" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest4()
            testDone = 4
        }else if (testDone == 4) {
            if sender.currentTitle == "5" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest5()
            testDone = 5
        }
        else if (testDone == 5) {
            if sender.currentTitle == "29" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            calculateResult(value: correctCount)
            print("result has to be shown")
            
        }
    }
    
    func calculateResult (value : Int) {
        
        let b = value * 100
        let result = b / 5
        resultLabel.text = "\(result)%"
        resultView.isHidden = false
    }
    
    func PerformTest2 () {
        
        showImage.image = UIImage (named: "12")
        self.answerView.isHidden = true
        self.view.addSubview(showImage)
        self.btn1.setTitle("12", for: .normal)
        self.btn2.setTitle("2", for: .normal)
        self.btn3.setTitle("21", for: .normal)
        self.btn4.setTitle("1", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showImage.isHidden = true
            self.answerView.isHidden = false
        }
    }
    
    func PerformTest3 () {
        
        showImage.image = UIImage (named: "13")
        self.answerView.isHidden = true
        self.showImage.isHidden = false
        self.view.addSubview(showImage)
        self.btn1.setTitle("31", for: .normal)
        self.btn2.setTitle("35", for: .normal)
        self.btn3.setTitle("3", for: .normal)
        self.btn4.setTitle("13", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showImage.isHidden = true
            self.answerView.isHidden = false
        }
    }
    
    func PerformTest4 () {
        
        showImage.image = UIImage (named: "14")
        self.answerView.isHidden = true
        self.showImage.isHidden = false
        self.view.addSubview(showImage)
        self.btn1.setTitle("25", for: .normal)
        self.btn2.setTitle("55", for: .normal)
        self.btn3.setTitle("5", for: .normal)
        self.btn4.setTitle("15", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showImage.isHidden = true
            self.answerView.isHidden = false
        }

    }
    func PerformTest5 () {
        
        showImage.image = UIImage (named: "15")
        self.answerView.isHidden = true
        self.showImage.isHidden = false
        self.view.addSubview(showImage)
        self.btn1.setTitle("29", for: .normal)
        self.btn2.setTitle("99", for: .normal)
        self.btn3.setTitle("19", for: .normal)
        self.btn4.setTitle("92", for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showImage.isHidden = true
            self.answerView.isHidden = false
        }
        
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
