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
        blackTableView.dataSource = self
        blackTableView.delegate = self
    }

    
}


extension BlackMainViewController: UITableViewDataSource, UITableViewDelegate
{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTable", for: indexPath) as! FirstTableViewCell
        
        return cell
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 250
    }
    
}
