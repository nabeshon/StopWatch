//
//  ViewController.swift
//  StopWatch
//
//  Created by 渡邉昇 on 2022/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var resultLabel: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func up() {
        //countを0.01足す
        count = count + 0.01
        //ラベルに小数点以下2桁まで表示
        label.text = String(format: "%.2f", count)
    }
    
    @IBAction func start() {
        if !timer.isValid {
            //タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
            resultLabel.isHidden = true
        }
    }
    
    @IBAction func stop() {
        if timer.isValid {
            //タイマーが動作していたら停止する
            timer.invalidate()
            //hanteiメソッドの呼び出し、結果を表示する
            self.hantei()
        }
    }
    
    @IBAction func reset() {
        if timer.isValid {
            timer.invalidate()
        }
        count = 0.00
        label.text = String(format: "%.2f", count)
        resultLabel.isHidden = true
    }
    
    @IBAction func hantei(){
        resultLabel.isHidden = false
        if abs(10.00 - count) <= 0.20 {
            resultLabel.text = "PERFECT"
        } else if abs(10.00 - count) <= 0.30 {
            resultLabel.text = "GREAT"
        } else if abs(10.00 - count) <= 0.50 {
            resultLabel.text = "GOOD"
        } else {
            resultLabel.text = "BAD"
        }
    }


}

