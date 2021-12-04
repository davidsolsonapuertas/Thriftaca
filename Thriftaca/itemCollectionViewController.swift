import UIKit
import SnapKit

protocol UpdateNameDelegate: AnyObject {
    func updateName(newString: String)
}

class itemCollectionViewController: UIViewController {
    
    var itemCollectionView: UICollectionView!
    var filterCollectionView: UICollectionView!
    private var addButton = UIButton()
    private let itemReuseIdentifier = "itemReuseIdentifier"
    private let filterReuseIdentifier = "filterReuseIdentifer"
    private let cellPadding: CGFloat = 50
    private let sectionPadding: CGFloat = 10
    
    var newItems: [Item] = []
    
    private var filters: [Filter] = []

    private var items: [Item] = []
    private var Items: [Item] = []
    private var selected: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAllPosts()

        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true;
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false;
        self.navigationController!.interactivePopGestureRecognizer!.isEnabled = false;
        
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
        
        addButton.setTitle("+", for: .normal)
        
        addButton.backgroundColor = UIColor(red: 134/255, green: 38/255, blue: 51/255, alpha: 1)
        addButton.setTitleColor(UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1), for: .normal)
        addButton.titleLabel?.font = UIFont(name: "Futura Bold", size: 40)
        addButton.layer.cornerRadius = 35
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(addButton)
        
        setupConstraints()
    }
    
    @objc func buttonTapped() {
        let vc = addProductViewController()
         navigationController?.pushViewController(vc, animated: true)
    }
    
    func getAllPosts() {
        NetworkManager.getAllItems() {items in
            self.Items = items
            self.items = items
            items.forEach({ (item: Item) -> Void in
                if (self.filters.filter { $0.filterName == item.category}.count == 0) {
                    self.filters.append(Filter(filterName: item.category))
                }
            })
            self.filterCollectionView.reloadData()
            self.itemCollectionView.reloadData()
        }
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
           NSLayoutConstraint.activate([
               addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
               addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
               addButton.heightAnchor.constraint(equalToConstant: 70),
               addButton.widthAnchor.constraint(equalToConstant: 70)
               
           ])
       }
}

extension itemCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
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
                filters[indexPath.item].isSelected.toggle()
                let filter = filters[indexPath.item].filterName
                selected.append(filter)
                newItems.append(contentsOf: Items.filter{$0.category.contains(filter)})
            }
            else{
                filters[indexPath.item].isSelected.toggle()
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
        else if collectionView == itemCollectionView{
                    let vc = specificViewController(image_url: Items[indexPath.item].image_url, price: String(Items[indexPath.item].price), post_title: Items[indexPath.item].post_title, category: Items[indexPath.item].category, descriptions: Items[indexPath.item].description, email: Items[indexPath.item].email, contact_info: Items[indexPath.item].contact_info)
                    navigationController?.pushViewController(vc, animated: true)
                }
    }
}
