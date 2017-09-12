//
//  ReadyDuoLeftVC.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 11/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit

class ReadyDuoLeftVC: UIViewController {

    @IBOutlet var douSubView: UIView!
    @IBOutlet weak var duoImageView: UIImageView!
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var resultSubView: UIView!
    @IBOutlet weak var rightResultLabel: UILabel!
    @IBOutlet weak var leftResultLabel: UILabel!
    var testDone = 1
    var correctCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func readyBtn(_ sender: UIButton) {
        
        douSubView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(douSubView)
        constraintAdded()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
            self.answerView.isHidden = false
        }

    }

    @IBAction func choosedBtn(_ sender: UIButton) {
        if (testDone == 1) {
            if sender.currentTitle == "No Difference" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest1()
            testDone = 2
        }else if (testDone == 2) {
            if sender.currentTitle == "No Difference" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            PerformTest2()
            testDone = 3
        }else if (testDone == 3){
            
            if sender.currentTitle == "No Difference" {
                correctCount = correctCount + 1
                print(correctCount)
            }
            calculateLeftEyeResult(value: correctCount)
            print("Result here")
        }

    }
    
    func calculateLeftEyeResult (value : Int) {
        let b = value * 100
        let result = b / 3
        leftResultLabel.text = "\(result)%"
        resultSubView.isHidden = false
    }
    
    func calculateRightEyeResult (value : Int) {
        let b = value * 100
        let result = b / 3
        rightResultLabel.text = "\(result)%"
    }

    
    func PerformTest1 () {
        
        duoImageView.image = UIImage (named: "35")
        self.answerView.isHidden = true
        self.duoImageView.isHidden = false
        
        douSubView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(douSubView)
        constraintAdded()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.duoImageView.isHidden = true
            self.answerView.isHidden = false
        }
    }
    
    func PerformTest2 () {
        
        duoImageView.image = UIImage (named: "36")
        self.answerView.isHidden = true
        self.duoImageView.isHidden = false
        
        douSubView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(douSubView)
        constraintAdded()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.duoImageView.isHidden = true
            self.answerView.isHidden = false
        }
    }
    
    func constraintAdded()  {
        
        let leftSideConstraint = NSLayoutConstraint(item: douSubView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: douSubView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let widthConstraint = NSLayoutConstraint(item: douSubView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0)
        let heightConstraint = NSLayoutConstraint(item: douSubView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0.0)
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