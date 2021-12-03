//
//  itemCollectionViewCell.swift
//  Thriftaca
//
//  Created by JJ on 11/21/21.

import UIKit

class itemCollectionViewCell: UICollectionViewCell {
    private var itemImageView = UIImageView()
    private var itemPrice = UILabel()
    private var itemName = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = false

        itemPrice.font = UIFont(name: "Futura Bold", size: 15)
        itemPrice.textColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        itemPrice.textAlignment = .left
        itemPrice.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(itemPrice)
        
        itemName.font = UIFont(name: "Futura", size: 13)
        itemName.textColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        itemName.textAlignment = .left
        itemName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(itemName)
        
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(itemImageView)
        
        setUpConstraints()
    }
    
    func configure(for item: Item){
        itemPrice.text = "$\(item.price)"
        itemName.text = item.name
        itemImageView.image = UIImage(named: item.image)
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
            itemPrice.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 10),
            itemPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemPrice.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        NSLayoutConstraint.activate([
            itemName.topAnchor.constraint(equalTo: itemPrice.bottomAnchor),
            itemName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemName.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
