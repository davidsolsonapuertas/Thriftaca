//
//  ViewController.swift
//  Thriftaca
//
//  Created by David Solsona on 13/11/2021.
//

import UIKit

class ViewController: UIViewController {

    var heading = UILabel()
    
    var username = TextFieldWithPadding()
    var password = TextFieldWithPadding()
    
    var login = UIButton()
    var register = UIButton()

    var phImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 229/255, green: 204/255, blue: 255/255, alpha: 1.0)
        
        heading.text = "THRIFTACA"
        heading.font = UIFont(name:"TrebuchetMS-Bold", size: 30)
        heading .textColor = UIColor(red: 145/255, green: 32/255, blue: 32/255, alpha: 1.0)
        view.addSubview(heading)
        
        login.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 204/255, alpha: 1.0)
        login.setTitle("Log In", for: .normal)
        login.setTitleColor(.purple, for: .normal)
        login.layer.cornerRadius = 20
        login.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        view.addSubview(login)
        
        register.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 204/255, alpha: 1.0)
        register.setTitle("Register", for: .normal)
        register.setTitleColor(.purple, for: .normal)
        register.layer.cornerRadius = 20
        register.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
        view.addSubview(register)
        
        phImage.image = UIImage(named: "picPH")
        phImage.contentMode = .scaleAspectFill
        phImage.clipsToBounds = true
        
        view.addSubview(phImage)
        setupConstraints()
    }
    
    @objc func goToLogin() {
        let loginViewController = loginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc func goToRegister() {
        let registerViewController = registerViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    func setupConstraints(){
        login.snp.makeConstraints { make in
            make.centerY.equalTo(phImage.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        register.snp.makeConstraints { make in
            make.centerY.equalTo(login.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
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
        
    }


}
