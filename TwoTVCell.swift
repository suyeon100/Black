//
//  TwoTVCell.swift
//  Black
//
//  Created by 박수연 on 7/31/24.
//

import UIKit

class TwoTVCell: UITableViewCell {
    
    

    @IBOutlet weak var twoCollectionViewCell: UICollectionView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        twoCollectionViewCell.register(UINib(nibName: "TwoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier : "TwoColl")
        twoCollectionViewCell.delegate = self
        twoCollectionViewCell.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension TwoTVCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwoColl", for: indexPath) as! TwoCollectionViewCell
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 150)
    }
}
