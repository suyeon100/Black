//
//  WebViewController.swift
//  Black
//
//  Created by 박수연 on 7/23/24.
//

import UIKit
import WebKit


class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    

    
    @IBOutlet weak var webView: WKWebView!
    override func loadView() {
             super.loadView()
             
             webView = WKWebView(frame: self.view.frame)
             webView.uiDelegate = self
             webView.navigationDelegate = self
             self.view = self.webView
         }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let url = URL(string: "https://www.oliveyoung.co.kr/store/main/main.do?oy=0&_CAD=nbsa00&utm_source=naver&utm_medium=brand_search&utm_campaign=onpro_emnet_main_0101_1231&utm_content=pc_home")
                let request = URLRequest(url: url!)
                webView.configuration.preferences.javaScriptEnabled = true  //자바스크립트 활성화
                webView.load(request)
        // Do any additional setup after loading the view.
    }
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void){
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in completionHandler() }))
        self.present(alertController, animated: true, completion: nil) }

    //confirm 처리
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "취소", style: .default, handler: { (action) in completionHandler(false) }))
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in completionHandler(true) }))
        self.present(alertController, animated: true, completion: nil) }
    
    // href="_blank" 처리
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil { webView.load(navigationAction.request) }
        return nil }
   
 

}
