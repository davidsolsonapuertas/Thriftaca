//
//  ViewController.swift
//  Thriftaca
//
//  Created by David Solsona on 13/11/2021.
//

import UIKit

class ViewController: UIViewController {
<<<<<<< HEAD

    var heading = UILabel()
=======
>>>>>>> 1b4d611c0fd6c46ce3b29eee9671b844e9f16185
    
    var username = TextFieldWithPadding()
    var password = TextFieldWithPadding()
    
    var login = UIButton()
    var register = UIButton()

    var phImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        view.backgroundColor = UIColor(red: 229/255, green: 204/255, blue: 255/255, alpha: 1.0)
        
        heading.text = "THRIFTACA"
        heading.font = UIFont(name:"TrebuchetMS-Bold", size: 30)
        heading .textColor = UIColor(red: 145/255, green: 32/255, blue: 32/255, alpha: 1.0)
        view.addSubview(heading)
        
        login.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 204/255, alpha: 1.0)
        login.setTitle("Log In", for: .normal)
        login.setTitleColor(.purple, for: .normal)
=======
        view.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        login.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        login.setTitle("Log In", for: .normal)
        login.setTitleColor(.white, for: .normal)
        login.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
>>>>>>> 1b4d611c0fd6c46ce3b29eee9671b844e9f16185
        login.layer.cornerRadius = 20
        login.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        view.addSubview(login)
        
<<<<<<< HEAD
        register.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 204/255, alpha: 1.0)
        register.setTitle("Register", for: .normal)
        register.setTitleColor(.purple, for: .normal)
        register.layer.cornerRadius = 20
        register.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
=======
        register.backgroundColor = .white
        register.setTitle("Register", for: .normal)
        register.setTitleColor(.black, for: .normal)
        register.layer.cornerRadius = 20
        register.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
        register.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
>>>>>>> 1b4d611c0fd6c46ce3b29eee9671b844e9f16185
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
<<<<<<< HEAD
            make.centerY.equalTo(phImage.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
=======
            make.centerY.equalTo(phImage.snp_bottomMargin).offset(100)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
>>>>>>> 1b4d611c0fd6c46ce3b29eee9671b844e9f16185
            make.height.equalTo(50)
        }
        register.snp.makeConstraints { make in
            make.centerY.equalTo(login.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
<<<<<<< HEAD
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

public protocol VCWithBackButtonHandler {
     func shouldPopOnBackButton() -> Bool
}

extension UINavigationController: UINavigationBarDelegate  {
    public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {

        if viewControllers.count < (navigationBar.items?.count) ?? 0 {
            return true
        }

        var shouldPop = true
        let vc = self.topViewController

        if let vc = vc as? VCWithBackButtonHandler {
            shouldPop = vc.shouldPopOnBackButton()
        }

        if shouldPop {
            DispatchQueue.main.async {[weak self] in
                _ = self?.popViewController(animated: true)
            }
        } else {
            for subView in navigationBar.subviews {
                if(0 < subView.alpha && subView.alpha < 1) {
                    UIView.animate(withDuration: 0.25, animations: {
                        subView.alpha = 1
                    })
                }
            }
        }

        return false
=======
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        phImage.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(30)
            make.centerX.equalTo(self.view)
            make.width.equalTo(275)
            make.height.equalTo(325)
        }
>>>>>>> 1b4d611c0fd6c46ce3b29eee9671b844e9f16185
    }
}
