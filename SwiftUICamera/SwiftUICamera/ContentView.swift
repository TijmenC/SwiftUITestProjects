//
//  ContentView.swift
//  SwiftUICamera
//
//  Created by Tijmen on 23/04/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage?
    
    
    var body: some View {
        NavigationView {
            VStack{
                Image("Placeholder")
                    .resizable()
                    .frame(width: 300, height: 300)
                Button("Choose Picture") {
                    self.showSheet = true
                }.padding()
                .actionSheet(isPresented: $showSheet)  {
                    ActionSheet(title:  Text("Select Photo"), message: Text("Choose"),
                                buttons: [.default(Text("Photo Library")) {
                                    self.showImagePicker = true
                                    self.sourceType = .photoLibrary
                                },
                                .default(Text("Camera")) {
                                    self.showImagePicker = true
                                    self.sourceType = .camera
                                },
                                .cancel()
                                ])
                }
            }
            .navigationTitle("Sup")
        }.sheet(isPresented: $showImagePicker, content: {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        })
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
