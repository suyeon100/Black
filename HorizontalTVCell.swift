//
//  HorizontalTViCell.swift
//  Black
//
//  Created by 박수연 on 8/6/24.
//

import UIKit

class HorizontalTVCell: UITableViewCell {
    
    var timer: Timer?
    var currPage: Int = 0
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    var arrProductPhotos:[String] = ["p","h","o","t","oo"]
    var label: [String] = ["청량한 라일락 \n감성에 풍-덩","나도 몰랐던 \n내 입술의 볼륨감","개발만 2년 6개월 \n또렷함이 달라요","뷰티 필터 없이도 \n 화사하게","새로운 단발병 \n유발자의 등장"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(UINib(nibName: "HorizontalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier : "TwoHori")
        collectionView.delegate = self
        collectionView.dataSource = self
        bannerTimer()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    // 배너 움직이는 매서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        
        
        if currPage == arrProductPhotos.count-1 {
        // 맨 처음 페이지로 돌아감
            collectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            currPage = 0
            return
        }
        // 다음 페이지로 전환
        currPage += 1
        collectionView.scrollToItem(at: NSIndexPath(item: currPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    func arrayIndexForItem(_ item : Int)-> Int {
        if currPage == arrProductPhotos.count {
            return item % currPage
        }
        return 0
    }
    

}
extension HorizontalTVCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProductPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwoHori", for: indexPath) as! HorizontalCollectionViewCell
        cell.layer.cornerRadius = 15

       // cell.imageTwo?.image = UIImage(named: )
        cell.imageTwo.image = UIImage(named: arrProductPhotos[indexPath.row]) ?? UIImage()
        cell.label.text = label[indexPath.row]
        var intArray = arrProductPhotos.map{$0}.count
        cell.positionTotalLabel.text = "|" + "" + (String(describing: intArray))
        var a: [String] = ["1","2","3","4","5"]
        cell.positionNowLabel.text = a[indexPath.row]

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 450)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 15
    }
  
}
