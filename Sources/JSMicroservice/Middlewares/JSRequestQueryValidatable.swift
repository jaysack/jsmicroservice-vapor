import Vapor

public protocol JSRequestQueryValidatable: AsyncMiddleware {
    associatedtype T: Validatable
    func validate(_ request: Request) throws
}

public extension JSRequestQueryValidatable {
    func validate(_ request: Request) throws {
        do {
            try T.validate(query: request)
            request.logger.info("✅ Request query of type \(T.self) passed validation")
        } catch {
            request.logger.info("❌ Request query of type \(T.self) failed validation")
            throw error
        }
    }
}

public struct JSValidateRequestQueryMiddleware<T: Validatable>: JSRequestQueryValidatable {
    // MARK: Init
    public init() { }
    
    // MARK: Methods
    // Respond to request
    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        try validate(request)
        return try await next.respond(to: request)
    }
}
