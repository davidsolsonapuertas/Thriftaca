//
//  HomeViewController.swift
//  Thriftaca
//
//  Created by JJ on 11/19/21.
//

//
//  ViewController.swift
//  Final_Project
//
//  Created by JJ on 11/19/21.
//


//*NOTE* change color theme, fonts, and picture later on
import UIKit
import SnapKit

class homeViewController: UIViewController {

    var heading = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        title = "Home!"
        
        heading.text = "Home"
        heading.font = UIFont(name:"TrebuchetMS-Bold", size: 30)
        heading .textColor = UIColor(red: 145/255, green: 32/255, blue: 32/255, alpha: 1.0)
        view.addSubview(heading)
        
        setupConstraints()
    }
    func setupConstraints(){
        heading.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(35)
            make.centerX.equalTo(self.view)
            make.height.equalTo(50)
            make.width.equalTo(175)
        }
    }
}

