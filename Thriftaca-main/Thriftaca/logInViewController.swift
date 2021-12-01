//  logInViewController.swift
//  Thriftaca
//
//  Created by JJ on 11/19/21.
//

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

    var heading = UILabel()
    
    var username = TextFieldWithPadding()
    var password = TextFieldWithPadding()
    
    var enter = UIButton()
    
    var phImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 229/255, green: 204/255, blue: 255/255, alpha: 1.0)
        title = "Login"
        
        heading.text = "THRIFTACA"
        heading.font = UIFont(name:"TrebuchetMS-Bold", size: 30)
        heading .textColor = UIColor(red: 145/255, green: 32/255, blue: 32/255, alpha: 1.0)
        view.addSubview(heading)
        
        
        username.placeholder = "Enter username"
        username.backgroundColor = .white
        username.adjustsFontSizeToFitWidth = true
        username.layer.cornerRadius = 5
        view.addSubview(username)
        
        password.placeholder = "Enter password"
        password.backgroundColor = .white
        password.adjustsFontSizeToFitWidth = true
        password.layer.cornerRadius = 5
        view.addSubview(password)
        
        enter.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 204/255, alpha: 1.0)
        enter.setTitle("Log In", for: .normal)
        enter.setTitleColor(.purple, for: .normal)
        enter.layer.cornerRadius = 20
        enter.addTarget(self, action: #selector(goToCollection), for: .touchUpInside)
        view.addSubview(enter)
        
        phImage.image = UIImage(named: "picPH")
        phImage.contentMode = .scaleAspectFill
        phImage.clipsToBounds = true
        
        view.addSubview(phImage)
        setupConstraints()
    }
    @objc func goToCollection(){
        let collectionViewController = itemCollectionViewController()
        navigationController?.pushViewController(collectionViewController, animated: true)
        
    }
    
    
    
    func setupConstraints(){
        username.snp.makeConstraints { make in
            make.centerY.equalTo(phImage.snp_bottomMargin).offset(60)
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
        enter.snp.makeConstraints { make in
            make.top.equalTo(password.snp_bottomMargin).offset(50)
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

