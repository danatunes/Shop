//
//  ViewController.swift
//  Assignment3
//
//  Created by Магжан Бекетов on 03.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewChangeBtn: UISegmentedControl!
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    var firstItem = Item(title: "Asus Rog", decription: "Asus discription", price: "$100", image: "asus")
    var secondItem = Item(title: "HP", decription: "HP discription", price: "$100", image: "hp")
    var thirdItem = Item(title: "Legion", decription: "Legion discription", price: "$100", image: "legion")
    var fourthItem = Item(title: "Mackbook", decription: "Mackbook discription", price: "$100", image: "mackbook")
    var items : [Item] = []
    
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.isHidden = false
        collectionView.isHidden = true
        
        items.append(firstItem)
        items.append(secondItem)
        items.append(thirdItem)
        items.append(fourthItem)
        configTable()
    }
    
    func configTable(){
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MyCollectionViewCell.nib, forCellWithReuseIdentifier: MyCollectionViewCell.identifider)
        tableView.register(ViewTableCell.nib, forCellReuseIdentifier: ViewTableCell.identifider)
        
        tableView.tableFooterView = UIView()
    }
    
}


extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewTableCell.identifider , for: indexPath) as! ViewTableCell
      
        cell.commonInit(items[indexPath.row])

        return cell
    }
}


extension ViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func changeView(_ sender: UISegmentedControl) {
        
        if !tableView.isHidden {
            tableView.isHidden = true
            collectionView.isHidden = false
        }else{
            tableView.isHidden = false
            collectionView.isHidden = true
        }
    
    }

}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifider, for: indexPath) as! MyCollectionViewCell
        if indexPath.item % 2 == 0{
            cell.backgroundColor = .green
        }else{
            cell.backgroundColor = .yellow
        }
        return cell
    }
    
    
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: 120)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
