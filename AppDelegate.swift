//
//  AppDelegate.swift
//  Black
//
//  Created by 박수연 on 7/9/24.
//

import UIKit
import NaverThirdPartyLogin
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        sleep(2) 
        let instance = NaverThirdPartyLoginConnection.getSharedInstance()
            // 네이버 앱으로 인증하는 방식 활성화
            //instance?.isNaverAppOauthEnable = true
            // Safari에서 인증하는 방식 활성화
            instance?.isInAppOauthEnable = true
            // 인증 화면을 iPhone의 세로 모드에서만 사용하기
            instance?.isOnlyPortraitSupportedInIphone()

            // 네이버 아이디로 로그인하기 설정
            // 앱 등록시 입력한 URL Scheme
            instance?.serviceUrlScheme = "com.sudang.Black"
            // 앱 등록후 발급받은 클라이언트 아이디
            instance?.consumerKey = "3hgnBxycBhUrJ3gGpQfT"
            // 앱 등록 후 발급받은 클라이언트 시크릿
            instance?.consumerSecret = "9exy6VvGRC"
            // 앱 이름
            instance?.appName = "Black"
      
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

