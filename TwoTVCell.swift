//
//  TwoTVCell.swift
//  Black
//
//  Created by 박수연 on 7/31/24.
//

import UIKit

class TwoTVCell: UITableViewCell {
    
    

    @IBOutlet weak var twoCollectionViewCell: UICollectionView!
    
    var arrProductPhotos:[String] = ["(1)","()","(3)","(2)","(1)","(2)","(3)","()"]
    var label: [String] = ["나의 피부를 보호하는 스킨케어","나도 몰랐던 \n새로운 아이템","Before/After가 확실한 뷰티의 세계",""]

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
        return 4
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwoColl", for: indexPath) as! TwoCollectionViewCell
        cell.image.image = UIImage(named: arrProductPhotos[indexPath.row]) ?? UIImage()
        cell.colLabel.text = label[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let margin: CGFloat = 20
        let width: CGFloat = (collectionView.bounds.width - margin)/2
        let height: CGFloat = width * 2

        return CGSize(width: width, height: height )
      //  return CGSize(width: 200, height: 350)
        
    }
    
    
  
}
