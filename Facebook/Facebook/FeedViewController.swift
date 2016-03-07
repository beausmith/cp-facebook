//
//  FeedViewController.swift
//  Facebook
//
//  Created by Beau Smith on 3/5/16.
//  Copyright © 2016 Beau Smith. All rights reserved.
//

import UIKit

var lightboxTransition: LightboxTransition!

class FeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var coupleImageView: UIImageView!

    //var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lightboxTransition = LightboxTransition()
        lightboxTransition.duration = 0.3
        
        scrollView.contentSize = feedImageView.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapPhoto(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("photoViewSegue", sender: self)
        //selectedImage = self.view
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {        
        let photoViewController = segue.destinationViewController as! PhotoViewController
        photoViewController.image = self.coupleImageView.image
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        photoViewController.transitioningDelegate = lightboxTransition

    }

}
