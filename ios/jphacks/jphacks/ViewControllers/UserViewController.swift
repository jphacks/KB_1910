//
//  UserViewController.swift
//  jphacks
//
//  Created by sekiya on 2019/10/19.
//  Copyright © 2019 sekiya. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    // table
    @IBOutlet weak var userTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // tableviewの設定
        userTable.delegate = self
        userTable.dataSource = self
        
        // xibを登録
        userTable.register(UINib(nibName: "UserView", bundle: nil), forCellReuseIdentifier: "user")
        userTable.register(UINib(nibName: "Switch", bundle: nil), forCellReuseIdentifier: "switch")
        userTable.register(UINib(nibName: "CollectionView", bundle: nil), forCellReuseIdentifier: "collection")
        // Do any additional setup after loading the view.
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

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // セクション数
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 各セクションごとのアイテム数
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // 0番目: UserView
            let cell = tableView.dequeueReusableCell(withIdentifier: "user") as! UserTableViewCell
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "switch") as! SwitchTableViewCell
            return cell
        } else {
            // 3番目: collectionView
            let cell = tableView.dequeueReusableCell(withIdentifier: "collection") as! CollectionTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 縦幅
        if indexPath.section == 0 {
            return 150
        } else if indexPath.section == 1 {
            return 50
        } else {
            return 828
        }
    }
}
