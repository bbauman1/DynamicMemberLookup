import Foundation
import UIKit

protocol Movie {
    var title: String { get }
    var rating: Double { get }
}

@dynamicMemberLookup enum Genre {
    case action(Action)
    case comedy(Comedy)
    
    subscript<Value>(dynamicMember keyPath: KeyPath<Movie, Value>) -> Value {
        switch self {
            case .action(let action):
            return action[keyPath: keyPath]
            case .comedy(let comedy):
            return comedy[keyPath: keyPath]
        }
    }
}

extension Genre {
    enum Action: Movie {
        case batmanBegins
        case theDarkKnight
        case theDarkKnightRises
        
        var title: String {
            switch self {
            case .batmanBegins:
                return "Batman Begins"
            case .theDarkKnight:
                return "The Dark Knight"
            case .theDarkKnightRises:
                return "The Dark Knight Rises"
            }
        }
        
        var rating: Double {
            switch self {
            case .batmanBegins:
                return 8.2
            case .theDarkKnight:
                return 9.0
            case .theDarkKnightRises:
                return 8.4
            }
        }
    }
}

extension Genre {
    enum Comedy: Movie {
        case superbad
        case pineappleExpress
        
        var title: String {
            switch self {
            case .superbad:
                return "Superbad"
            case .pineappleExpress:
                return "Pineapple Express"
            }
        }
        
        var rating: Double {
            switch self {
            case .superbad:
                return 7.6
            case .pineappleExpress:
                return 6.9
            }
        }
    }
}

func someGenre() -> Genre {
    let genres: [Genre] = [
        .action(.theDarkKnight),
        .action(.theDarkKnightRises),
        .comedy(.superbad)
    ]
    
    return genres.randomElement()!
}

let genre = someGenre()
print(genre.title, genre.rating)

// The Dark Knight Rises 8.4
