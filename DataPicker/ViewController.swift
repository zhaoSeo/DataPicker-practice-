//
//  ViewController.swift
//  DataPicker
//
//  Created by Sang won Seo on 2018. 3. 15..
//  Copyright © 2018년 Sang won Seo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datetext: UILabel!
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var time: UILabel!
    var timer = Timer();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in
            self.updatetime()})
        
    }
    
    @IBAction func btu(_ sender: Any) {
        view.backgroundColor = UIColor.white
        
    }
    
    
    @IBAction func datepicker(_ sender: Any) {
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "ko_KR")
        dateformatter.dateFormat="yyyy-MM-dd a HH:mm:ss EEE"
        let date = dateformatter.string(from: datepicker.date)
        datetext.text = date
        
        
        
    }
    func updatetime(){
        let date1 = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd a HH:mm:ss EEE"
        let time1 = formatter.string(from: date1)
        time.text = time1
        if datetext.text == time.text{
            view.backgroundColor = UIColor.red
            alert()
        }
        
    }
    func alert(){
        let alert = UIAlertController(title: "알람", message: "취소하시겠습니까?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: {(action: UIAlertAction!) in self.view.backgroundColor = UIColor.white})
        let no = UIAlertAction(title: "취소", style: .default, handler:nil)
        alert.addAction(ok)
        alert.addAction(no)
        
        self.present(alert,animated: true,completion: nil)
    }
}

