//
//  ViewController.swift
//  Black
//
//  Created by 박수연 on 8/26/24.
//

import UIKit
import NaverThirdPartyLogin
import Alamofire

class ViewController: UIViewController {

    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginInstance?.delegate = self
        
        // Do any additional setup after loading the view.
    }
    


}
extension ViewController : NaverThirdPartyLoginConnectionDelegate {
    
    
    // 로그인에 성공한 경우 호출
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("Success login")
        getInfo()
    }
    
    // referesh token
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        loginInstance?.accessToken
    }
    
    // 로그아웃
    func oauth20ConnectionDidFinishDeleteToken() {
        print("log out")
    }
    
    // 모든 error
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("error = \(error.localizedDescription)")
    }
    
    @IBAction func login(_ sender: Any) {
        
        loginInstance?.requestThirdPartyLogin()
    }
    
//    @IBAction func logout(_ sender: Any) {
//        loginInstance?.requestDeleteToken()
//    }
    
    // RESTful API, id가져오기
    func getInfo() {
      guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
      
      if !isValidAccessToken {
        return
      }
      
      guard let tokenType = loginInstance?.tokenType else { return }
      guard let accessToken = loginInstance?.accessToken else { return }
       
      let urlStr = "https://openapi.naver.com/v1/nid/me"
      let url = URL(string: urlStr)!
      
      let authorization = "\(tokenType) \(accessToken)"
      
      let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])

      req.responseJSON { response in
        guard let result = response.value as? [String: Any] else { return }
        guard let object = result["response"] as? [String: Any] else { return }
        guard let name = object["name"] as? String else { return }
        guard let email = object["email"] as? String else { return }
        guard let id = object["id"] as? String else {return}
        
        print(email)
        
      //  self.nameLabel.text = "\(name)"
       // self.emailLabel.text = "\(email)"
      //  self.id.text = "\(id)"
      }
    }
    
}

