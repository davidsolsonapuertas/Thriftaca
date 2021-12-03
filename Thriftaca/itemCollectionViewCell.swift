//
//  itemCollectionViewCell.swift
//  Thriftaca
//
//  Created by JJ on 11/21/21.
//

import UIKit

class itemCollectionViewCell: UICollectionViewCell {
    private var itemImageView = UIImageView()
    private var itemPrice = UILabel()
    private var itemName = UILabel()
    //private var user: User = new User()
    
    override init(frame: CGRect){
        super.init(frame: frame)

        itemPrice.font = .systemFont(ofSize: 15)
        itemPrice.textColor = .black
        itemPrice.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(itemPrice)
        
        itemName.font = .systemFont(ofSize: 15)
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
        itemImageView.image = UIImage(named: item.image_url)
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
            itemPrice.topAnchor.constraint(equalTo: itemImageView.bottomAnchor),
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
