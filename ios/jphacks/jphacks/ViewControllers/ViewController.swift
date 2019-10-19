//
//  ViewController.swift
//  jphacks
//
//  Created by sekiya on 2019/10/19.
//  Copyright © 2019 sekiya. All rights reserved.
//

import UIKit
import KeychainAccess

class ViewController: UIViewController {
    
    let keychain = Keychain()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // keyを取得
        let userInfo = getInfo() ?? UserAuthInfo(name: "not found", password: "not found")
        
        // ログイン状況に応じて遷移先を変更
        if getInfo() == nil {
            moveLoginView()
        } else {
            moveHomeView()
        }
        // 情報を表示
        showInfo(uai: userInfo)
    }
    
    /*
     * 遷移
     */
     func moveLoginView() {
         let storyboard: UIStoryboard = self.storyboard!
         let second = storyboard.instantiateViewController(withIdentifier: "signinScene")
         second.modalPresentationStyle =  .fullScreen
         self.present(second, animated: false, completion: nil)
     }
     func moveHomeView() {
         let storyboard: UIStoryboard = self.storyboard!
         let second = storyboard.instantiateViewController(withIdentifier: "homeScene")
         second.modalPresentationStyle =  .fullScreen
         self.present(second, animated: false, completion: nil)
     }
    
    /*
     * keyを取得
     */
    func getInfo() -> Optional<UserAuthInfo> {
        // userNameがkeychainに登録されているか確認
        if let encodedUserInfo = try? keychain.getData("userInfo") {
            // decode
            if let savedUserInfo = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(encodedUserInfo) as? UserAuthInfo {
                return savedUserInfo
            } else {
                NSLog("decode failed")
            }
        } else {
            NSLog("keychain failed")
        }
        
        return nil
    }
    
    /*
     * keyを表示
     */
    func showInfo(uai: UserAuthInfo) {
        // 画面上に表示
        print("name: \(uai.name)")
        print("password: \(uai.password)")
    }
    
    /*
     * keyを追加
     */
    func addKey(_ sender: Any) {
        // keyを追加
        var userInfo: UserAuthInfo
        userInfo = UserAuthInfo(name: "DefaultUser", password: "password")
        
        // encode
        let encodedUserInfo = NSKeyedArchiver.archivedData(withRootObject: userInfo)
        // keyを追加
        keychain[data: "userInfo"] = encodedUserInfo
        
        // keyを取得
        let ui = getInfo() ?? UserAuthInfo(name: "not found", password: "not found")
        // 情報を表示
        showInfo(uai: ui)
    }
    
    /*
     * keyを削除
     */
    func deleteKey(_ sender: Any) {
        // keyを削除
        do {
            try keychain.remove("userInfo")
        } catch let error {
            print("failed to remove key: \(error)")
        }
        // keyを取得
        let ui = getInfo() ?? UserAuthInfo(name: "not found", password: "not found")
        // 情報を表示
        showInfo(uai: ui)
    }
}

