//
//  ViewController.swift
//  Tinder
//
//  Created by Rui Mao on 4/26/17.
//  Copyright © 2017 Rui Mao. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var imageView: DraggableImageView!
    var profileImageOriginalCenter: CGPoint!
    var fadeTransition: FadeTransition!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView = DraggableImageView(frame: CGRect(x:36 , y:150, width:view.bounds.width, height: 304))
        imageView.profileImage = UIImage(named: "ryan")
        view.addSubview(imageView)
        let tapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector (CardsViewController.TappedOnImage))
        tapped.numberOfTapsRequired = 1
        imageView?.addGestureRecognizer(tapped)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func TappedOnImage(sender: UITapGestureRecognizer) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let profileVC = mainStoryboard.instantiateViewController(withIdentifier: "profileVC") as! ProfileViewController
        self.present(profileVC, animated: true, completion: nil)
 
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        let destinationVC = segue.destination as! ProfileViewController
        let draggableImageView = sender as! DraggableImageView
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.custom
        destinationVC.profileImage = draggableImageView.profileImage
        // create a FadeTransition instance
        fadeTransition = FadeTransition()
        destinationVC.transitioningDelegate = fadeTransition
        
        // adjust the transition duration
        fadeTransition.duration = 0.7
   
    }
}

