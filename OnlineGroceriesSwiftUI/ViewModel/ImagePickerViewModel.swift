//
//  ImagePickerViewModel.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Md Omar Faruq on 6/9/24.
//

import Foundation
import SwiftUI

class ImagePickerViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var isPickerPresented: Bool = false
    @Published var pickerSourceType: UIImagePickerController.SourceType = .photoLibrary

    func selectSource(_ source: UIImagePickerController.SourceType) {
        pickerSourceType = source
        isPickerPresented = true
    }
}
