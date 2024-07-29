//
//  ViewController.swift
//  Black
//
//  Created by 박수연 on 7/9/24.
//

import UIKit

class BlackMainViewController: UIViewController {
    
    
    
    @IBOutlet weak var blackTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       blackTableView.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstTable" )
       blackTableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondTable" )
        blackTableView.dataSource = self
        blackTableView.delegate = self
        
    }

    
}


extension BlackMainViewController: UITableViewDataSource, UITableViewDelegate
{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTable", for: indexPath) as! FirstTableViewCell
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTable", for: indexPath) as! SecondTableViewCell
            
            cell.addMoreClickedHandler = {
                guard let nextVC = self.storyboard?.instantiateViewController(identifier: "webView") else {return}
              
                self.present(nextVC, animated: true, completion: nil)
            }
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTable", for: indexPath) as! FirstTableViewCell
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 200
        case 1:
            return 50
        case 2:
            return 200
        default:
            return 0
        }
    }
    
}
