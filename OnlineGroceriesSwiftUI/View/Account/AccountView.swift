//
//  AccountView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Md Omar Faruq on 5/9/24.
//

import SwiftUI

struct AccountView: View {
    static var user: MainViewModel = MainViewModel()
    @StateObject var viewModel = ImagePickerViewModel()
    @State var showingPopup = false
    var body: some View {
        ZStack{
            VStack{
                
                HStack(spacing: 15) {
        
                    VStack {
                        if let selectedImage = viewModel.selectedImage {
                            Image(uiImage: selectedImage )
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(50)
                        } else {
                            // Text("No image selected")
                            Image ("u1")
                                .padding()
                                .frame(width: 100, height: 100)
                                .cornerRadius(50)
                        }
                        
                        HStack {
                            Button(action: {
                                viewModel.selectSource(.camera)
                            }) {
                                Text("Open Camera")
                            }
                            .padding()
                            
                            Button(action: {
                                viewModel.selectSource(.photoLibrary)
                            }) {
                                Text("Photo Library")
                            }
                            .padding()
                        }
                        .sheet(isPresented: $viewModel.isPickerPresented) {
                            ImagePickerView(selectedImage: $viewModel.selectedImage, sourceType: viewModel.pickerSourceType)
                        }
                    }
                }
                Divider()
              
               VStack{
                    
                   Text ("User Info")
                        Text(AccountView.user.userObj.username)
                            .font(.customfont(.bold, fontSize: 20))
                            .foregroundColor(.primaryText)
                    
                    
                    Text(AccountView.user.userObj.email)
                        .font(.customfont(.regular, fontSize: 16))
//                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading )
                        .accentColor(.secondaryText)
            }
               .padding()
           
                
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
