//
//  ReadyAstigmatismVC.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 08/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit

class ReadyAstigmatismVC: UIViewController {

    @IBOutlet var astigSubView: UIView!
    @IBOutlet weak var astagImageView: UIImageView!
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
        
        self.view.addSubview(astigSubView)
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
        self.view.addSubview(astagImageView)
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
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
