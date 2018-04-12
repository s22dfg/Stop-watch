//
//  ViewController.swift
//  Stop-watch
//
//  Created by D7703_19 on 2018. 4. 12..
//  Copyright © 2018년 s22dfg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var time: UILabel!
    @IBOutlet var mystop: UIButton!
    @IBOutlet var mystart: UIButton!
    @IBOutlet var myreset: UIButton!
    
    var count = 0
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // start button
    @IBAction func start(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in
            self.updateTime()
        })
    }
    
    // function time
    func updateTime() {
        count = count + 1
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        time.text = String(format: "%02d:%02d:%02d", min, sec, msec)
    }
    
    // stop button
    @IBAction func stop(_ sender: Any) {
        myTimer.invalidate()
        changebutton(btstart: true, btstop: false, btreset: true)
    }
    
    // bool 선언
    func changebutton(btstart:Bool, btstop:Bool, btreset:Bool) {
        mystart.isEnabled = btstart
        mystop.isEnabled = btstop
        myreset.isEnabled = btreset
    }
    
    // reset button
    @IBAction func reset(_ sender: Any) {
        myTimer.invalidate()
        count = 0
        time.text = "00:00:00"
        changebutton(btstart: true, btstop: true, btreset: false)
    }
}
