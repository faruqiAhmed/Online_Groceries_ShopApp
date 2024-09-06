//
//  ImagePickerView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Md Omar Faruq on 6/9/24.
//


import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    var sourceType: UIImagePickerController.SourceType

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerView

        init(parent: ImagePickerView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

import SwiftUI

struct ImgPickerView: View {
    @StateObject var viewModel = ImagePickerViewModel()

    var body: some View {
        VStack {
            if let selectedImage = viewModel.selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
            } else {
                Text("No image selected")
                    .padding()
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

                Button(action: {
                    viewModel.selectSource(.savedPhotosAlbum)
                }) {
                    Text("Saved Photos")
                }
                .padding()
            }
        }
        .sheet(isPresented: $viewModel.isPickerPresented) {
            ImagePickerView(selectedImage: $viewModel.selectedImage, sourceType: viewModel.pickerSourceType)
        }
    }
}
