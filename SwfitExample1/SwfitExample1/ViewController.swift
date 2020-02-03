//
//  ViewController.swift
//  SwfitExample1
//
//  Created by cse on 2020. 2. 3..
//  Copyright © 2020년 cse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lbMsg: UILabel!
    
    @IBOutlet var tfInput: UITextField!
    @IBOutlet var lbTime: UILabel!
    @IBOutlet var subLayer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lbMsg.text = "Hello World"
        lbTime.text = "시간 날짜 장소"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doEnter(_ sender: Any) {
        
        lbMsg.text = "I love it"
        subLayer.backgroundColor = UIColor.gray
        
    }
    
    @IBAction func changeText(_ sender: Any) {
        lbMsg.text = tfInput.text
        
    }
}

