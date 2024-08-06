//
//  BlackTwoViewController.swift
//  Black
//
//  Created by 박수연 on 8/1/24.
//

import UIKit

class BlackTwoViewController: UIViewController {
    
    //MARK:- 두번쨰 탭 / 추가기능 :  1. 양옆으로 스크롤 컬렉션뷰, 시간초로 넘어가는 기능 timer 추가 
    
    
    @IBOutlet weak var twotableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        twotableView.register(UINib(nibName: "HorizontalTVCell", bundle: nil), forCellReuseIdentifier: "Horizontal")
        twotableView.dataSource = self
        twotableView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension BlackTwoViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Horizontal", for: indexPath) as! HorizontalTVCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}
