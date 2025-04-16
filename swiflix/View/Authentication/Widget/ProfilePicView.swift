//
//  ProfilePicView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 16/07/23.
//

import SwiftUI
import PhotosUI

struct ProfilePicView: View {
    @State var imageLoader = ImageLoader()
    
    @State var selectedPhoto: PhotosPickerItem?
    @State var imageData: Data?
    
    var apiImagePath: String?
    
    var onSelect: (Data?) -> Void
    
    var body: some View {
        ZStack(alignment: .bottom){
            if imageLoader.isLoading {
                Color.gray
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shimmeringGray()
                //                    .shimmer(.init(tint: .gray.opacity(0.5), highlight: .white, blur: 10.0, highlightOpacity: 0.5))
            }
            else if let imageData, let data = UIImage(data: imageData)
            {
                Image(uiImage: data).resizable().frame(width: 100, height: 100).clipShape(Circle())
                    .overlay(Circle().stroke(Color(.primary), lineWidth: 4))
            } else if let image = imageLoader.image {
                image.resizable().frame(width: 100, height: 100).clipShape(Circle())
                    .overlay(Circle().stroke(Color(.primary), lineWidth: 4))
            }
            else {
                Image("profile_icon").resizable().frame(width: 100, height: 100).clipShape(Circle())
                    .overlay(Circle().stroke(Color(.primary), lineWidth: 4))
            }
            
            if(!imageLoader.isLoading) {
                Circle()
                    .fill(Color(.primary))
                    .frame(width: 30, height: 30)
                    .overlay(
                        PhotosPicker(selection: $selectedPhoto, matching: .images) {
                            Image(systemName: "camera.fill")
                                .resizable()
                                .padding(5)
                                .scaledToFit()
                                .foregroundColor(Color(.onPrimary))
                                .clipped()
                        }
                        
                    ).offset(y: 10)
            }
            
        }
        .onChange(of: selectedPhoto) { _,newValue in
            
            guard let item = newValue else{
                return
            }
            
            item.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let data):
                    if let data {
                        imageData = data
                        onSelect(imageData)
                    }
                case .failure(let failure):
                    fatalError("\(failure)")
                }
            }
            
            
        }
        .onAppear {
            if let apiImagePath {
                imageLoader.load(fromURLString: apiImagePath)
                
            }
        }
    }
}


