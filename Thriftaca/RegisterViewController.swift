//
//  RegisterViewController.swift
//  Final_Project
//
//  Created by JJ on 11/19/21.
//


//*NOTE* change color theme, fonts, and picture later on
import UIKit
import SnapKit

class registerViewController: UIViewController {

    var heading = UILabel()
    
    var username = TextFieldWithPadding()
    var password = TextFieldWithPadding()
    var repeatPassword = TextFieldWithPadding()
    var email = TextFieldWithPadding()
    var alert = UIAlertController(title: "Error", message: "Register failed.", preferredStyle: .alert)
    
    var enter = UIButton()
    
    var phImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 229/255, green: 204/255, blue: 255/255, alpha: 1.0)
        title = "Register"
        
        username.placeholder = "Enter username"
        username.backgroundColor = .white
        username.adjustsFontSizeToFitWidth = true
        username.layer.cornerRadius = 5
        view.addSubview(username)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        password.placeholder = "Enter password"
        password.backgroundColor = .white
        password.adjustsFontSizeToFitWidth = true
        password.layer.cornerRadius = 5
        password.isSecureTextEntry = true
        view.addSubview(password)
        
        repeatPassword.placeholder = "Repeat password"
        repeatPassword.backgroundColor = .white
        repeatPassword.adjustsFontSizeToFitWidth = true
        repeatPassword.layer.cornerRadius = 5
        repeatPassword.isSecureTextEntry = true
        view.addSubview(repeatPassword)
        
        email.placeholder = "Enter email"
        email.backgroundColor = .white
        email.adjustsFontSizeToFitWidth = true
        email.layer.cornerRadius = 5
        view.addSubview(email)
        
        enter.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 204/255, alpha: 1.0)
        enter.setTitle("Register", for: .normal)
        enter.setTitleColor(.purple, for: .normal)
        enter.layer.cornerRadius = 20
        enter.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(enter)
        
        phImage.image = UIImage(named: "picPH")
        phImage.contentMode = .scaleAspectFill
        phImage.clipsToBounds = true
        
        view.addSubview(phImage)
        setupConstraints()
    }
    
    @objc func presentAlert() {
        self.present(self.alert, animated: true)
    }
    
    
    @objc func buttonTapped() {
        if (username.text != "" && password.text != "" && email.text != "" &&  repeatPassword.text == password.text) {
            NetworkManager.createUser(email: email.text!, password: password.text!, contact_info: username.text!) {res in
                if (res.session_token.count > 0) {
                    let itemCollectionViewController = itemCollectionViewController()
                    self.navigationController?.pushViewController(itemCollectionViewController, animated: true)
                } else {
                    self.presentAlert()
                }
            }
        } else {
            self.presentAlert()
        }
    }
    
    func setupConstraints(){
        username.snp.makeConstraints { make in
            make.centerY.equalTo(self.view).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        password.snp.makeConstraints { make in
            make.top.equalTo(username.snp_bottomMargin).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(40)
            make.centerX.equalTo(self.view)
        }
        repeatPassword.snp.makeConstraints { make in
            make.top.equalTo(password.snp_bottomMargin).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(40)
            make.centerX.equalTo(self.view)
        }
        email.snp.makeConstraints { make in
            make.top.equalTo(repeatPassword.snp_bottomMargin).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(40)
            make.centerX.equalTo(self.view)
        }
        enter.snp.makeConstraints { make in
            make.top.equalTo(email.snp_bottomMargin).offset(50)
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        phImage.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalTo(self.view)
            make.width.equalTo(225)
            make.height.equalTo(275)
        }
        
    }
}

