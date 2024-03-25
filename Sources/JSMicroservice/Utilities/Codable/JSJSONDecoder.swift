import Foundation

public final class JSJSONDecoder: JSONDecoder {

    // MARK: Init
    private override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
        dateDecodingStrategy = .iso8601
    }

    // MARK: Properties
    public static let shared = JSJSONDecoder()
}
