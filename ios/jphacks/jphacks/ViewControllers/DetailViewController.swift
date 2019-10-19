//
//  DetailViewController.swift
//  jphacks
//
//  Created by sekiya on 2019/10/20.
//  Copyright © 2019 sekiya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailNameLable: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailCaptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
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
