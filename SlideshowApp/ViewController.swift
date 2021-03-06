//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Dan Inano on 2020/08/18.
//  Copyright © 2020 Dan Inano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    var dispImageNo = 0
    
    func displayImage(){
        let imageNameArray = ["1.jpg" ,"2.jpg","3.jpg",]

        let name = imageNameArray[dispImageNo]
        
        let image = UIImage (named: name)
        
        
        imageView.image = image
    }
    
    func slideShow(){
        if timer_sec%2 == 0{
            if dispImageNo != 2{
                dispImageNo += 1
            }
            else {
                dispImageNo = 0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "1.jpg")
        startstop.setTitle("再生", for: .normal)
    }

//進むボタン
    @IBAction func next(_ sender: Any) {
        if self.timer == nil{
            if dispImageNo == 2{
                dispImageNo = 0
            }
            else{
                dispImageNo += 1
            }
            displayImage()
        }
    }
//    戻るボタン
    @IBAction func back(_ sender: Any) {
        if self.timer == nil{
            if dispImageNo == 0{
                dispImageNo = 2
            }
            else{
                dispImageNo -= 1
            }
            displayImage()
        }
    }
    
//    スライドショー用タイマー定義
    var timer: Timer!
    var timer_sec: Int = 0
    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 1
        
        slideShow()
        
        displayImage()
    }
    
    
   

    @IBOutlet weak var nextImg: UIButton!
    
    @IBOutlet weak var backImg: UIButton!
    
    @IBOutlet weak var startstop: UIButton!
    
    
//    画面遷移ボタン
    @IBAction func buttonImg(_ sender: Any) {
        if self.timer != nil{
            self.timer_sec = 0
            self.timer.invalidate()
            self.timer = nil
            nextImg.isEnabled = true
            backImg.isEnabled = true
            startstop.setTitle("再生", for: .normal)
        }
        
        
    }
    
    
    
    
    //    再生/停止ボタン
    @IBAction func startstop(_ sender: Any) {
        
        if self.timer == nil{   //タイマー始動
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector (updateTimer(_:)), userInfo: nil, repeats: true)
            nextImg.isEnabled = false
            backImg.isEnabled = false
            startstop.setTitle("停止", for: .normal)
        }
        else {                 //タイマー停止
            
            self.timer_sec = 0
            self.timer.invalidate()
            self.timer = nil
            nextImg.isEnabled = true
            backImg.isEnabled = true
            startstop.setTitle("再生", for: .normal)
            
        }
        

    }
    
    @IBAction func unwind (_ segue: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.dispImageNo = dispImageNo
    }
    
    
    
    
}
