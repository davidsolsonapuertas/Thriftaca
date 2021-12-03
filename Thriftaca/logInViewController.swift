//  logInViewController.swift
//  Thriftaca
//
//  Created by JJ on 11/19/21.
//
//  ViewController.swift
//  Final_Project
//
//  Created by JJ on 11/19/21.
//

//*NOTE* change color theme, fonts, and picture later on

import UIKit
import SnapKit

class loginViewController: UIViewController {
    
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
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
}

