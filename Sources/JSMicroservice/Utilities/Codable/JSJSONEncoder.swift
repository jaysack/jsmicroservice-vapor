import Foundation

public final class JSJSONEncoder: JSONEncoder {

    // MARK: Init
    private override init() {
        super.init()
        keyEncodingStrategy = .convertToSnakeCase
        dateEncodingStrategy = .iso8601
    }

    // MARK: Properties
    public static let shared = JSJSONEncoder()
}
