//
//  AlarmDetailVC.swift
//  SimpleMemo1
//
//  Created by cse on 2020. 2. 5..
//  Copyright © 2020년 cse. All rights reserved.
//

import UIKit

class AlarmDetailVC: UIViewController {
    
    @IBOutlet var picker: UIDatePicker!
    
    @IBOutlet var save: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Alarm"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDate(_ sender: Any) {
        
    }
    
    @IBAction func saveAlarm(_ sender: Any) {
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh"
        let hour: String = dateFormatter.string(from: picker.date)
        dateFormatter.dateFormat = "mm"
        let minute:String = dateFormatter.string(from: picker.date)
        
        Utils.shared.makeTimeNotification(hour: hour, minute: minute)
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
