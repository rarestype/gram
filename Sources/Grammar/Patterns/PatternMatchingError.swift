@frozen public enum PatternMatchingError: Error {
    case unexpectedEndOfInput
    case unexpectedValue
    case user(any Error)
}
