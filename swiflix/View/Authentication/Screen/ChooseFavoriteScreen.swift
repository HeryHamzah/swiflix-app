import SwiftUI

struct ChooseFavoriteScreen: View {
    
    let movieReleases: [String] = ["Old Movies", "2000-2012", "2013-2022", "Latest Movies"]
    
    @Environment(RegisterViewModel.self) private var registerViewModel
    @Environment(NavigationManager.self) var navigationManager
    
    var body: some View {
        GeometryReader {
            geo in
            
            ScrollView() {
                Spacer().frame(height: 20)
                
                Text("choose_your_favorite_genre".tr()).font(.title2).frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 170), alignment: .leading)], spacing: 16) {
                    ForEach(GenreEnum.allCases, id: \.self) { genre in
                        ContainerChooseView(value: genre.rawValue.tr(), isSelected:  registerViewModel.selectedGenres.contains(genre)).onTapGesture {
                            registerViewModel.changeSelectedGenres(genre: genre)
                        }
                    }
                }
                
                Spacer().frame(height: 10)
                
                Text("choose_maximum_4").font(.footnote).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color(.primary))
                
                Spacer().frame(height: 30)
                Text("year_your_favorite_movie_release").font(.title2).frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 170), alignment: .leading)], spacing: 16) {
                    ForEach(movieReleases, id: \.self) { movieRelease in
                        ContainerChooseView(value: movieRelease, isSelected:  registerViewModel.selectedMovieRelease == movieRelease).onTapGesture {
                            registerViewModel.selectedMovieRelease = movieRelease
                        }
                    }
                }
                
                Spacer().frame(height: 90)
                
                NextButtonView {
                    navigationManager.navigateTo(to: .accountConfirmation)
                }
                
            }
            .padding(.horizontal, 20)
         
            
        }
    }
}


