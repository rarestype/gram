@frozen public enum PatternMatchingError: Error {
    case arbitrary(any Error)
    case unexpectedEndOfInput
    case unexpectedValue
}
