import UIKit
import SnapKit

class specificViewController: UIViewController {
    var image_url: String
    var price: String
    var post_title: String
    var category: String
    var email: String
    var contact_info: String
    var descriptions: String
    
    init(image_url: String, price: String, post_title:String, category: String, descriptions: String, email: String, contact_info: String){
        self.image_url = image_url
        self.price = price
        self.post_title = post_title
        self.category = category
        self.email = email
        self.contact_info = contact_info
        self.descriptions = descriptions
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var index = 1
    private var itemImageView = UIImageView()
    private var itemPrice = UILabel()
    private var itemName = UILabel()
    private var itemDescription = UILabel()
    private var sellerEmail = UILabel()
    private var sellerPhone = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        
        itemImageView.downloaded(from: image_url)
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(itemImageView)
        
        itemPrice.text = "$\(price)"
        itemPrice.font = UIFont(name: "Futura Bold", size: 18)
        itemPrice.textColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        itemPrice.textAlignment = .center
        itemPrice.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(itemPrice)
        
        itemName.text = post_title
        itemName.font = UIFont(name: "Futura", size: 13)
        itemName.textColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        itemName.textAlignment = .center
        itemName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(itemName)
        
        itemDescription.text = descriptions
        itemDescription.font = UIFont(name: "Futura", size: 13)
        itemDescription.textColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        itemDescription.textAlignment = .left
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(itemDescription)
        
        sellerEmail.text = email
        sellerEmail.font = UIFont(name: "Futura", size: 13)
        sellerEmail.textColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        sellerEmail.textAlignment = .right
        sellerEmail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sellerEmail)

        sellerPhone.text = contact_info
        sellerPhone.font = UIFont(name: "Futura", size: 13)
        sellerPhone.textColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        sellerPhone.textAlignment = .right
        sellerPhone.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sellerPhone)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            itemImageView.heightAnchor.constraint(equalToConstant: 325),
            itemImageView.widthAnchor.constraint(equalToConstant: 325),
            itemImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            itemPrice.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 10),
            itemPrice.heightAnchor.constraint(equalToConstant: 20),
            itemPrice.widthAnchor.constraint(equalToConstant: 325),
            itemPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            itemName.topAnchor.constraint(equalTo: itemPrice.bottomAnchor, constant: 5),
            itemName.heightAnchor.constraint(equalToConstant: 20),
            itemName.widthAnchor.constraint(equalToConstant: 325),
            itemName.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            itemDescription.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 30),
            itemDescription.heightAnchor.constraint(equalToConstant: 60),
            itemDescription.widthAnchor.constraint(equalToConstant: 325),
            itemDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            sellerEmail.topAnchor.constraint(equalTo: itemDescription.bottomAnchor, constant: 100),
            sellerEmail.heightAnchor.constraint(equalToConstant: 30),
            sellerEmail.widthAnchor.constraint(equalToConstant: 325),
            sellerEmail.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            sellerPhone.topAnchor.constraint(equalTo: sellerEmail.bottomAnchor, constant: 5),
            sellerPhone.heightAnchor.constraint(equalToConstant: 30),
            sellerPhone.widthAnchor.constraint(equalToConstant: 325),
            sellerPhone.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

    }
    @objc func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
}
