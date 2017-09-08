//
//  LeftEyeAstigVC.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 08/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit

class LeftEyeAstigVC: UIViewController {

   
    @IBOutlet var leftSubView: UIView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var leftResulLabel: UILabel!
    @IBOutlet weak var rightResultLabel: UILabel!
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
        
        self.view.addSubview(leftSubView)
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
        resultView.isHidden = false
    }
    
    func calculateRightEyeResult (value : Int) {
        let b = value * 100
        let result = b / 2
        rightResultLabel.text = "\(result)%"
    }

    
    func PerformTest1 () {
        
        leftImageView.image = UIImage (named: "22")
        self.answerView.isHidden = true
        self.leftImageView.isHidden = false
        self.view.addSubview(leftSubView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.leftImageView.isHidden = true
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
