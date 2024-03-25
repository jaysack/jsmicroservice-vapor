import Vapor

// MARK: - Patch
public protocol Patchable {
    static func patch(from req: Request) async throws
}

public extension Patchable {
    static func patch(from req: Request) async throws {
        fatalError("\(#function) has not been implemented yet ❌")
    }
}
