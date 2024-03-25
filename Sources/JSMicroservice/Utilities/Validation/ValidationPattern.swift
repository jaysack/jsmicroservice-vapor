public enum ValidationPattern: RawRepresentable {

    // MARK: Init
    public init?(rawValue: String) {
        fatalError("Not yet implemented ❌")
    }
    
    // MARK: Properties
    public var rawValue: String {
        switch self {
        case .uniqueLetters(let int):       return "^[A-Za-z]{\(int)}$"
        }
    }
    
    // MARK: Cases
    case uniqueLetters(Int)
}
