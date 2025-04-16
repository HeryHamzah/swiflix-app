//
//  NowInCinemasCard.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 21/10/24.
//

import SwiftUI

struct NowInCinemasCard: View {
    let movie: MovieEntity
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    
    
    init(movie: MovieEntity, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.movie = movie
        self.width = width
        self.height = height
    }
    
    var body: some View {
        SwiflixRemoteImage(urlString: movie.backdropPath ?? movie.posterPath ?? "") { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    ZStack {
                        LinearGradient(colors: [Color.black.opacity(0.9), Color.clear], startPoint: .bottom, endPoint: .top)
                        
                        VStack(alignment: .leading) {
                            Spacer()
                            
                            HStack {
                                Text(movie.title)
                                    .font(.subheadline)
                                    .foregroundStyle(.white)
                                    .lineLimit(1)
                                    .padding(.all, 10)
                                Spacer()
                            }
                      
                            
                        }
                    }
                }
        } placeholder: {
            Color(.gray)
        } 
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    NowInCinemasCard(movie: mockMovies[2], width: 250, height: 150)
}
