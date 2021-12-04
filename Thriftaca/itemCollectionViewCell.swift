import UIKit

class itemCollectionViewCell: UICollectionViewCell {
    private var itemImageView = UIImageView()
    private var itemPrice = UILabel()
    private var itemName = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)

        itemPrice.textColor = .black
        itemPrice.translatesAutoresizingMaskIntoConstraints = false
        itemPrice.font = UIFont(name: "Futura Bold", size: 15)
        contentView.addSubview(itemPrice)
        
        itemName.font = UIFont(name: "Futura", size: 15)
        itemName.textColor = .black
        itemName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(itemName)
        
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = false
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(itemImageView)
        
        setUpConstraints()
    }
    
    func configure(for item: Item){
        itemPrice.text = "$\(item.price)"
        itemName.text = item.post_title
        itemImageView.downloaded(from: item.image_url)
    }
    
    func setUpConstraints(){
            let labelHeight: CGFloat = 20
            
            NSLayoutConstraint.activate([
                itemImageView.topAnchor.constraint(equalTo:contentView.topAnchor),
                itemImageView.bottomAnchor.constraint(equalTo:contentView.bottomAnchor),
                itemImageView.leadingAnchor.constraint(equalTo:contentView.leadingAnchor),
                itemImageView.trailingAnchor.constraint(equalTo:contentView.trailingAnchor)
            ])
            NSLayoutConstraint.activate([
                itemPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                itemPrice.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 10),
                itemPrice.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
            
            NSLayoutConstraint.activate([
                itemName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                itemName.topAnchor.constraint(equalTo: itemPrice.bottomAnchor),
                itemName.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
