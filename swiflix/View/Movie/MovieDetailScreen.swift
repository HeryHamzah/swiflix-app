//
//  MovieDetailScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 11/09/24.
//

import SwiftUI

struct MovieDetailScreen: View {
    @State var movieDetailViewModel = DI.shared.makeMovieDetailViewModel()
    @Environment(NavigationManager.self) var navigationManager
        
    let movieId: Int
    
    var body: some View {
        
        ZStack {
            if(movieDetailViewModel.isLoadingGetDetail) {
                MovieDetailShimmerLoadingView()
            } else if let movieDetail = movieDetailViewModel.detail  {
                GeometryReader { geo in
                    let halfScreen = geo.size.height / 2
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            
                            //IMAGE
                            SwiflixRemoteImage(urlString: movieDetail.backdropPath ?? movieDetail.posterPath ?? "") { image in
                                ZStack {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: halfScreen)
                                    
                                    VStack {
                                        Spacer()
                                        LinearGradient(colors: [Color(.systemBackground), Color.clear], startPoint: .bottom, endPoint: .top)
                                    }
                                    
                                    VStack(alignment: .center) {
                                        Spacer()
                                        Text(movieDetail.title)
                                            .font(.title3)
                                            .bold()
                                            .foregroundStyle(.foreground)
                                            .lineLimit(1)
                                        Text("\(movieDetail.formattedDetails())")
                                            .multilineTextAlignment(.center)
                                        RatingStarWidget(rating: movieDetail.voteAverage)
                                        Spacer().frame(height: 20)
                                        
                                    }
                                    .frame(width: geo.size.width)
                                    .padding(.horizontal, 10)
                                }
                                .frame(height: halfScreen)
                                
                                
                            } placeholder: {
                                Color(.gray)
                            }
                            .frame(width: geo.size.width, height: halfScreen)
                            .clipped()
                            
                            //PLOT SUMMARY AND DESC
                            VStack(alignment: .leading) {
                                
                                Spacer().frame(height: 10)
                                
                                Text("plot_summary")
                                    .font(.title2)
                                
                                Spacer().frame(height: 20)
                                
                                Text(movieDetail.overview)
                                
                            }
                            .padding(.horizontal, 20)
                            
                            Spacer().frame(height: 20)
                            
                            Text("cast")
                                .font(.title2)
                                .padding(.horizontal, 20)
                            
                            Spacer().frame(height: 10)
                            
                            //CAST LIST
                            ScrollView(.horizontal) {
                                LazyHStack {
                                    ForEach(movieDetailViewModel.credits) { credit in
                                        VStack {
                                            SwiflixRemoteImage(urlString: credit.profilePath ?? "") { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                
                                            } placeholder: {
                                                Color(.gray)
                                            }
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                            
                                            Text(credit.name)
                                                .font(.body)
                                                .lineLimit(1)
                                                .multilineTextAlignment(.center)
                                            Text(credit.character)
                                                .font(.subheadline)
                                                .lineLimit(1)
                                                .fontWeight(.thin)
                                                .multilineTextAlignment(.center)
                                        }
                                        .frame(width: 120)
                                        .padding(.leading, credit == movieDetailViewModel.credits.first ? 20 : 0)
                                        .padding(.trailing, credit == movieDetailViewModel.credits.last ? 20 : 0)
                                    }
                                }
                            }
                            .scrollIndicators(.hidden)
                            
                            Spacer().frame(height: 40)
                            
                            ButtonView(action: {
                                navigationManager.navigateTo(to: .reservation(movieDetail: movieDetail))

                            }, text: "reservation".tr())
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .navigationTitle("detail")
            } else {
                VStack {
                    Image("no_data")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    
                    Spacer().frame(height: 20)
                    
                    Text("no_data")
                        .font(.title3)
                    
                    Spacer().frame(height: 20)
                    
                    ButtonView(action: {
                        Task {
                            await movieDetailViewModel.getMovieDetail(id: movieId)
                        }
                        Task {
                            await movieDetailViewModel.getCredits(id: movieId)
                            
                        }
                        
                    }, text: "refresh".tr())
                }
                .padding(20)
                
            }
        }
        .onAppear {
            UIScrollView.appearance().bounces = false
            
            if movieDetailViewModel.detail == nil {
                Task {
                    await movieDetailViewModel.getMovieDetail(id: movieId)
                }
            }
            
            if movieDetailViewModel.credits.isEmpty {
                Task {
                    await movieDetailViewModel.getCredits(id: movieId)
                }
            }
            
           
        }
        .onDisappear {
            UIScrollView.appearance().bounces = true
        }
    }
}

#Preview {
    MovieDetailScreen(movieId: mockMovieDetail.id)
        .environment(DI.shared.makeMovieDetailViewModel())
}
