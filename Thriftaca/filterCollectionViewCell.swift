import UIKit
import SnapKit

class filterCollectionViewCell: UICollectionViewCell {
    private var filterLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .clear
        contentView.clipsToBounds = true
        
        filterLabel.font = UIFont(name: "Futura Bold", size: 15)
        filterLabel.textColor = UIColor(red: 134/255, green: 38/255, blue: 51/255, alpha: 1)
        filterLabel.adjustsFontSizeToFitWidth = true
        filterLabel.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        filterLabel.contentMode = .scaleAspectFit
        filterLabel.textAlignment = .center
        filterLabel.layer.cornerRadius = 20
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
            filterLabel.backgroundColor = UIColor(red: 134/255, green: 38/255, blue: 51/255, alpha: 1)
            filterLabel.textColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        }
        else{
            filterLabel.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
            filterLabel.textColor = UIColor(red: 134/255, green: 38/255, blue: 51/255, alpha: 1)
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
