//
//  MenuCell.swift
//  OLiveYoung_Clone
//
//  Created by 박수연 on 5/22/24.
//

import UIKit
import PagingKit


class MenuCell: PagingMenuViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.sizeToFit()
    }
    
}
