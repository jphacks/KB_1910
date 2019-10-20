//
//  HomeViewController.swift
//  jphacks
//
//  Created by sekiya on 2019/10/19.
//  Copyright © 2019 sekiya. All rights reserved.
//

import UIKit
import Nuke

class HomeViewController: UIViewController {
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //    データ
    let items = [Item(name: "ポートタワー", discription: "JPHACKS最高!!", image_path: "https://images.unsplash.com/photo-1565706199223-96ec87a24026?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "神戸港", discription: "JPHACKS最高!!", image_path: "https://images.unsplash.com/photo-1559480671-4577ba1ea77b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "夜景", discription: "JPはジャパン", image_path: "https://images.unsplash.com/photo-1551641506-ee5bf4cb45f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "ポートタワー", discription: "JPはジャパン", image_path: "https://images.unsplash.com/photo-1565706199223-96ec87a24026?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "神戸港", discription: "JPはジャパン", image_path: "https://images.unsplash.com/photo-1559480671-4577ba1ea77b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "夜景", discription: "JPはジャパン", image_path: "https://images.unsplash.com/photo-1551641506-ee5bf4cb45f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "ポートタワー", discription: "たのしい", image_path: "https://images.unsplash.com/photo-1565706199223-96ec87a24026?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "神戸港", discription: "うれしい", image_path: "https://images.unsplash.com/photo-1559480671-4577ba1ea77b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "夜景", discription: "さいこう", image_path: "https://images.unsplash.com/photo-1551641506-ee5bf4cb45f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60")]
    var selectedItemIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        // スクロールを禁止
//        collectionView.isScrollEnabled = false
        
        // 横方向に並べていく
        flowLayout.scrollDirection = .vertical
        // 空白をなくす
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        // xibを登録
        let inib = UINib(nibName: "CollectionItem", bundle: nil)
        collectionView!.register(inib, forCellWithReuseIdentifier: "collectionItem")
        let mnib = UINib(nibName: "MapCollectionViewCell", bundle: nil)
        collectionView!.register(mnib, forCellWithReuseIdentifier: "mapCollectionItem")
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

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    /*
     * cellの個数
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count+1
    }
    
    /*
     * 見た目の設定
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mapCollectionItem", for: indexPath) as! MapCollectionViewCell

            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionItem", for: indexPath) as! ItemCollectionViewCell
            
            // 画像を設定
            Nuke.loadImage(with: URL(string: items[indexPath.row].image_path)!, into: cell.ImageItem)
            return cell
        }
    }
    
    /*
     * 押下時の処理
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        selectedItemIndex = indexPath.row
        
        if indexPath.row != 0 {
            self.performSegue(withIdentifier: "showDetailSegue", sender: nil)
        }
    }
    
    /*
     * サイズを変更
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 414.0, height: 500.0)
        } else {
            return CGSize(width: 207.0, height: 200.0)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // ②Segueの識別子確認
        if segue.identifier == "showDetailSegue" {
            
            // ③遷移先ViewCntrollerの取得
            let nextView = segue.destination as! DetailViewController
        
            // ④値の設定
            nextView.Name = items[selectedItemIndex].name
            nextView.imagePath = items[selectedItemIndex].image_path
            nextView.descrip = items[selectedItemIndex].discription
        }
    }
    
}
