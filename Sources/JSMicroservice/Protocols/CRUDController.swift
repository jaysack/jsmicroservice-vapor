import Vapor
import Fluent

public protocol CRUDController: RouteCollection {
    associatedtype Resource: Model, CRUDModel
    associatedtype Output: Content
    func read(req: Request) async throws -> Output
    func create(req: Request) async throws -> HTTPStatus
    func update(req: Request) async throws -> HTTPStatus
    func delete(req: Request) async throws -> HTTPStatus
}

public extension CRUDController {
    
    // Create
    func create(req: Request) async throws -> HTTPStatus {
        // Create model on DB
        try await Resource.create(from: req)
        // Return 'Created' HTTP status
        return .created
    }

    // Update
    func update(req: Request) async throws -> HTTPStatus {
        // Update model on DB
        let _ = try await Resource.update(from: req)
        // Return 'No content' HTTP status
        return .noContent
    }
    
    // Delete
    func delete(req: Request) async throws -> HTTPStatus {
        fatalError("\(#function) has not been implemented yet ❌")
    }
}
