//
//  RegisterViewController.swift
//  GiveMeAName
//
//  Created by 박지윤 on 2021/05/25.
//

import Foundation
import UIKit
import Firebase

class RegisterViewController: UIViewController{
    
    @IBOutlet weak var nickName: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nicknameWarning: UILabel!
    @IBOutlet weak var emailWarning: UILabel!
    @IBOutlet weak var passwordWarning: UILabel!
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        emailWarning.isHidden = true
        passwordWarning.isHidden = true
        nicknameWarning.isHidden = true
        
        if isValidNickname(testNickname: nickName.text!) == false{
            nicknameWarning.text = "닉네임은 최소 2글자 이상이여야 합니다."
            nicknameWarning.isHidden = false
        }
        if self.isValidEmail(testEmail: emailTextField.text!) == false{
            self.emailWarning.text = "올바른 이메일 형식이 아닙니다."
            self.emailWarning.isHidden = false
        }
        if self.isValidPassword(testPassword: passwordTextField.text!) == false {
            self.passwordWarning.text = "비밀번호는 8자 이상이여야 합니다."
            self.passwordWarning.isHidden = false
        }
        if let email = emailTextField.text, let password = passwordTextField.text{
            Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
                if let e = error{
                    print(e.localizedDescription)
                }else{
                    self.performSegue(withIdentifier: N.registerSegue, sender: self)
                }
            }
        }
    }
    func isValidEmail(testEmail: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testEmail)
    }
    func isValidPassword(testPassword: String) -> Bool{
        if testPassword.count < 8{
            return false
        }
        return true
    }
    func isValidNickname(testNickname: String) -> Bool{
        if testNickname.count < 2{
            return false
        }
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        emailWarning.textColor = .red
        emailWarning.isHidden = true
        passwordWarning.textColor = .red
        passwordWarning.isHidden = true
        nicknameWarning.textColor = .red
        nicknameWarning.isHidden = true
    }
    
}
extension UIViewController{
    func hideKeyboardWhenTappedAround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
