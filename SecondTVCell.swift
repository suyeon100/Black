//
//  SecondTVCell.swift
//  Black
//
//  Created by 박수연 on 8/20/24.
//

import UIKit

class SecondTVCell: UITableViewCell {
    
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    var arrProductPhotos:[String] = ["I","M","G","IMG"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionview.register(UINib(nibName: "SecondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier : "Second")
        collectionview.delegate = self
        collectionview.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension SecondTVCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Second", for: indexPath) as! SecondCollectionViewCell
        cell.image.image = UIImage(named: arrProductPhotos[indexPath.row]) ?? UIImage()
        cell.layer.cornerRadius = 15
            return cell
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 250)
    }

    
    
}
