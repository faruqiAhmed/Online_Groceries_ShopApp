//
//  AccountView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Md Omar Faruq on 5/9/24.
//

import SwiftUI

struct AccountView: View {
    static var user: MainViewModel = MainViewModel()
    var body: some View {
        ZStack{
            VStack{
                
                HStack(spacing: 15) {
                    Image("u1")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(30)
                    
                    VStack{
                        
                        HStack{
                            Text(AccountView.user.userObj.username)
                                .font(.customfont(.bold, fontSize: 20))
                                .foregroundColor(.primaryText)
                            
                            Image(systemName: "pencil")
                                .foregroundColor(.primaryApp)
                            
                            Spacer()
                        }
                        
                        Text(AccountView.user.userObj.email)
                            .font(.customfont(.regular, fontSize: 16))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading )
                            .accentColor(.secondaryText)
                        
                        
                            
                    }
                }
                .onAppear{
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, .topInsets)
                
                Divider()
                
                        Button {
                            MainViewModel.shared.logout()
                        } label: {
                            ZStack {
                                Text("Log Out")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.primaryApp)
                                    .multilineTextAlignment(.center)
                                
                                HStack{
                                    Spacer()
                                    Image("logout")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .padding(.trailing, 20)
                                }
                            }
                           
                        }
                        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                        .background( Color(hex: "F2F3F2"))
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
    
            }
            .padding(.bottom, .bottomInsets + 60)
        }
        .ignoresSafeArea()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            AccountView()
        }
        
    }
}
