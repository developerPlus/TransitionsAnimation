//
//  ViewController.swift
//  转场动画
//
//  Created by 刘森 on 16/4/21.
//  Copyright © 2016年 Vampires. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var _directionType = DirectionType.None
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    
    
    func buttonEvent(directionType : DirectionType)  {
        
        _directionType = directionType
        
        let MainVC = MainViewController()
        
        MainVC.transitioningDelegate = self
        MainVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        self.presentViewController(MainVC, animated: true, completion: nil)
    }
    
    @IBAction func top(sender: AnyObject) {
        
        self.buttonEvent(DirectionType.Top)
    }
    
    
    @IBAction func left(sender: AnyObject) {
        
        self.buttonEvent(DirectionType.Left)

    }
    
  
    
    @IBAction func right(sender: AnyObject) {
        
        self.buttonEvent(DirectionType.Right)

    }
    
    @IBAction func bottom(sender: AnyObject) {
        
        self.buttonEvent(DirectionType.Bottom)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let transitions = XZTransitions()
        transitions.initWithTransitionsOfAxis(transitionDuration: 0.4, transitionType: TransitionType.Present, directionType: _directionType)
        return transitions
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transitions = XZTransitions()
        transitions.initWithTransitionsOfAxis(transitionDuration: 0.4, transitionType: TransitionType.Dismiss, directionType: _directionType)
        return transitions
    }
    
    
}
