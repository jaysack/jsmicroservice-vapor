import Vapor

// MARK: - Upsert
public protocol Upsertable {
    static func upsert(from req: Request) async throws -> Self
}
public extension Upsertable {
    static func upsert(from req: Request) async throws -> Self {
        fatalError("\(#function) has not been implemented yet ❌")
    }
}
