//
//  XZTransitions.swift
//  转场动画
//
//  Created by 刘森 on 16/4/22.
//  Copyright © 2016年 Vampires. All rights reserved.
//

import UIKit

public enum TransitionType : Int {
    case None
    case Dismiss
    case Present

}

public enum DirectionType : Int {
    case None
    case Top
    case Left
    case Bottom
    case Right
    
}



class XZTransitions: NSObject {
    
    var _startingAlpha  : CGFloat = 0.0
    var _transitionDuration       = NSTimeInterval()
    var _transitionType           = TransitionType.None
    var _directionType            = DirectionType.None


    func initWithTransitionsOfAxis(transitionDuration transitionDuration : NSTimeInterval, transitionType : TransitionType, directionType : DirectionType)  {
        
        _transitionDuration = transitionDuration
        _transitionType     = transitionType
        _directionType      = directionType
    }
    
    
}


extension XZTransitions : UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return _transitionDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView()
        let toView        = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)?.view
        let fromView      = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view
        
        switch _transitionType {
            
        case TransitionType.None:
            break
            
        case TransitionType.Present:
            self.makePresentAnimate(toView!, containerView: containerView!, transitionContext: transitionContext)
            break
        case TransitionType.Dismiss:
            self.makeDismissAnimate(fromView!, containerView: containerView!, transitionContext: transitionContext)
            break

        
        }
        
    }
    
    
    private func makePresentAnimate(toView : UIView, containerView : UIView, transitionContext : UIViewControllerContextTransitioning) {
        toView.frame = self.setupFromFrame(toView.frame)
        containerView.addSubview(toView)
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
            toView.frame = self.updateZeroFrame(toView.frame)
            
            }, completion: { (Bool) in
                transitionContext.completeTransition(true)
        })
        
    }
    
    private func makeDismissAnimate(fromView : UIView, containerView : UIView, transitionContext : UIViewControllerContextTransitioning) {
        containerView.addSubview(fromView)
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
            fromView.frame = self.setupFromFrame(fromView.frame)
            
            }, completion: { (Bool) in
                transitionContext.completeTransition(true)
        })
        
    }
    
    private func setupFromFrame(toViewFrame : CGRect) -> CGRect {
        var resultValue = toViewFrame
        
        switch _directionType {
        case DirectionType.Top:
            resultValue.origin.y = -resultValue.size.height
            break
        case DirectionType.Left:
            resultValue.origin.x = -resultValue.size.width
            break
        case DirectionType.Bottom:
            resultValue.origin.y = resultValue.size.height
            break
        case DirectionType.Right:
            resultValue.origin.x = resultValue.size.width
            break
        default:
            break
        }
        
        
        return resultValue
    }
    
    private func updateZeroFrame(toViewFrame : CGRect) -> CGRect {
        var resultValue = toViewFrame
        resultValue.origin.x = 0
        resultValue.origin.y = 0
        return resultValue
    }
    
}


