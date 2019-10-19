//
//  CollectionTableViewCell.swift
//  jphacks
//
//  Created by sekiya on 2019/10/19.
//  Copyright © 2019 sekiya. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // xibを登録
        let nib = UINib(nibName: "CollectionItem", bundle: nil)
        collectionView!.register(nib, forCellWithReuseIdentifier: "collectionItem")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CollectionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    /*
     * cellの個数
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    /*
     * 見た目の設定
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionItem", for: indexPath) as! ItemCollectionViewCell
        // 色を変更
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    
}
