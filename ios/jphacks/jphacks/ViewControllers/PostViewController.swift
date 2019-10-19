//
//  PostViewController.swift
//  jphacks
//
//  Created by sekiya on 2019/10/19.
//  Copyright © 2019 sekiya. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var postImage: UIButton!
    @IBOutlet weak var postTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func imageButton(_ sender: Any) {
        print("tapped")
    }
    
    @IBAction func postButton(_ sender: Any) {
    }
    
    /*
     * テキスト入力時に他の場所を押したらキーボードを閉じる
     */
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
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
