//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Rui Mao on 4/26/17.
//  Copyright © 2017 Rui Mao. All rights reserved.
//

import UIKit

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

class DraggableImageView: UIView {
    

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    var profileImageOriginalCenter : CGPoint!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var profileImage : UIImage? {
        get { return profileImageView.image}
        set { profileImageView.image = newValue }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        initSubViews()
    }
    
    
    func initSubViews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
    }
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: contentView)
        
        let translation = sender.translation(in: contentView)
        
        
        if sender.state == .began {
            profileImageOriginalCenter = profileImageView.center
            print("Gesture began at: \(point)")
        } else if sender.state == .changed {
            
            contentView.center = CGPoint(x: profileImageOriginalCenter.x + translation.x, y: profileImageOriginalCenter.y)
            
            let angle = CGFloat(Float(translation.x)  * Float(Double.pi) / Float(12.0 * 192.0))
            contentView.transform = profileImageView.transform.rotated(by: angle)
            
            
            print("Gesture changed at: \(profileImageView.center)")
        } else if sender.state == .ended {
            print("Gesture ended at: \(contentView.center)")
        }
    }
}
