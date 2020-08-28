//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Dan Inano on 2020/08/20.
//  Copyright © 2020 Dan Inano. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        displayImage()
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    var dispImageNo = 0
    
    func displayImage(){
        let imageNameArray = ["1.jpg" ,"2.jpg","3.jpg",]

        let name = imageNameArray[dispImageNo]
        
        let image = UIImage (named: name)
        
        
        imageView.image = image
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
