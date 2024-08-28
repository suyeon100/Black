//
//  CategoryViewController.swift
//  Black
//
//  Created by 박수연 on 8/28/24.
//

import UIKit
import PagingKit


class CategoryViewController: UIViewController {

    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    
    
    static var viewController: (UIColor) -> UIViewController = { (color) in
       let vc = UIViewController()
        vc.view.backgroundColor = color
        return vc
    }
//
//    var dataSource = [(menuTitle: "홈", vc: viewController(.red)), (menuTitle: "오특", vc: viewController(.blue)), (menuTitle: "랭킹", vc: viewController(.yellow)), (menuTitle: "매거진", vc: viewController(.systemPink)),(menuTitle: "기획전", vc: viewController(.red))]
    var dataSource = [(menu: String, content: UIViewController)]() {
        didSet{
            menuViewController.reloadData()
            contentViewController.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        menuViewController.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        menuViewController.reloadData()
        contentViewController.reloadData()
        dataSource = makeDataSource()
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let vc = segue.destination as? PagingMenuViewController {
               menuViewController = vc
               menuViewController.dataSource = self // <- set menu data source
               menuViewController.delegate = self
           } else if let vc = segue.destination as? PagingContentViewController {
               contentViewController = vc
               contentViewController.dataSource = self // <- set content data source
               contentViewController.dataSource = self
           }
       }
    fileprivate func makeDataSource() -> [(menu: String, content: UIViewController)] {
        
        let myMenuArray = ["스킨케어", "미용소품", "맨즈케어","헤어케어", "바디케어"]
        return myMenuArray.map {
            
            let title = $0
            
            switch title {
            case "스킨케어":
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                
                return (menu: title, content: vc)
          
            case "미용소품":
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                return (menu: title, content: vc)
      
            case "맨즈케어":
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                return (menu: title, content: vc)
           
    
            case "헤어케어":
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                return (menu: title, content: vc)
            case "바디케어":
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                return (menu: title, content: vc)
            default:
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                return (menu: title, content: vc)
            }
            
        }
        
    }
}
extension CategoryViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
    }
}

extension CategoryViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return 80
        
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        cell.titleLabel.text = dataSource[index].menu
        return cell
    }
}
extension CategoryViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)
    }
}

extension CategoryViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].content
    }
}

