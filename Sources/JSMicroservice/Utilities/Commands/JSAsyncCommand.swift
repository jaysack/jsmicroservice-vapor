import Vapor

public protocol JSAsyncCommand: Command {
    func asyncRun(using context: CommandContext, signature: Signature) async throws
}

public extension JSAsyncCommand {

    func run(using context: CommandContext, signature: Signature) throws {
        let promise = context.application
            .eventLoopGroup
            .next()
            .makePromise(of: Void.self)

        promise.completeWithTask {
            try await asyncRun(using: context, signature: signature)
        }
        try promise.futureResult.wait()
    }
}
