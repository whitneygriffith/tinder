//
//  CardsViewController.swift
//  tinder
//
//  Created by Whitney Griffith on 10/28/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var cardInitialCenter: CGPoint!
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(panGestureRecognizer)
    }
    
    
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
            cardInitialCenter = imageView.center
        } else if sender.state == .changed {
            print("Gesture is changing")
            imageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            
            if (velocity.x > 0){
                imageView.transform = imageView.transform.rotated(by: CGFloat(0.15 * Double.pi / 180))
            }
            else if (velocity.x < 0){
                imageView.transform = imageView.transform.rotated(by: CGFloat(-0.15 * Double.pi / 180))
            }
            
        } else if sender.state == .ended {
            print("Gesture ended")
            if (translation.x < -150) {
                imageView.removeFromSuperview()
            } else if (translation.x > 150) {
                imageView.removeFromSuperview()
            }else{
                imageView.center.x = cardInitialCenter.x
                imageView.center.y = cardInitialCenter.y
                imageView.transform = CGAffineTransform.identity
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ProfileViewController
        vc.modalPresentationStyle = UIModalPresentationStyle.custom
        vc.userImage = imageView.image!
        
        //Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        vc.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
        
    
    }
    
    


}
