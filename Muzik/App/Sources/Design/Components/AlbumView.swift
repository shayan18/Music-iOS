//
//  AlbumCollectionView.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

import SwiftUI

struct AlbumView: View {
    var state: AlbumState
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
                ImageView(state: ImageViewState(url: state.url))
                VStack(alignment: .leading, spacing: 5) {
                    Text(state.name)
                        .font(.title3)
                        .bold()
                    Text(state.artistName)
                    Text(state.trackTitle)
                        .lineLimit(1)
                }
                Spacer()
            }
        }
    }
}

#if DEBUG
struct AlbumView_Previews: PreviewProvider {
    static let state = AlbumState(name: "Zero", artistName: "Billy", trackTitle: "Go goa gone", url: URL(string: "https://picsum.photos/200/300"))
    
    static var previews: some View {
        AlbumView(state: state)
    }
}
#endif




