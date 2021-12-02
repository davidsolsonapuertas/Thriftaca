//
//  itemCollectionViewController.swift
//  Thriftaca
//
//  Created by JJ on 11/21/21.
//

import UIKit
import SnapKit

protocol UpdateNameDelegate: AnyObject {
    func updateName(newString: String)
}

class itemCollectionViewController: UIViewController {
    
    private var itemCollectionView: UICollectionView!
    private var filterCollectionView: UICollectionView!
    private var addButton = UIButton()
    private let itemReuseIdentifier = "itemReuseIdentifier"
    private let filterReuseIdentifier = "filterReuseIdentifer"
    private let cellPadding: CGFloat = 50
    private let sectionPadding: CGFloat = 10
    
    var newItems: [Item] = []
    
    private let filters: [Filter] = [
        Filter(filterName: "Shirts"),
        Filter(filterName: "Pants"),
        Filter(filterName: "Hoodies"),
        Filter(filterName: "Socks"),
        Filter(filterName: "Accesories"),
        Filter(filterName: "Shoes"),
        Filter(filterName: "Cosmetics"),
        Filter(filterName: "Fandoms"),
        Filter(filterName: "Electronics"),
        Filter(filterName: "School Supplies")
    ]
    
    private let Items: [Item] = [
        Item(image:"1", price: 15, name: "shirt", category: "Shirts"),
        Item(image:"2", price: 40, name: "fridge", category: "Electronics"),
        Item(image:"3", price: 15, name: "album", category: "Fandoms"),
        Item(image:"4", price: 60, name: "shoes", category: "Shoes"),
        Item(image:"5", price: 80, name: "calculator", category: "School Supplies"),
        Item(image:"6", price: 25, name: "hoodie", category: "Hoodies"),
        Item(image:"7", price: 20, name: "phone case", category: "Accesories"),
        Item(image:"8", price: 900, name: "MacBook", category: "Electronics"),
        Item(image:"9", price: 15, name: "lamp", category: "Eletronics")
    ]
    //work and manipulate with this one
    private var items: [Item] = [
        Item(image:"1", price: 15, name: "shirt", category: "Shirts"),
        Item(image:"2", price: 40, name: "fridge", category: "Electronics"),
        Item(image:"3", price: 15, name: "album", category: "Fandoms"),
        Item(image:"4", price: 60, name: "shoes", category: "Shoes"),
        Item(image:"5", price: 80, name: "calculator", category: "School Supplies"),
        Item(image:"6", price: 25, name: "hoodie", category: "Hoodies"),
        Item(image:"7", price: 20, name: "phone case", category: "Accesories"),
        Item(image:"8", price: 900, name: "MacBook", category: "Electronics"),
        Item(image:"9", price: 15, name: "lamp", category: "Eletronics")
    ]
    
    private var selected: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This will remove the back button so that you cannot go back once you log in or register
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true;
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false;
        self.navigationController!.interactivePopGestureRecognizer!.isEnabled = false;
        
        title = "Items"
        view.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 204/255, alpha: 1.0)
        
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
        
        addButton.setTitle("Add product", for: .normal)
        addButton.backgroundColor = .blue
        addButton.layer.cornerRadius = 10
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(addButton)
        
        setupConstraints()
    }
    
    @objc func buttonTapped() {
        let vc = addProductViewController()
         navigationController?.pushViewController(vc, animated: true)
        print("here")
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
//            itemCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: itemListPadding),
//            itemCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -itemListPadding + 20),
//            itemCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -itemListPadding)
        ])
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
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
                
                newItems.append(contentsOf: Items.filter{$0.category.contains(filter)})
            }
            else{
                filters[indexPath.item].isSelected.toggle()//false now
                let filter = filters[indexPath.item].filterName
                let index = selected.firstIndex(of: filter) ?? 0
                selected.remove(at: index)
                newItems = newItems.filter{!$0.category.contains(filter)}
            }
            
            items = newItems
            
            if selected == []{
                items = Items
            }

            filterCollectionView.reloadData()
            itemCollectionView.reloadData()
            
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


