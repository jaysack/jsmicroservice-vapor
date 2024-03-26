import Fluent
import FluentPostgresDriver

public extension Migration {
    
    // Serial
    var serial: DatabaseSchema.DataType {
        return .custom("SERIAL")
    }

    // Geography
    var geography: DatabaseSchema.DataType {
        return .custom("GEOGRAPHY(Point, 4326)")
    }

    // Set varchar type
    func varchar(_ length: Int) -> DatabaseSchema.DataType {
        return .custom("VARCHAR(\(length))")
    }

    // Set default value
    func `default`(_ type: DefaultDataTypeValue) -> DatabaseSchema.FieldConstraint {
        switch type {
        case .currentTimestamp:     return .sql(.default(SQLFunction("now")))
        }
    }
    func `default`(_ type: String) -> DatabaseSchema.FieldConstraint {
        return .custom("\(type)")
    }

    func array(of type: ColumnDataType) -> DatabaseSchema.DataType {
        switch type {
        case .varchar(let length):
            return .custom("VARCHAR(\(length))[]")
        case .enum(let `enum`):
            return .custom("\(`enum`)[]")
        }
    }
    
}

public enum ColumnDataType {
    case varchar(Int)
    case `enum`(String)
}

public enum DefaultDataTypeValue {
    case currentTimestamp
}
