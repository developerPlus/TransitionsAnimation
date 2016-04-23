
//
//  MainViewController.swift
//  转场动画
//
//  Created by 刘森 on 16/4/21.
//  Copyright © 2016年 Vampires. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        
        
        let biubiu = UIImageView()
        biubiu.frame = self.view.bounds
        biubiu.image = UIImage.init(named: "guide3.jpg")
        self.view.addSubview(biubiu)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
