import Vapor

public protocol JSRequestContentValidatable: AsyncMiddleware {
    associatedtype T: Validatable
    func validate(_ request: Request) throws
}

public extension JSRequestContentValidatable {
    func validate(_ request: Request) throws {
        do {
            try T.validate(content: request)
            request.logger.info("✅ Request content of type \(T.self) passed validation")
        } catch {
            request.logger.info("❌ Request content of type \(T.self) failed validation")
            throw error
        }
    }
}

public struct JSValidateRequestContentMiddleware<T: Validatable>: JSRequestContentValidatable {
    // MARK: Init
    public init() { }
    
    // MARK: Methods
    // Respond to request
    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        try validate(request)
        return try await next.respond(to: request)
    }
}
