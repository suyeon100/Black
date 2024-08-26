//
//  TwoCollectionViewCell.swift
//  Black
//
//  Created by 박수연 on 7/31/24.
//

import UIKit

class TwoCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var colLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        image.layer.cornerRadius = 15
      
    }

}
