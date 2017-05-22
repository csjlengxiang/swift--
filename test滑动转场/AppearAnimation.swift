//
//  AppearAnimation.swift
//  test滑动转场
//
//  Created by csj on 2017/5/22.
//  Copyright © 2017年 csj. All rights reserved.
//

import UIKit

class AppearAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let from = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let to = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let v = transitionContext.containerView
        v.insertSubview(to.view, belowSubview: from.view)
        let d = self.transitionDuration(using: transitionContext)
        
        to.view.alpha = 0
        from.view.alpha = 1
        
        UIView.animate(withDuration: d, animations: {
            to.view.alpha = 1
            from.view.alpha = 0
            
        }, completion: {
            (finish) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            to.view.alpha = 1
            from.view.alpha = 1
        }
        )
    }
}







