//
//  SecondTableViewCell.swift
//  Black
//
//  Created by 박수연 on 7/13/24.
//

import UIKit


class SecondTableViewCell: UITableViewCell{ //더보기
    var addMoreClickedHandler: (()->())?
    @IBOutlet weak var moreBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

    
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
    
       
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func moreBtnn(_ sender: Any) {
      //  웹뷰 스토리보드로 이동 -> 웹뷰 띄우기
        if let _addMoreClickedHandler = addMoreClickedHandler {
            _addMoreClickedHandler()
        }
    }

    
}
