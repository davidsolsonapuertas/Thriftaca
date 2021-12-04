import UIKit
import SnapKit

class registerViewController: UIViewController {

    var phImage = UIImageView()
    var usernameLabel = UILabel()
    var username = TextFieldWithPadding()
    
    var passwordLabel = UILabel()
    var password = TextFieldWithPadding()
    
    var repeatPasswordLabel = UILabel()
    var repeatPassword = TextFieldWithPadding()
    
    var emailLabel = UILabel()
    var email = TextFieldWithPadding()
    
    var enter = UIButton()
    
    var alert = UIAlertController(title: "Error", message: "Register failed.", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround() 
        view.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        title = "Register"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura Bold", size: 19)!]
        
        phImage.image = UIImage(named: "logo2")
        phImage.contentMode = .scaleAspectFill
        phImage.clipsToBounds = true
        phImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phImage)
        
        usernameLabel.text = "phone"
        usernameLabel.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        usernameLabel.font = UIFont(name: "Futura Bold", size: 17)
        usernameLabel.textAlignment = .left
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameLabel)
        
        username.placeholder = "enter email"
        username.font = UIFont(name: "Futura", size: 15)
        username.backgroundColor = .white
        username.adjustsFontSizeToFitWidth = true
        username.layer.cornerRadius = 5
        username.layer.borderWidth = 2.0;
        username.layer.borderColor = CGColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        username.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(username)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
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
        password.isSecureTextEntry = true
        password.layer.cornerRadius = 5
        password.layer.borderWidth = 2.0;
        password.layer.borderColor = CGColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        password.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(password)
        
        repeatPasswordLabel.text = "repeat password"
        repeatPasswordLabel.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        repeatPasswordLabel.font = UIFont(name: "Futura Bold", size: 17)
        repeatPasswordLabel.textAlignment = .left
        repeatPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(repeatPasswordLabel)
        
        repeatPassword.placeholder = "enter password"
        repeatPassword.font = UIFont(name: "Futura", size: 15)
        repeatPassword.backgroundColor = .white
        repeatPassword.adjustsFontSizeToFitWidth = true
        repeatPassword.isSecureTextEntry = true
        repeatPassword.layer.cornerRadius = 5
        repeatPassword.layer.borderWidth = 2.0;
        repeatPassword.layer.borderColor = CGColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        repeatPassword.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(repeatPassword)
        
        emailLabel.text = "email"
        emailLabel.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        emailLabel.font = UIFont(name: "Futura Bold", size: 17)
        emailLabel.textAlignment = .left
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)
        
        email.placeholder = "enter phone"
        email.font = UIFont(name: "Futura", size: 15)
        email.backgroundColor = .white
        email.adjustsFontSizeToFitWidth = true
        email.layer.cornerRadius = 5
        email.layer.borderWidth = 2.0;
        email.layer.borderColor = CGColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        email.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(email)
        
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
        phImage.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(self.view)
            make.width.equalTo(125)
            make.height.equalTo(175)
        }
        emailLabel.snp.makeConstraints { make in
            make.centerY.equalTo(phImage.snp_bottomMargin).offset(30)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(20)
        }
        email.snp.makeConstraints { make in
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
            make.centerY.equalTo(passwordLabel.snp_bottomMargin).offset(40)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(40)
        }
        repeatPasswordLabel.snp.makeConstraints { make in
            make.centerY.equalTo(password.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(20)
        }
        repeatPassword.snp.makeConstraints { make in
            make.centerY.equalTo(repeatPasswordLabel.snp_bottomMargin).offset(40)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(40)
        }
        usernameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(repeatPassword.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(20)
        }
        username.snp.makeConstraints { make in
            make.centerY.equalTo(emailLabel.snp_bottomMargin).offset(40)
            make.centerX.equalTo(self.view)
            make.width.equalTo(330)
            make.height.equalTo(40)
        }
        enter.snp.makeConstraints { make in
            make.top.equalTo(email.snp_bottomMargin).offset(40)
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
}
