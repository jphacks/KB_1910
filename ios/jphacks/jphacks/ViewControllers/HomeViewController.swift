//
//  HomeViewController.swift
//  jphacks
//
//  Created by sekiya on 2019/10/19.
//  Copyright © 2019 sekiya. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // tableView
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableviewの設定
        tableView.delegate = self
        tableView.dataSource = self
        // xibを登録
        tableView.register(UINib(nibName: "Collection", bundle: nil), forCellReuseIdentifier: "collection")

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

extension HomeViewController: UITableViewDelegate ,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // セクション数
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 各セクションごとのアイテム数
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // 0番目: mapを表示
            let cell = tableView.dequeueReusableCell(withIdentifier: "map") as! MapTableViewCell
            return cell
        } else {
            // 1番目: collectionViewを表示
            let cell = tableView.dequeueReusableCell(withIdentifier: "collection") as! CollectionTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 縦幅
        if indexPath.section == 0 {
            return 500
        } else {
            return 1000
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Cell 押下時の処理
    }

}
