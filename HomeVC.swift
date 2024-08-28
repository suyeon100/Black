//
//  HomeViewController.swift
//  OLiveYoung_Clone
//
//  Created by 박수연 on 5/24/24.
//

import Foundation
import UIKit

enum HomeType {
    case image
    case btn
}


class HomeVC: UIViewController{
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var homeTVCItemArray: [HomeType] = []
    
    var arrImageName: [String] = ["1","2","3"]
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return homeTVCItemArray.count
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nibName = UINib(nibName: "HomeTVCell", bundle: nil)
        homeTableView.register(nibName, forCellReuseIdentifier: "HomeTVCell")
    
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
       

    }
    
}


extension HomeVC: UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10

      
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "HomeTVCell", for: indexPath) as! HomeTVCell

       
        return cell
        

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
}
