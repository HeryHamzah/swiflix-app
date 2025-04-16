import SwiftUI

enum GenreEnum: String, CaseIterable {
    case action = "action",
         animation = "animation",
         crime = "crime",
         horror = "horror",
         romance = "romance",
         western = "western"
    
    
}

func getColor(genre: GenreEnum) -> Color {
    switch genre {
    case .action:
        return Color(.action)
    case .animation:
        return Color(.animation)
    case .crime:
        return Color(.crime)
    case .horror:
        return Color(.horror)
    case .romance:
        return Color(.romance)
    case .western:
        return Color(.western)
    }
    
    
}
