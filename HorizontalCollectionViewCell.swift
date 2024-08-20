//
//  HorizontalCollectionViewCell.swift
//  Black
//
//  Created by 박수연 on 8/6/24.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var positionView: UIView!
    @IBOutlet weak var positionNowLabel: UILabel!
    @IBOutlet weak var positionTotalLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

}
