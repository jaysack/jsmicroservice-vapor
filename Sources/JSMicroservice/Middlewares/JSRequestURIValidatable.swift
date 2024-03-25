import Vapor

public protocol JSRequestURIValidatable: AsyncMiddleware {
    associatedtype T: Validatable
    func validate(_ request: Request) throws
}

public extension JSRequestURIValidatable {
    func validate(_ request: Request) throws {
        do {
            try T.validate(query: request)
            request.logger.info("✅ Request URI of type \(T.self) passed validation")
        } catch {
            request.logger.info("❌ Request URI of type \(T.self) failed validation")
            throw error
        }
    }
}

public struct JSValidateRequestURIMiddleware<T: Validatable>: JSRequestURIValidatable {
    // MARK: Init
    public init() { }
    
    // MARK: Methods
    // Respond to request
    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        try validate(request)
        return try await next.respond(to: request)
    }
}
