//
//  filterCollectionViewCell.swift
//  Thriftaca
//
//  Created by JJ on 11/30/21.
//

import UIKit
import SnapKit

class filterCollectionViewCell: UICollectionViewCell {
    private var filterLabel = UILabel()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .clear
        filterLabel.contentMode = .scaleAspectFit
        filterLabel.font = .systemFont(ofSize: 20)
        filterLabel.textColor = .darkGray
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(filterLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for filter: Filter) {
        filterLabel.text = filter.getLabel()
        
        if filter.isSelected == true{
            filterLabel.backgroundColor = .white
        }
        else{
            filterLabel.backgroundColor = UIColor(red: 229/255, green: 204/255, blue: 255/255, alpha: 1.0)
        }
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            filterLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            filterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            filterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            filterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    
}
