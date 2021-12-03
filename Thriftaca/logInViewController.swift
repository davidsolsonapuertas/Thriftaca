//  logInViewController.swift
//  Thriftaca
//
//  Created by JJ on 11/19/21.
//
<<<<<<< HEAD

//
=======
>>>>>>> 1b4d611c0fd6c46ce3b29eee9671b844e9f16185
//  ViewController.swift
//  Final_Project
//
//  Created by JJ on 11/19/21.
//

//*NOTE* change color theme, fonts, and picture later on

import UIKit
import SnapKit

class loginViewController: UIViewController {
<<<<<<< HEAD

    var heading = UILabel()
    
    var email = TextFieldWithPadding()
    var password = TextFieldWithPadding()
    var alert = UIAlertController(title: "Error", message: "Login failed.", preferredStyle: .alert)
    
    var enter = UIButton()
    
    var phImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 229/255, green: 204/255, blue: 255/255, alpha: 1.0)
        title = "Login"
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        heading.text = "THRIFTACA"
        heading.font = UIFont(name:"TrebuchetMS-Bold", size: 30)
        heading .textColor = UIColor(red: 145/255, green: 32/255, blue: 32/255, alpha: 1.0)
        view.addSubview(heading)
        
        email.placeholder = "Enter email"
        email.backgroundColor = .white
        email.adjustsFontSizeToFitWidth = true
        email.layer.cornerRadius = 5
        view.addSubview(email)
        
        password.placeholder = "Enter password"
        password.backgroundColor = .white
        password.adjustsFontSizeToFitWidth = true
        password.layer.cornerRadius = 5
        view.addSubview(password)
        
        enter.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 204/255, alpha: 1.0)
        enter.setTitle("Log In", for: .normal)
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
        if (email.text != "" && password.text != "") {
            NetworkManager.loginUser(email: email.text!, password: password.text!) {res in
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
        email.snp.makeConstraints { make in
            make.centerY.equalTo(phImage.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        password.snp.makeConstraints { make in
            make.top.equalTo(email.snp_bottomMargin).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(40)
            make.centerX.equalTo(self.view)
        }
        enter.snp.makeConstraints { make in
            make.top.equalTo(password.snp_bottomMargin).offset(50)
=======
    
    var phImage = UIImageView()
    var usernameLabel = UILabel()
    var username = TextFieldWithPadding()
    var passwordLabel = UILabel()
    var password = TextFieldWithPadding()
    var enter = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        title = "Log In"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura Bold", size: 19)!]
        
        usernameLabel.text = "username"
        usernameLabel.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        usernameLabel.font = UIFont(name: "Futura Bold", size: 17)
        usernameLabel.textAlignment = .left
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameLabel)
        
        username.placeholder = "enter username"
        username.font = UIFont(name: "Futura", size: 15)
        username.backgroundColor = .white
        username.adjustsFontSizeToFitWidth = true
        username.layer.cornerRadius = 5
        username.layer.borderWidth = 2.0;
        username.layer.borderColor = CGColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        username.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(username)
        
        passwordLabel.text = "password"
        passwordLabel.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        passwordLabel.font = UIFont(name: "Futura Bold", size: 17)
        passwordLabel.textAlignment = .left
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)
        
        password.placeholder = "enter password"
        password.font = UIFont(name: "Futura", size: 15)
        password.backgroundColor = .white
        password.adjustsFontSizeToFitWidth = true
        password.layer.cornerRadius = 5
        password.layer.borderWidth = 2.0;
        password.layer.borderColor = CGColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        password.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(password)
        
        enter.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        enter.setTitle("Log In", for: .normal)
        enter.setTitleColor(.white, for: .normal)
        enter.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        enter.layer.cornerRadius = 20
        enter.addTarget(self, action: #selector(goToCollection), for: .touchUpInside)
        enter.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enter)
        
        phImage.image = UIImage(named: "logo2")
        phImage.contentMode = .scaleAspectFill
        phImage.clipsToBounds = true
        phImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phImage)
        
        setupConstraints()
    }
    @objc func goToCollection(){
        let collectionViewController = itemCollectionViewController()
        navigationController?.pushViewController(collectionViewController, animated: true)
    }
    
    func setupConstraints(){
        phImage.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(30)
            make.centerX.equalTo(self.view)
            make.width.equalTo(225)
            make.height.equalTo(275)
        }
        usernameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(phImage.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(20)
        }
        username.snp.makeConstraints { make in
            make.centerY.equalTo(usernameLabel.snp_bottomMargin).offset(40)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(40)
        }
        passwordLabel.snp.makeConstraints { make in
            make.centerY.equalTo(username.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(20)
        }
        password.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp_bottomMargin).offset(15)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(40)
        }
        enter.snp.makeConstraints { make in
            make.top.equalTo(password.snp_bottomMargin).offset(60)
>>>>>>> 1b4d611c0fd6c46ce3b29eee9671b844e9f16185
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
<<<<<<< HEAD
        heading.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(35)
            make.centerX.equalTo(self.view)
            make.height.equalTo(50)
            make.width.equalTo(175)
        }
        phImage.snp.makeConstraints { make in
            make.top.equalTo(heading.snp_bottomMargin).offset(30)
            make.centerX.equalTo(self.view)
            make.width.equalTo(225)
            make.height.equalTo(275)
        }
        
=======
>>>>>>> 1b4d611c0fd6c46ce3b29eee9671b844e9f16185
    }
}

