//
//  LoginViewController.swift
//  jphacks
//
//  Created by sekiya on 2019/10/19.
//  Copyright © 2019 sekiya. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailInput.delegate = self
        passwordInput.delegate = self
        
        // プレースホルダの文字色を変更
        emailInput.attributedPlaceholder = NSAttributedString(string: emailInput.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordInput.attributedPlaceholder = NSAttributedString(string: passwordInput.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        // パスワードを伏せ字にする
        passwordInput.isSecureTextEntry = true
    }
    
    /*
     * ログイン処理
     */
    @IBAction func signInButton(_ sender: Any) {
        // 遷移
        let storyboard: UIStoryboard = self.storyboard!
        let second = storyboard.instantiateViewController(withIdentifier: "barRoot")
        second.modalPresentationStyle =  .fullScreen
        self.present(second, animated: false, completion: nil)
    }
    
    /*
     * SignUpViewControllerに遷移
     */
    @IBAction func moveRegisterButton(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let second = storyboard.instantiateViewController(withIdentifier: "signupScene")
        second.modalPresentationStyle =  .fullScreen
        self.present(second, animated: false, completion: nil)
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

extension LoginViewController: UITextFieldDelegate {
    // Doneボタン押下でキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            // タグが0ならpasswordInputにフォーカスを当てる
            passwordInput.becomeFirstResponder()
            break
        case 1:
            // タグが1ならキーボードを閉じる
            self.view.endEditing(true)
            break
        default:
            break
        }
        return true
    }
}
