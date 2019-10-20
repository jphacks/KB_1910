//
//  DetailViewController.swift
//  jphacks
//
//  Created by sekiya on 2019/10/20.
//  Copyright © 2019 sekiya. All rights reserved.
//

import UIKit
import Nuke


class DetailViewController: UIViewController {
    @IBOutlet weak var detailNameLable: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailCaptionLabel: UILabel!
    
    var Name = "Default User"
    var imagePath = "https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
    var descrip = "samplecaptionssamplecaptionssamplecaptionssamplecaptions"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        detailNameLable.text = Name
        Nuke.loadImage(with: URL(string: imagePath)!, into:detailImageView)
        detailCaptionLabel.text = descrip
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
