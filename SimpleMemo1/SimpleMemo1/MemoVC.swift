//
//  MemoVC.swift
//  SimpleMemo1
//
//  Created by cse on 2020. 2. 4..
//  Copyright © 2020년 cse. All rights reserved.
//

import UIKit

class MemoVC: UIViewController {
    @IBOutlet var slider: UISlider!
    
    @IBOutlet var tvMemoInput: UITextView!
    var timestamp:TimeInterval!
    
    
    @IBOutlet var textEnabler: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMemoText()
        registerForKeyboardNotifications()
        

        // Do any additional setup after loading the view.
    }
    @IBAction func doEnable(_ sender: UISwitch) {
        tvMemoInput.isEditable = sender.isOn
        tvMemoInput.isSelectable = sender.isOn //복사도 안됨 ㅋㅋ
    }
    @IBAction func changeTextSize(_ sender: UISlider) {
        let value = sender.value
        let size = 13.0 + (20.0*value)
        
        tvMemoInput.font = .systemFont(ofSize:CGFloat(size))
        tvMemoInput.layoutIfNeeded() //layout 크기가 즉시 변경 되게끔 해준다
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setMemoText(){
        let str = Utils.shared.timeString(time: timestamp)
        self.title = str
        let txt = UserDataManager.shared.getMemo(with: str)
        self.tvMemoInput.text = txt
    }
    
    @IBAction func doSaveMemo(_ sender: Any) {
        let str = Utils.shared.timeString(time: timestamp)
        if UserDataManager.shared.saveMemo(with: str, memo: tvMemoInput.text) {
            self.navigationController?.popViewController(animated: true)
            Utils.shared.completeSaveNotification()
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
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardFrame.height, right: 0.0)
        tvMemoInput.contentInset = contentInsets
        tvMemoInput.scrollIndicatorInsets = contentInsets
        
        // 활성화된 텍스트 필드가 키보드에 의해 가려진다면 가려지지 않도록 스크롤한다.
        // 이 부분은 상황에 따라 불필요할 수 있다.
        //        var rect = self.view.frame
        //        rect.size.height -= keyboardFrame.height
        ////        if rect.contains(activeField.frame.origin) {
        ////            scrollView.scrollRectToVisible(activeField.frame, animated: true)
        ////        }
    }
    
    // 이 메서드는 UIKeyboardWillHide 노티피케이션을 받으면 호출된다.
    @objc func keyboardWillHide(_ notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        tvMemoInput.contentInset = contentInsets
        tvMemoInput.scrollIndicatorInsets = contentInsets
    }

}
