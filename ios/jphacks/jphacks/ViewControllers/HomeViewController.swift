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
    let items = [PostResponse(id:1,user_id:1,date:"2019-10-20T12:35:36.471362+09:00",text:"ぽーとたわー",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1565706199223-96ec87a24026_Mea2JCy.jpeg",map_lat:34.6825550000,map_lon:135.1866900000,like_cnt:0), PostResponse(id:2,user_id:1,date:"2019-10-20T12:37:55.088348+09:00",text:"夜景　海",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1559480671-4577ba1ea77b_EmwnP18.jpeg",map_lat:34.6730290000,map_lon:135.2024280000,like_cnt:3), PostResponse(id:3,user_id:2,date:"2019-10-20T12:41:25.857815+09:00",text:"夜景　海２",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1559480671-6c53c761ee1b_dhJhEEA.jpeg",map_lat:34.6790320000,map_lon:135.2023750000,like_cnt:5), PostResponse(id:4,user_id:3,date:"2019-10-20T12:43:53.733888+09:00",text:"橋!!",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1548712637-033b00ef9b4a_9KCjRSV.jpeg",map_lat:34.6285630000,map_lon:135.0378160000,like_cnt:3), PostResponse(id:5,user_id:4,date:"2019-10-20T12:48:53.127026+09:00",text:"SF感",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1540959733332-eab4deabeeaf_DHtt8hL.jpeg",map_lat:34.6945830000,map_lon:135.1922950000,like_cnt:3), PostResponse(id:6,user_id:2,date:"2019-10-20T12:52:49.561885+09:00",text:"ひゃくまんどるのなんとか",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1498036882173-b41c28a8ba34_tLAxpPa.jpeg",map_lat:34.7306340000,map_lon:135.2021270000,like_cnt:10), PostResponse(id:7,user_id:4,date:"2019-10-20T12:56:02.042372+09:00",text:"いい感じの路地",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1554797589-7241bb691973_KkO0MES.jpeg",map_lat:34.6869250000,map_lon:135.1838580000,like_cnt:3), PostResponse(id:8,user_id:4,date:"2019-10-20T12:57:04.370064+09:00",text:"夜道がきれい",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1551641506-ee5bf4cb45f1_YRvmG0A.jpeg",map_lat:34.6692500000,map_lon:135.1639490000,like_cnt:5), PostResponse(id:9,user_id:4,date:"2019-10-20T12:59:20.761131+09:00",text:"噴水イルミネーション",img_url:"http://34.203.188.126:8000/media/api_v1/images/0109292_4TYTNoE.jpeg",map_lat:34.6683790000,map_lon:135.1640790000,like_cnt:12), PostResponse(id:10,user_id:1,date:"2019-10-20T13:01:48.855149+09:00",text:"絶景！！",img_url:"http://34.203.188.126:8000/media/api_v1/images/sp_img_slide_l02_pM42j2R.jpg",map_lat:34.7011490000,map_lon:135.1550270000,like_cnt:9), PostResponse(id:11,user_id:1,date:"2019-10-20T13:56:09.966792+09:00",text:"神戸",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo.jpeg",map_lat:135.1994020000,map_lon:34.6852190000,like_cnt:5), PostResponse(id:12,user_id:1,date:"2019-10-20T14:04:44.021440+09:00",text:"神戸",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo_jy763wo.jpeg",map_lat:135.1994020000,map_lon:34.6852190000,like_cnt:5),PostResponse(id:1,user_id:1,date:"2019-10-20T12:35:36.471362+09:00",text:"ぽーとたわー",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1565706199223-96ec87a24026_Mea2JCy.jpeg",map_lat:34.6825550000,map_lon:135.1866900000,like_cnt:0), PostResponse(id:2,user_id:1,date:"2019-10-20T12:37:55.088348+09:00",text:"夜景　海",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1559480671-4577ba1ea77b_EmwnP18.jpeg",map_lat:34.6730290000,map_lon:135.2024280000,like_cnt:3), PostResponse(id:3,user_id:2,date:"2019-10-20T12:41:25.857815+09:00",text:"夜景　海２",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1559480671-6c53c761ee1b_dhJhEEA.jpeg",map_lat:34.6790320000,map_lon:135.2023750000,like_cnt:5), PostResponse(id:4,user_id:3,date:"2019-10-20T12:43:53.733888+09:00",text:"橋!!",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1548712637-033b00ef9b4a_9KCjRSV.jpeg",map_lat:34.6285630000,map_lon:135.0378160000,like_cnt:3), PostResponse(id:5,user_id:4,date:"2019-10-20T12:48:53.127026+09:00",text:"SF感",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1540959733332-eab4deabeeaf_DHtt8hL.jpeg",map_lat:34.6945830000,map_lon:135.1922950000,like_cnt:3), PostResponse(id:6,user_id:2,date:"2019-10-20T12:52:49.561885+09:00",text:"ひゃくまんどるのなんとか",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1498036882173-b41c28a8ba34_tLAxpPa.jpeg",map_lat:34.7306340000,map_lon:135.2021270000,like_cnt:10), PostResponse(id:7,user_id:4,date:"2019-10-20T12:56:02.042372+09:00",text:"いい感じの路地",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1554797589-7241bb691973_KkO0MES.jpeg",map_lat:34.6869250000,map_lon:135.1838580000,like_cnt:3), PostResponse(id:8,user_id:4,date:"2019-10-20T12:57:04.370064+09:00",text:"夜道がきれい",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo-1551641506-ee5bf4cb45f1_YRvmG0A.jpeg",map_lat:34.6692500000,map_lon:135.1639490000,like_cnt:5), PostResponse(id:9,user_id:4,date:"2019-10-20T12:59:20.761131+09:00",text:"噴水イルミネーション",img_url:"http://34.203.188.126:8000/media/api_v1/images/0109292_4TYTNoE.jpeg",map_lat:34.6683790000,map_lon:135.1640790000,like_cnt:12), PostResponse(id:10,user_id:1,date:"2019-10-20T13:01:48.855149+09:00",text:"絶景！！",img_url:"http://34.203.188.126:8000/media/api_v1/images/sp_img_slide_l02_pM42j2R.jpg",map_lat:34.7011490000,map_lon:135.1550270000,like_cnt:9), PostResponse(id:11,user_id:1,date:"2019-10-20T13:56:09.966792+09:00",text:"神戸",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo.jpeg",map_lat:135.1994020000,map_lon:34.6852190000,like_cnt:5), PostResponse(id:12,user_id:1,date:"2019-10-20T14:04:44.021440+09:00",text:"神戸",img_url:"http://34.203.188.126:8000/media/api_v1/images/photo_jy763wo.jpeg",map_lat:135.1994020000,map_lon:34.6852190000,like_cnt:5)]
    
    let users = [User(account_name:"apple",password:"apple"), User(account_name:"aaaaaa",password:"aaaaaa"), User(account_name:"bbbbbbb",password:"bbbbbbb"), User(account_name:"cccccc",password:"ccccccc")]
    
//    let items = [Item(name: "ポートタワー", discription: "JPHACKS最高!!", image_path: "https://images.unsplash.com/photo-1565706199223-96ec87a24026?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "神戸港", discription: "JPHACKS最高!!", image_path: "https://images.unsplash.com/photo-1559480671-4577ba1ea77b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "夜景", discription: "JPはジャパン", image_path: "https://images.unsplash.com/photo-1551641506-ee5bf4cb45f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "ポートタワー", discription: "JPはジャパン", image_path: "https://images.unsplash.com/photo-1565706199223-96ec87a24026?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "神戸港", discription: "JPはジャパン", image_path: "https://images.unsplash.com/photo-1559480671-4577ba1ea77b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "夜景", discription: "JPはジャパン", image_path: "https://images.unsplash.com/photo-1551641506-ee5bf4cb45f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "ポートタワー", discription: "たのしい", image_path: "https://images.unsplash.com/photo-1565706199223-96ec87a24026?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "神戸港", discription: "うれしい", image_path: "https://images.unsplash.com/photo-1559480671-4577ba1ea77b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"), Item(name: "夜景", discription: "さいこう", image_path: "https://images.unsplash.com/photo-1551641506-ee5bf4cb45f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60")]
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
        return items.count
    }
    
    /*
     * 見た目の設定
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mapCollectionItem", for: indexPath) as! MapCollectionViewCell
            print("DEBUG: called")
            
            // ピンを刺す
            for item in items {
                cell.addPin(lat: item.map_lat, long: item.map_lon, title: item.text)
            }
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionItem", for: indexPath) as! ItemCollectionViewCell
            
            // 画像を設定
            Nuke.loadImage(with: URL(string: items[indexPath.row].img_url)!, into: cell.ImageItem)
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
            nextView.Name = users[items[selectedItemIndex].user_id].account_name
            nextView.imagePath = items[selectedItemIndex].img_url
            nextView.descrip = items[selectedItemIndex].text
        }
    }
    
}
