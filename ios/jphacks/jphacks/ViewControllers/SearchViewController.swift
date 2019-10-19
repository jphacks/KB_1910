//
//  SearchViewController.swift
//  jphacks
//
//  Created by sekiya on 2019/10/19.
//  Copyright © 2019 sekiya. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var recommendTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // recommendViewの設定
        recommendTable.delegate = self
        recommendTable.dataSource = self
        // xibを登録
        recommendTable.register(UINib(nibName: "CollectionView", bundle: nil), forCellReuseIdentifier: "collection")

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

extension SearchViewController: UITableViewDelegate ,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // セクション数
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 各セクションごとのアイテム数
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // collectionViewを表示
        let cell = tableView.dequeueReusableCell(withIdentifier: "collection") as! CollectionTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 縦幅
        return 828
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Cell 押下時の処理
    }

}
