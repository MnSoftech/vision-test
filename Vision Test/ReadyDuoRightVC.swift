//
//  ReadyDuoRightVC.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 11/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit

class ReadyDuoRightVC: UIViewController {

    @IBOutlet var duoSubView: UIView!
    @IBOutlet weak var duoImageView: UIImageView!
    @IBOutlet weak var answerView: UIView!
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
        
        self.view.addSubview(duoSubView)
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
            print("Result here")
            self.performSegue(withIdentifier: "showLeftDuo", sender: self)
        }

    }
    
    func PerformTest1 () {
        
        duoImageView.image = UIImage (named: "32")
        self.answerView.isHidden = true
        self.duoImageView.isHidden = false
        self.view.addSubview(duoImageView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.duoImageView.isHidden = true
            self.answerView.isHidden = false
        }
    }
    
    func PerformTest2 () {
        
        duoImageView.image = UIImage (named: "33")
        self.answerView.isHidden = true
        self.duoImageView.isHidden = false
        self.view.addSubview(duoImageView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.duoImageView.isHidden = true
            self.answerView.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLeftDuo" {
            let nextVC = (segue.destination as! ReadyDuoLeftVC)
            nextVC.calculateRightEyeResult(value: correctCount)
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
