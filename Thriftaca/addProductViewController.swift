//
//  addProductViewController.swift
//  Thriftaca
//
//  Created by David Solsona on 01/12/2021.
//

import UIKit
import SnapKit

class addProductViewController: UIViewController, UITextFieldDelegate {
    
    var name = TextFieldWithPadding()
    var price = TextFieldWithPadding()
    var category = TextFieldWithPadding()
    var formatter: NumberFormatter!
    
    var imageView = UIImageView()
    var imagePicker: ImagePicker!
    
    var uploadImage = UIButton()
    var enter = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add product"
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        view.backgroundColor = UIColor(red: 229/255, green: 204/255, blue: 255/255, alpha: 1.0)
        
        name.placeholder = "Name"
        name.backgroundColor = .white
        name.adjustsFontSizeToFitWidth = true
        name.layer.cornerRadius = 5
        view.addSubview(name)
        
        formatter = NumberFormatter()
        formatter.numberStyle = .decimal
                formatter.minimum = 0
        
        price.delegate = self
        price.placeholder = "Price"
        price.backgroundColor = .white
        price.adjustsFontSizeToFitWidth = true
        price.layer.cornerRadius = 5
        view.addSubview(price)
        
        uploadImage.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 204/255, alpha: 1.0)
        uploadImage.setTitle("Upload image", for: .normal)
        uploadImage.setTitleColor(.purple, for: .normal)
        uploadImage.layer.cornerRadius = 20
        uploadImage.addTarget(self, action: #selector(showImagePicker), for: .touchUpInside)
        view.addSubview(uploadImage)
        
        enter.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 204/255, alpha: 1.0)
        enter.setTitle("Add product", for: .normal)
        enter.setTitleColor(.purple, for: .normal)
        enter.layer.cornerRadius = 20
        enter.addTarget(self, action: #selector(sendForm), for: .touchUpInside)
        view.addSubview(enter)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        view.addSubview(imageView)
        setupConstraints()
    }
    
    @objc func goToCollection(){
        let collectionViewController = itemCollectionViewController()
        navigationController?.pushViewController(collectionViewController, animated: true)
        
    }
    
    @objc func sendForm(){
        NetworkManager.uploadImage(image: imageView.image!) { res in
            
        }
    }
    
    @objc func showImagePicker(_ sender: UIButton) {
            self.imagePicker.present(from: sender)
        }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // Combine the current text field value and the new string
            // character. If it conforms to the formatter's settings then
            // it is valid. If it doesn't then nil is returned and the
            // string character should not be allowed in the text field.
        return formatter.number(from: "\(price.text ?? "0.00")\(string)") != nil
        }
    
    func setupConstraints(){
        uploadImage.snp.makeConstraints { make in
            make.centerY.equalTo(imageView.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        name.snp.makeConstraints { make in
            make.centerY.equalTo(uploadImage.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        price.snp.makeConstraints { make in
            make.top.equalTo(name.snp_bottomMargin).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(40)
            make.centerX.equalTo(self.view)
        }
        enter.snp.makeConstraints { make in
            make.top.equalTo(price.snp_bottomMargin).offset(50)
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(30)
            make.centerX.equalTo(self.view)
            make.width.equalTo(225)
            make.height.equalTo(275)
        }
        
    }
}

extension addProductViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.imageView.image = image
    }
}

