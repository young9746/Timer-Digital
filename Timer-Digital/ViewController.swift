//
//  ViewController.swift
//  Timer-Digital
//
//  Created by D7703_30 on 2018. 4. 11..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // timerSwitch는 한개는 아울렛 한개는 액션
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var timerSwitch: UISwitch!
    
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
         */
        timerSwitch.setOn(false, animated: true)
    }
    
    /* @objc */
    func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss a"
        formatter.dateFormat = "HH:mm:ss EE YYYY"
        timeLabel.text = formatter.string(from: date)
    }
    
    // 두번째 사용 스위치 액션으로 두기
    @IBAction func timerStarter(_ sender: Any) {
        // 클로저(closure)의 사용
        if timerSwitch.isOn == true {
            myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in self.updateTime()})
        } else {
            myTimer.invalidate()
        }
    }
}
