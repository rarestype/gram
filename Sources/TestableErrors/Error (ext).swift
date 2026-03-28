extension Error where Self: Equatable {
    private func equals(_ other: any Error) -> Bool {
        (other as? Self).map { self == $0 } ?? false
    }
}
extension Error {
    public static func ~= (self: Self, any: any Error) -> Bool {
        if case let self as any Error & Equatable = self {
            return self.equals(any)
        } else {
            return false
        }
    }
}
