/// The five available cat color variants.
enum CatVariant: String, CaseIterable {
    case brown  = "01"
    case tuxedo = "02"
    case orange = "03"
    case grey   = "04"
    case black  = "05"

    var displayName: String {
        switch self {
        case .brown:  "Brown"
        case .tuxedo: "Tuxedo"
        case .orange: "Orange"
        case .grey:   "Grey"
        case .black:  "Black"
        }
    }
}
