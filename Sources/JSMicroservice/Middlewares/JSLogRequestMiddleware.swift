import Vapor

public struct JSLogRequestMiddleware: AsyncMiddleware {
    // MARK: Init
    public init() { }
    
    // MARK: Methods
    // Respond to request
    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        // Get timestamp
        let duration: Date = .now
        // Handle request
        let response = try await next.respond(to: request)
        // Log response metrics
        log(duration, from: request, to: response)
        // Return response
        return response
    }
}

// MARK: - EXT. Helper Methods
private extension JSLogRequestMiddleware {
    // Log
    func log(_ duration: Date, from req: Request, to res: Response) {
        // Req, Res info
        let reqInfo = "\(req.method.string) \(req.url.path)"
        let resInfo = "\(res.status.code) \(res.status.reasonPhrase)"
        // Get request duration
        let time = Date().timeIntervalSince(duration)
        // Log metrics
        req.logger.info("\(reqInfo) -> \(resInfo) [\(time.readableMilliseconds)]")
    }
}
