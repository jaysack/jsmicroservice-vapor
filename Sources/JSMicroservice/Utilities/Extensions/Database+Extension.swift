import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

public extension Databases {
    func usePostgres() {
        use(
            .postgres(
                configuration: .init(
                    hostname: Environment.get("DATABASE_HOST")!,
                    port: Int(Environment.get("DATABASE_PORT")!)!,
                    username: Environment.get("DATABASE_USERNAME")!,
                    password: Environment.get("DATABASE_PASSWORD")!,
                    database: Environment.get("DATABASE_NAME")!,
                    tls: .disable
                ),
                decodingContext: .default
            ),
            as: .psql
        )
    }
}
