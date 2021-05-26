//
//  ViewController.swift
//  GiveMeAName
//
//  Created by 박지윤 on 2021/05/02.
//

import UIKit
import KakaoSDKUser


class LoginViewController: UIViewController {

    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var kakaoLoginButton: UIButton!
    
    let navigationAppearance = UINavigationBarAppearance()
    
    @IBAction func emailLoginPressed(_ sender: UIButton) {
        print("EmailLoginPressed")
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    self.performSegue(withIdentifier: "KakaoToStart", sender: self)
                    //do something
                    _ = oauthToken
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLoginButton.layer.cornerRadius = 5
        kakaoLoginButton.layer.cornerRadius = 5
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.isNavigationBarHidden = true
    }
    

}

