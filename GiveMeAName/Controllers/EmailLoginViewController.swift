//
//  EmailLoginViewController.swift
//  GiveMeAName
//
//  Created by 박지윤 on 2021/05/25.
//

import Foundation
import UIKit
import Firebase

class EmailLoginViewController: UIViewController{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginWarning: UILabel!
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e.localizedDescription)
                    self.loginWarning.text = "이메일이나 비밀번호가 올바르지 않습니다."
                    self.loginWarning.textColor = .red
                    self.loginWarning.isHidden = false
                    
                } else{
                    self.performSegue(withIdentifier: "LoginToStart", sender: self)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        loginWarning.isHidden = true
    }
}
