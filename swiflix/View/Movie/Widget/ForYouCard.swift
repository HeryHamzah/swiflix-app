//
//  ForYouCard.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 30/11/24.
//

import SwiftUI

struct ForYouCard: View {
    let movie: MovieEntity
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    
    
    init(movie: MovieEntity, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.movie = movie
        self.width = width
        self.height = height
    }
    
    var body: some View {
        VStack {
            SwiflixRemoteImage(urlString: movie.posterPath ?? movie.backdropPath ?? "") { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .shadow(color: .black.opacity(0.25), radius: 8, x: 5, y: 10)
            } placeholder: {
                Color(.gray)
            }
            .frame(width: width, height: height)
            .clipShape(.rect(cornerRadius: 16))
            
            Spacer().frame(height: 8)
            
            HStack {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color(.primary))
                    Text("\(String(format: "%.2f", movie.voteAverage)) (\(movie.voteCount))")
                        .font(.subheadline)
                    
                }
                .padding(.all, 8)
                .background(Color(.systemGray4))
                .clipShape(RoundedRectangle(cornerRadius: 4))
                
                HStack {
                    Image(systemName: "flame.fill")
                        .foregroundStyle(Color(.primary))
                    Text("\(String(format: "%.2f", movie.popularity))")
                        .font(.subheadline)
                    
                }
                .padding(.all, 8)
                .background(Color(.systemGray4))
                .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            
            
        }
    }
}

#Preview {
    ForYouCard(movie: mockMovies[2], width: 300, height: 400)
}
