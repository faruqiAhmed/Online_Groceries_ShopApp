//
//  OnlineGroceriesSwiftUIApp.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Md Omar Faruq on 5/9/24.
//

import SwiftUI

@main
struct OnlineGroceriesSwiftUIApp: App {
    
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                
                if mainVM.isUserLogin {
                    MainTabView()
                }else{
                    WelcomeView()
                }
            }
            
        }
    }
}
