//
//  itemCollectionViewController.swift
//  Thriftaca
//
//  Created by JJ on 11/21/21.
//

import UIKit
import SnapKit



class itemCollectionViewController: UIViewController{

    private var itemCollectionView: UICollectionView!
    private var filterCollectionView: UICollectionView!
    private let itemReuseIdentifier = "itemReuseIdentifier"
    private let filterReuseIdentifier = "filterReuseIdentifer"
    private let cellPadding: CGFloat = 60
    private let sectionPadding: CGFloat = 10
    
    private let filters: [Filter] = [
        Filter(filterName: "Shirts"),
        Filter(filterName: "Pants"),
        Filter(filterName: "Hoodies"),
        Filter(filterName: "Hair"),
        Filter(filterName: "Accesories"),
        Filter(filterName: "Shoes"),
        Filter(filterName: "Cosmetics"),
        Filter(filterName: "Fandoms"),
        Filter(filterName: "Electronics"),
        Filter(filterName: "School Supplies")
    ]
    
    private let Items: [Item] = [
        Item(image:"1", price: "15", name: "brandy melville yellow top", category: "Shirts", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "only worn twice; size medium; like new"),
        Item(image:"2", price: "40", name: "pink mini fridge", category: "Electronics", email: "jjbai@gmail.com", phone: "(310)389-1909", descriptions: "brand new, violates fire code"),
        Item(image:"3", price: "15", name: "shinee atlantis album", category: "Fandoms", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "looking for a gf too if anyone interested please please"),
        Item(image:"4", price: "60", name: "dr martens black jadon", category: "Shoes", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "only worn 8 times; size 10; like new"),
        Item(image:"5", price: "80", name: "calculator", category: "School Supplies", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "dropping my math major"),
        Item(image:"6", price: "25", name: "vintage nike gray hoodie", category: "Hoodies", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "gf broke up with me; size small; like new"),
        Item(image:"7", price: "20", name: "phone case", category: "Accesories", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "bought it at Disneyland"),
        Item(image:"8", price: "900", name: "MacBook", category: "Electronics", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "i hate Macs"),
        Item(image:"9", price: "15", name: "ikea lamp", category: "Eletronics", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "broken lightbulb")
    ]
    //work and manipulate with this one
    private var items: [Item] = [
        Item(image:"1", price: "15", name: "brandy melville yellow top", category: "Shirts", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "only worn twice; size medium; like new"),
        Item(image:"2", price: "40", name: "pink mini fridge", category: "Electronics", email: "jjbai@gmail.com", phone: "(310)389-1909", descriptions: "brand new, violates fire code"),
        Item(image:"3", price: "15", name: "shinee atlantis album", category: "Fandoms", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "looking for a gf too if anyone interested please please"),
        Item(image:"4", price: "60", name: "dr martens black jadon", category: "Shoes", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "only worn 8 times; size 10; like new"),
        Item(image:"5", price: "80", name: "calculator", category: "School Supplies", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "dropping my math major"),
        Item(image:"6", price: "25", name: "vintage nike gray hoodie", category: "Hoodies", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "gf broke up with me; size small; like new"),
        Item(image:"7", price: "20", name: "phone case", category: "Accesories", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "bought it at Disneyland"),
        Item(image:"8", price: "900", name: "MacBook", category: "Electronics", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "i hate Macs"),
        Item(image:"9", price: "15", name: "ikea lamp", category: "Eletronics", email: "derekhuang@gmail.com", phone: "(324)432-1909", descriptions: "broken lightbulb")
    ]
    
    private var selected: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shop"
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        
        let itemsLayout = UICollectionViewFlowLayout()
        itemsLayout.minimumLineSpacing = cellPadding
        itemsLayout.minimumInteritemSpacing = cellPadding - 10
        itemsLayout.scrollDirection = .vertical
        itemsLayout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
    
        itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: itemsLayout)
        itemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        itemCollectionView.backgroundColor = .clear
        
        itemCollectionView.register(itemCollectionViewCell.self, forCellWithReuseIdentifier: itemReuseIdentifier)
        
        itemCollectionView.dataSource = self
        itemCollectionView.delegate = self
        
        view.addSubview(itemCollectionView)
        
        let filterLayout = UICollectionViewFlowLayout()
        filterLayout.scrollDirection = .horizontal
        filterLayout.minimumInteritemSpacing = sectionPadding
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filterLayout)
        filterCollectionView.backgroundColor = .white
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filterCollectionView)
        
        filterCollectionView.register(filterCollectionViewCell.self, forCellWithReuseIdentifier: filterReuseIdentifier)
        
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        
        setupConstraints()
    }

    func setupConstraints(){
        let itemListPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 50),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            itemCollectionView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor),
            itemCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: itemListPadding),
            itemCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -itemListPadding + 20),
            itemCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -itemListPadding)
        ])
    }
}
extension itemCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // If we are doing sections later, change items to a 2D array
//        return 1
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == itemCollectionView{
            return items.count
        }
        else{
            return filters.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.itemCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemReuseIdentifier, for: indexPath) as! itemCollectionViewCell
            cell.configure(for: items[indexPath.item])
            return cell
        }
        else {
            let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: filterReuseIdentifier, for: indexPath) as! filterCollectionViewCell
            let filter = filters[indexPath.item]
            cell.configure(for: filter)
            return cell
        }
}
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.itemCollectionView{
            let numItemsPerRow: CGFloat = 2.0
            let size = (collectionView.frame.width - cellPadding) / numItemsPerRow
            return CGSize(width: size, height: size)
        }
        else{
            let numItemsPerRow: CGFloat = 3.0
            let size = (collectionView.frame.width - cellPadding) / numItemsPerRow
            return CGSize(width: size, height: 50)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == filterCollectionView{
            if filters[indexPath.item].isSelected == false {
                filters[indexPath.item].isSelected.toggle()//true now
                let filter = filters[indexPath.item].filterName
                selected.append(filter)
                print(selected)
            }
            else{
                filters[indexPath.item].isSelected.toggle()//false now
                let filter = filters[indexPath.item].filterName
                let index = selected.firstIndex(of: filter) ?? 0
                selected.remove(at: index)
            }
            for i in selected{
                items = Items.filter{$0.category.contains(i)}
            }
            if selected == []{
                items = Items
            }
            filterCollectionView.reloadData()
            itemCollectionView.reloadData()
        }
        else if collectionView == itemCollectionView{
            let vc = PushViewController(image: Items[indexPath.item].image, price: Items[indexPath.item].price, name: Items[indexPath.item].name, category: Items[indexPath.item].category, email: Items[indexPath.item].email, phone: Items[indexPath.item].phone, descriptions: Items[indexPath.item].descriptions)
            
            
            
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}










    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */


