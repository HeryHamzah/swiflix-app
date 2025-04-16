//
//  MovieScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/01/24.
//

import SwiftUI
import Shimmer

struct MovieScreen: View {
    @Environment(MovieViewModel.self) var movieViewModel
    @Environment(NavigationManager.self) var navigationManager
    @State private var hasLoaded = false
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                Text("for_you")
                    .font(.title2)
                
                ZStack {
                    if movieViewModel.isLoadingGetForYouList {
                        ForYouShimmerLoadingView()
                            .scrollDisabled(true)
                    } else {
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(movieViewModel.forYouList) { movie in
                                    
                                    ForYouCard(movie: movie, width: 300, height: 400)
                                        .onTapGesture {
                                            navigationManager.navigateTo(to: .movieDetail(movieId: movie.id))
                                        }
                                    
                                }
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view
                                        .scaleEffect(phase.isIdentity ? 1 : 0.95)
                                }
                            }
                            .padding(15)
                            .scrollTargetLayout()
                            
                            
                        }
                    }
                }
                .padding(.horizontal, -15)
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
                
                Text("favorite_category")
                    .font(.title2)
                
                ZStack {
                    if(movieViewModel.isLoadingGetFavoriteCategories) {
                        FavoriteCategoryShimmerLoadingView()
                    } else {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 170), alignment: .leading)], spacing: 16) {
                            ForEach(movieViewModel.favoriteCategories, id: \.self) { genre in
                                CategoryView(value: genre)
                            }
                        }
                    }
                }
                
                
                Spacer()
                    .frame(height: 15)
                
                Text("now_in_cinemas")
                    .font(.title2)
                
                ZStack {
                    if(movieViewModel.isLoadingGetNowInCinemasList) {
                        NowInCinemasShimmerLoadingView()
                    } else {
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(movieViewModel.nowInCinemasList) { movie in
                                    
                                    NowInCinemasCard(movie: movie, width: 250, height: 150)
                                        .onTapGesture {
                                            navigationManager.navigateTo(to: .movieDetail(movieId: movie.id))
                                        }
                                    
                                }
                            }
                            .padding(.horizontal, 15)
                        }
                        
                    }
                }
                .padding(.horizontal, -15)
                .scrollIndicators(.hidden)
                
                
                
                Spacer()
                    .frame(height: 15)
                
                Text("coming_soon")
                    .font(.title2)
                
                
                ZStack {
                    if(movieViewModel.isLoadingGetComingSoonList) {
                        ComingSoonShimmerLoadingView()
                    } else{
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(movieViewModel.comingSoonList) { movie in
                                    
                                    SwiflixRemoteImage(urlString: movie.posterPath ?? movie.backdropPath ?? "") { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        Color(.gray)
                                    }
                                    .frame(width: 150, height: 200)
                                    .clipShape(.rect(cornerRadius: 8))
                                    
                                }
                            }
                            .padding(.horizontal, 15)
                        }
                        
                    }
                }
                .padding(.horizontal, -15)
                .scrollIndicators(.hidden)
                
            }
            .padding(15)
            
        }
        .scrollIndicators(.hidden)
        .task {
            if !hasLoaded {
                hasLoaded = true
                
                await withTaskGroup(of: Void.self) { group in
                    group.addTask { await movieViewModel.getForYouList() }
                    group.addTask { await movieViewModel.getFavoriteCategories() }
                    group.addTask { await movieViewModel.getNowInCinemasList() }
                    group.addTask { await movieViewModel.getComingSoonList() }
                }
            }
        }
        .refreshable {
            await withTaskGroup(of: Void.self) { group in
                group.addTask { await movieViewModel.getForYouList() }
                group.addTask { await movieViewModel.getFavoriteCategories() }
                group.addTask { await movieViewModel.getNowInCinemasList() }
                group.addTask { await movieViewModel.getComingSoonList() }
            }
        }
    }
}

#Preview {
    MovieScreen()
    
}


