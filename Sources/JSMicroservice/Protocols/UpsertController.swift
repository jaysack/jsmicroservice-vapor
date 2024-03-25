import Vapor
import Fluent

public protocol UpsertController: RouteCollection {
    associatedtype UpsertModel: Upsertable
    associatedtype Result: Content
    func transform(_ model: UpsertModel) -> Result
    func upsert(req: Request) async throws -> Result
}

public extension UpsertController {
    // Upsert
    func upsert(req: Request) async throws -> Result {
        // Upsert model
        let resource = try await UpsertModel.upsert(from: req)
        // Transform and return output
        return transform(resource)
    }
}
