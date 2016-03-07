//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Beau Smith on 3/6/16.
//  Copyright © 2016 Beau Smith. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var image: UIImage!
    
    var imageOriginalCenter: CGPoint!
    
    @IBOutlet weak var currentImageView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentImageView.image = image

        imageOriginalCenter = currentImageView.center

        view.backgroundColor = UIColor(white: 0, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didTapDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func onPanPhoto(sender: UIPanGestureRecognizer) {

        //let point = sender.locationInView(view)
        //let velocity = sender.velocityInView(view)
        let translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.doneButton.alpha = 0
            })
        } else if sender.state == UIGestureRecognizerState.Changed {
            currentImageView.center = CGPoint(
                x: imageOriginalCenter.x,
                y: imageOriginalCenter.y + translation.y
            )
            let backgroundAlpha = CGFloat(1 - abs(translation.y)/100)
            view.backgroundColor = UIColor(white: 0, alpha: backgroundAlpha)
        } else if sender.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                if (abs(translation.y) > 100) {
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    self.currentImageView.center = self.imageOriginalCenter
                    self.doneButton.alpha = 1
                    self.view.backgroundColor = UIColor(white: 0, alpha: 1)
                }
            })
        }

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
