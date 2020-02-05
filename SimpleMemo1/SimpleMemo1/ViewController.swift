//
//  ViewController.swift
//  SimpleMemo1
//
//  Created by cse on 2020. 2. 4..
//  Copyright © 2020년 cse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "메모 목록"
        list = UserDataManager.shared.getList(with: UserDataManager.LIST_KEY_DEFAULT)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeNewDate()->TimeInterval{
        let date = Date()
        return date.timeIntervalSince1970
    }
    
    @IBAction func addMemo(_ sender: Any) {
        let newtime = makeNewDate()
        list.append(newtime)
        if UserDataManager.shared.saveList(with: UserDataManager.LIST_KEY_DEFAULT, list: list){
            self.table.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    
    func timeString(time:TimeInterval)->String{
        let date = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        let timezone = TimeZone.current.abbreviation() ?? "CET"
        //get current TimeZone abbreviation or set to CET
        dateFormatter.timeZone = TimeZone(abbreviation: timezone)
        //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd.MM.YYYY HH:mm:ss.SSSS"
        //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
    var list:[TimeInterval] = []
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = timeString(time: list[indexPath.row])
        //indexPath는 cell의 위치를 나타내는 거임...
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let timeStamp = list[indexPath.row]
        if let vc = self.storyboard?.instantiateViewController(withIdentifier:"MemoVC") as? MemoVC{
            vc.timestamp = timeStamp
            self.navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let action = UITableViewRowAction(style: .destructive, title: "DELETE") { (action, indexPath) in
            self.list.remove(at: indexPath.row)
            //self.table.reloadSections(IndexSet(0...0), with: .automatic)
            if UserDataManager.shared.saveList(with: UserDataManager.LIST_KEY_DEFAULT, list: self.list){
                self.table.reloadSections(IndexSet(0...0), with: .automatic)
            }
            //reloadSection은 해당 섹션 구역만을 초기화해줌.
        }
        
        return [action]
    }
    
    
    
    
}





















