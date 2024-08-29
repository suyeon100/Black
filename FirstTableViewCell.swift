//
//  FirstTableViewCell.swift
//  Black
//
//  Created by 박수연 on 7/13/24.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrProductPhotos:[String] = ["(1)","()","(3)","(2)","(1)","()","(3)","(2)"]
    var label: [String] = ["Skin Care","NEW ITEN","Before/after","채우는","Skin Care","NEW ITEN","Before/after","NEW ITEN"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(UINib(nibName: "FirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier : "First")
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension FirstTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProductPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "First", for: indexPath) as! FirstCollectionViewCell
        cell.img.image = UIImage(named: arrProductPhotos[indexPath.row]) ?? UIImage()
        cell.colLabel.text = label[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
}
