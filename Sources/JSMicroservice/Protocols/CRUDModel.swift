import Vapor
import Fluent

// MARK: CRUD
public protocol CRUDModel: Creatable & Readable & Updatable & Deletable { }

// MARK: - Create
public protocol Creatable {
    static func create(from req: Request) async throws
}
public extension Creatable {
    static func create(from req: Request) async throws {
        fatalError("\(#function) has not been implemented yet ❌")
    }
}

// MARK: Read
public protocol Readable {
    static func read(from req: Request) async throws -> Page<Self>
}
public extension Readable {
    static func read(from req: Request) async throws -> Page<Self> {
        fatalError("\(#function) has not been implemented yet ❌")
    }
}

// MARK: Update
public protocol Updatable {
    static func update(from req: Request) async throws
}
public extension Updatable {
    static func update(from req: Request) async throws {
        fatalError("\(#function) has not been implemented yet ❌")
    }
}

// MARK: Delete
public protocol Deletable {
    static func delete(from req: Request) async throws
}
public extension Deletable {
    static func delete(from req: Request) async throws {
        fatalError("\(#function) has not been implemented yet ❌")
    }
}
