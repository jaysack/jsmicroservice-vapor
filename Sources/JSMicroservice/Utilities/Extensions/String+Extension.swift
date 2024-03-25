public extension String {
    func convertToSnakeCase() -> String {
        return self.replacingOccurrences(of: " ", with: "_").lowercased()
    }
}
