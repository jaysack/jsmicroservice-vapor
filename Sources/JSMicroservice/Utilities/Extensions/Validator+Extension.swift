import Vapor

extension Validator where T == String {
    /// Validates whether a `String` only has letters (case insensitive)
    public static func letters(_ count: Int) -> Validator<T> {
        return .pattern("^[A-Za-z]{\(count)}")
    }

    /// Validates whether a `String` only has digits
    public static func digits(_ count: Int) -> Validator<T> {
        return .pattern("^[0-9]{\(count)}$")
    }

    /// Validates whether a `String` has a RFC 3339 date format
    public static var rfc3339: Validator<T> {
        return .pattern("^\\d{4}-\\d{2}-\\d{2}T\\d{2}%3A\\d{2}%3A\\d{2}(?:%2E\\d+)?[A-Z]?(?:[+.-](?:08%3A\\d{2}|\\d{2}[A-Z]))?$")
    }

    /// Validates whether a `String` is in valid JWT format
    public static var jwt: Validator<T> {
        return .pattern("/^[w-]+.[w-]+.[w-]+$/")
    }

    /// Validates whether a `String` is in valid E.164 phone number format
    public static var e164: Validator<T> {
        return .pattern("^+?d{10,14}$")
    }
}
