//
//  SignUpViewController.swift
//  MiniLog
//
//  Created by 바보세림이 on 2020/07/26.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.addTarget(self, action: #selector(signUpEvent), for: .touchUpInside)
    }
    
    @objc func signUpEvent() {
        if let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text {
            if email == "" || password == "" || name == "" {
                self.showErrorAlert("fillError")
            } else {
                Auth.auth().createUser(withEmail: email, password: password) { (user, err) in
                    let uid = user?.user.uid
                    if(err == nil) {
                        Database.database().reference().child("users").child(uid!).setValue(["email": email, "name": name], withCompletionBlock: { (err, ref) in
                            if(err == nil) {
                                self.dismiss(animated: true, completion: nil)
                            } else {
                                self.showErrorAlert(nil)
                            }
                        })
                    } else {
                        self.showErrorAlert(nil)
                    }

                }
            }
        } else {
            self.showErrorAlert(nil)
        }
    }

    func showErrorAlert(_ status: String?) {
        var message: String?
        if(status == nil) {
            message = "다시 시도해주세요."
        } else if(status == "fillError") {
            message = "모든 항목을 채워주세요."
        }
        let alertController = UIAlertController(title: "회원가입 오류", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
