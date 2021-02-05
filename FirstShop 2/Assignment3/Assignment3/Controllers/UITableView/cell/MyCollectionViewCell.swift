//
//  MyCollectionViewCell.swift
//  Assignment3
//
//  Created by admin on 05.02.2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    static let identifider = String(describing: MyCollectionViewCell.self)
    static let nib = UINib(nibName: identifider, bundle: nil)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
