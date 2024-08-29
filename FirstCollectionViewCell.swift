//
//  FirstCollectionViewCell.swift
//  Black
//
//  Created by 박수연 on 7/15/24.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {

    
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var colLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius  = 15
        // Initialization code
    }

}
