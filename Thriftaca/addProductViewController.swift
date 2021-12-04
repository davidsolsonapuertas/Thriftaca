import UIKit
import SnapKit

class addProductViewController: UIViewController, UITextFieldDelegate {
    
    var name = TextFieldWithPadding()
    var category = TextFieldWithPadding()
    var descriptionField = TextFieldWithPadding()
    var price = TextFieldWithPadding()
    var formatter: NumberFormatter!
    var image: String = ""
    
    var imageView = UIImageView()
    var imagePicker: ImagePicker!
    
    var uploadImage = UIButton()
    var enter = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround() 
        title = "Add product"
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        view.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        
        name.placeholder = "Name"
        name.backgroundColor = .white
        name.adjustsFontSizeToFitWidth = true
        name.layer.cornerRadius = 5
        view.addSubview(name)
        
        category.placeholder = "Category"
        category.backgroundColor = .white
        category.adjustsFontSizeToFitWidth = true
        category.layer.cornerRadius = 5
        view.addSubview(category)
        
        descriptionField.placeholder = "Description"
        descriptionField.backgroundColor = .white
        descriptionField.adjustsFontSizeToFitWidth = true
        descriptionField.layer.cornerRadius = 5
        view.addSubview(descriptionField)
        
        formatter = NumberFormatter()
        formatter.numberStyle = .decimal
                formatter.minimum = 0
        
        price.delegate = self
        price.placeholder = "Price"
        price.backgroundColor = .white
        price.adjustsFontSizeToFitWidth = true
        price.layer.cornerRadius = 5
        view.addSubview(price)
        
        uploadImage.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        uploadImage.setTitle("Upload image", for: .normal)
        uploadImage.setTitleColor(.white, for: .normal)
        uploadImage.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        uploadImage.layer.cornerRadius = 20
        uploadImage.addTarget(self, action: #selector(showImagePicker), for: .touchUpInside)
        view.addSubview(uploadImage)
        
        enter.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        enter.setTitle("Add product", for: .normal)
        enter.setTitleColor(.white, for: .normal)
        enter.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        enter.layer.cornerRadius = 20
        enter.addTarget(self, action: #selector(sendForm), for: .touchUpInside)
        view.addSubview(enter)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        view.addSubview(imageView)
        setupConstraints()
    }
    
    @objc func sendForm(){
        if (imageView.image != nil) {
            NetworkManager.uploadImage(image: imageView.image!) { res in
                self.image = res
            }
        }
        if (name.text != "" && category.text != "" && price.text != "" && image != "" && descriptionField.text != "") {
            NetworkManager.createProduct(post_title: name.text!, category: category.text!, price: Double(price.text!)!, description: descriptionField.text!, image_url: image) {
                res in
                if (res.image_url.count > 0) {
                    let vc = itemCollectionViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                    //vc.itemCollectionView.reloadData()
                }
            }
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
        descriptionField.snp.makeConstraints { make in
            make.top.equalTo(name.snp_bottomMargin).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(40)
            make.centerX.equalTo(self.view)
        }
        category.snp.makeConstraints { make in
            make.top.equalTo(descriptionField.snp_bottomMargin).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(40)
            make.centerX.equalTo(self.view)
        }
        price.snp.makeConstraints { make in
            make.top.equalTo(category.snp_bottomMargin).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(40)
            make.centerX.equalTo(self.view)
        }
        enter.snp.makeConstraints { make in
            make.centerY.equalTo(price.snp_bottomMargin).offset(60)
            make.centerX.equalTo(self.view)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(30)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
    }
}

extension addProductViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.imageView.image = image
    }
}

