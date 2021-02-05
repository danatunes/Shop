//
//  CollectionViewCell.swift
//  Assignment3
//
//  Created by Магжан Бекетов on 04.02.2021.
//

import UIKit

class CollectionViewCell: UITableViewCell {

    static let identifider = String(describing: CollectionViewCell.self)
    static let nib = UINib(nibName: identifider, bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
