//
//  WelcomeViewController.swift
//  GiveMeAName
//
//  Created by 박지윤 on 2021/05/25.
//
import UIKit
import Foundation

class WelcomeViewController: UIViewController{
    var timer: Timer!
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    let navigationAppearance = UINavigationBarAppearance()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(named: N.BrandColors.blue)
        logoImage.image = UIImage.init(named: "appstore.png")
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timeaction), userInfo: nil, repeats: true)
    }
    @objc func timeaction(){
        //code for move next VC
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                self.navigationController?.pushViewController(loginVC, animated: true)
        timer.invalidate()//after that timer invalid

        }
        // Do any additional setup after loading the view.
//        navigationAppearance.backgroundColor = .red
//        navigationAppearance.configureWithDefaultBackground()
//        self.navigationController?.navigationBar.standardAppearance = navigationAppearance
        
    
    
}
