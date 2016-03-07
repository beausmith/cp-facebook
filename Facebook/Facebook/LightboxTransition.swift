//
//  LightboxTransition.swift
//  Facebook
//
//  Created by Beau Smith on 3/6/16.
//  Copyright © 2016 Beau Smith. All rights reserved.
//

import UIKit

class LightboxTransition: BaseTransition {

    var profileImage: UIView!

    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let feedViewController = fromViewController as! FeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        let movingImageView = UIImageView()
        movingImageView.frame = feedViewController.coupleImageView.frame
        movingImageView.image = feedViewController.coupleImageView.image
        movingImageView.clipsToBounds = feedViewController.coupleImageView.clipsToBounds
        movingImageView.contentMode = feedViewController.coupleImageView.contentMode
        
        containerView.addSubview(movingImageView)
        
        feedViewController.coupleImageView.alpha = 0
        photoViewController.currentImageView.alpha = 0
        toViewController.view.alpha = 0
        
        UIView.animateWithDuration(duration, animations: {
            movingImageView.frame = photoViewController.currentImageView.frame
            toViewController.view.alpha = 1
        }) { (finished: Bool) -> Void in
            photoViewController.currentImageView.alpha = 1
            movingImageView.removeFromSuperview()
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let feedViewController = toViewController as! FeedViewController
        let photoViewController = fromViewController as! PhotoViewController
        
        let movingImageView = UIImageView()
        movingImageView.frame = photoViewController.currentImageView.frame
        movingImageView.image = photoViewController.currentImageView.image
        movingImageView.clipsToBounds = photoViewController.currentImageView.clipsToBounds
        movingImageView.contentMode = photoViewController.currentImageView.contentMode
        
        containerView.addSubview(movingImageView)
        
        feedViewController.coupleImageView.alpha = 0
        photoViewController.currentImageView.alpha = 0
        toViewController.view.alpha = 0
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            movingImageView.frame = feedViewController.coupleImageView.frame
            toViewController.view.alpha = 1
        }) { (finished: Bool) -> Void in
            feedViewController.coupleImageView.alpha = 1
            movingImageView.removeFromSuperview()
            self.finish()
        }

    }

}
