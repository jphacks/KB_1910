//
//  CollectionTableViewCell.swift
//  jphacks
//
//  Created by sekiya on 2019/10/19.
//  Copyright © 2019 sekiya. All rights reserved.
//

import UIKit
import Nuke

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // スクロールを禁止
        collectionView.isScrollEnabled = false
        
        // 横方向に並べていく
        flowLayout.scrollDirection = .vertical
        // 空白をなくす
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        // xibを登録
        let nib = UINib(nibName: "CollectionItem", bundle: nil)
        collectionView!.register(nib, forCellWithReuseIdentifier: "collectionItem")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CollectionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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
        
        // 画像を設定
        Nuke.loadImage(with: URL(string: "https://medicalcoder.up.seesaa.net/image/Healthy20food.jpg")!, into: cell.ImageItem)
        return cell
    }
    
    
}
