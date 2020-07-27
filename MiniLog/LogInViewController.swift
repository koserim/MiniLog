//
//  LoginViewController.swift
//  MiniLog
//
//  Created by 바보세림이 on 2020/07/26.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        try! Auth.auth().signOut()
        loginButton.addTarget(self, action: #selector(logInEvent), for: .touchUpInside)
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if(user != nil) {
                let view = self.storyboard?.instantiateViewController(identifier: "MainViewTabBarController") as! UITabBarController
                self.present(view, animated: true, completion: nil)
            }
        }
    }

    @objc func logInEvent() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            if(email == "" || password == "") {
                showErrorAlert("fillError")
            }
            Auth.auth().signIn(withEmail: email, password: password) { (user, err) in
                if(err != nil) {
                    self.showErrorAlert(nil)
                }
            }
        }
    }
    
    func showErrorAlert(_ status: String?) {
        var message: String?
        if(status == nil) {
            message = "다시 시도해주세요."
        } else if(status == "fillError") {
            message = "모든 항목을 채워주세요."
        }
        let alert = UIAlertController(title: "로그인 오류", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
