//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Rui Mao on 4/26/17.
//  Copyright © 2017 Rui Mao. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var profileImage: UIImage?

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var navBarImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileImageView.image = profileImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onTabGuesture(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
}
