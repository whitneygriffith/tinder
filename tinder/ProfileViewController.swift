//
//  ProfileViewController.swift
//  tinder
//
//  Created by Whitney Griffith on 10/28/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    var userImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.image = userImage

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapDone(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
