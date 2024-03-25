import Vapor

public extension TimeInterval {
    /// Converts the time internal to readable milliseconds format, i.e., "3.4ms"
    var readableMilliseconds: String {
        let string = (self * 1000).description
        // include one decimal point after the zero
        let endIndex = string.index(string.firstIndex(of: ".")!, offsetBy: 2)
        let trimmed = string[string.startIndex..<endIndex]
        return .init(trimmed) + "ms"
    }
}
