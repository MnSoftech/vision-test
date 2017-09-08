//
//  ViewController.swift
//  Vision Test
//
//  Created by Muhammad Noaman on 06/09/2017.
//  Copyright © 2017 MnSoftech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var visualTestBtn: UIButton!
    @IBOutlet weak var colorBlindTestBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        visualTestBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 65, bottom: 0, right: 0)
        colorBlindTestBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 75, bottom: 0, right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func visualTestBtn(_ sender: UIButton) {
        
        
    }

    @IBAction func ColorBlindBtn(_ sender: UIButton) {
        
        
    }

}

