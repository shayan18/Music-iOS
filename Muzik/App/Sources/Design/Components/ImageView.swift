//
//  AlbumImageView.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

import SwiftUI

struct ImageView: View {
    var state: ImageViewState
    
    var body: some View {
        AsyncImage(url: state.url) { result in
            switch result {
            case let .success(image):
                image
                    .resizable()
                    .cornerRadius(Constants.roundedImageCornerRadius)
                
            case .failure(_):
                Image(systemName: Constants.imagePlaceHolder)
                    .resizable()
                    .cornerRadius(Constants.roundedImageCornerRadius)
                
            case .empty:
                Color.green.opacity(0.1)
                    .cornerRadius(Constants.roundedImageCornerRadius)

            @unknown default:
                Image(systemName: Constants.imagePlaceHolder)
                    .resizable()
                    .cornerRadius(Constants.roundedImageCornerRadius)
            }
        }
        .frame(width: 75, height: 75)
        .padding()
    }
}

#if DEBUG
struct AlbumImageView_Previews: PreviewProvider {
    static let state = ImageViewState(url: URL(string: ""))
    
    static var previews: some View {
        ImageView(state: state)
    }
}
#endif
