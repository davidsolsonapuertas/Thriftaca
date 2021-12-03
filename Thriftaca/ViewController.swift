import UIKit

class ViewController: UIViewController {
    var username = TextFieldWithPadding()
    var password = TextFieldWithPadding()
    var login = UIButton()
    var register = UIButton()
    var phImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        view.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        
        login.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        login.setTitle("Log In", for: .normal)
        login.setTitleColor(.white, for: .normal)
        login.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        login.layer.cornerRadius = 20
        login.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        view.addSubview(login)
        
        register.backgroundColor = .white
        register.setTitle("Register", for: .normal)
        register.setTitleColor(.black, for: .normal)
        register.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        register.layer.cornerRadius = 20
        register.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
        view.addSubview(register)
        
        phImage.image = UIImage(named: "logo1")
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
            make.centerY.equalTo(phImage.snp_bottomMargin).offset(100)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        register.snp.makeConstraints { make in
            make.centerY.equalTo(login.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        phImage.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(30)
            make.centerX.equalTo(self.view)
            make.width.equalTo(275)
            make.height.equalTo(325)
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
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
