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

    var phImage = UIImageView()
    var emailLabel = UILabel()
    var email = TextFieldWithPadding()
    var passwordLabel = UILabel()
    var password = TextFieldWithPadding()
    var phoneNumberLabel = UILabel()
    var phoneNumber = TextFieldWithPadding()
    var enter = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        title = "Register"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura Bold", size: 19)!]
        
        phImage.image = UIImage(named: "logo2")
        phImage.contentMode = .scaleAspectFill
        phImage.clipsToBounds = true
        phImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phImage)
        
        emailLabel.text = "email"
        emailLabel.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        emailLabel.font = UIFont(name: "Futura Bold", size: 17)
        emailLabel.textAlignment = .left
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)
        
        email.placeholder = "enter email"
        email.font = UIFont(name: "Futura", size: 15)
        email.backgroundColor = .white
        email.adjustsFontSizeToFitWidth = true
        email.layer.cornerRadius = 5
        email.layer.borderWidth = 2.0;
        email.layer.borderColor = CGColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        email.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(email)
        
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
        
        phoneNumberLabel.text = "phone number"
        phoneNumberLabel.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        phoneNumberLabel.font = UIFont(name: "Futura Bold", size: 17)
        phoneNumberLabel.textAlignment = .left
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneNumberLabel)
        
        phoneNumber.placeholder = "enter phone number"
        phoneNumber.font = UIFont(name: "Futura", size: 15)
        phoneNumber.backgroundColor = .white
        phoneNumber.adjustsFontSizeToFitWidth = true
        phoneNumber.layer.cornerRadius = 5
        phoneNumber.layer.borderWidth = 2.0;
        phoneNumber.layer.borderColor = CGColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneNumber)
        
        enter.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        enter.setTitle("Register", for: .normal)
        enter.setTitleColor(.white, for: .normal)
        enter.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        enter.layer.cornerRadius = 20
        enter.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        enter.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enter)
        
        setupConstraints()
    }
    
    @objc func buttonTapped() {
//        if (username.text != "" && password.text != "" && email.text != "" &&  repeatPassword.text != password.text) {
            let itemCollectionViewController = itemCollectionViewController()
            navigationController?.pushViewController(itemCollectionViewController, animated: true)
        //}
    }
    
    func setupConstraints(){
        phImage.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(30)
            make.centerX.equalTo(self.view)
            make.width.equalTo(175)
            make.height.equalTo(225)
        }
        emailLabel.snp.makeConstraints { make in
            make.centerY.equalTo(phImage.snp_bottomMargin).offset(40)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(20)
        }
        email.snp.makeConstraints { make in
            make.centerY.equalTo(emailLabel.snp_bottomMargin).offset(40)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(40)
        }
        passwordLabel.snp.makeConstraints { make in
            make.centerY.equalTo(email.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(20)
        }
        password.snp.makeConstraints { make in
            make.centerY.equalTo(passwordLabel.snp_bottomMargin).offset(40)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(40)
        }
        phoneNumberLabel.snp.makeConstraints { make in
            make.centerY.equalTo(password.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(20)
        }
        phoneNumber.snp.makeConstraints { make in
            make.centerY.equalTo(phoneNumberLabel.snp_bottomMargin).offset(40)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(40)
        }
        enter.snp.makeConstraints { make in
            make.top.equalTo(phoneNumber.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
}

