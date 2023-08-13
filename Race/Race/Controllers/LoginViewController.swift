//
//  LoginViewController.swift
//  Race
//
//  Created by Валентина Лінчук on 07/08/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    let bottomConstraintConstant: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        registerKeyboardNotifications()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc
    func keyboardWillShow(_ notification: Foundation.Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        let keyboardHeight = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size.height
        
        bottomConstraint.constant = bottomConstraintConstant + keyboardHeight
        view.layoutIfNeeded()
    }
    
    
    
    @objc
    func keyboardWillHide(_ notification: Foundation.Notification) {
        bottomConstraint.constant = bottomConstraintConstant
        view.layoutIfNeeded()
    }
    
    @objc
    func hideKeyboard() {
        view.endEditing(true)
    }


}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        NotificationCenter.default.post(name: NSNotification.Name("updateUserName"), object: nil, userInfo: ["username": textField.text ?? ""])
        UserDefaults.standard.set(textField.text, forKey: "username")

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.endEditing(true)
        }
        return true
    }
}
