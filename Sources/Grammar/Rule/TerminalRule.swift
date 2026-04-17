
/// A parsing rule that is applied to a single terminal at a time.
public protocol TerminalRule<Terminal, Construction>: ParsingRule {
    static func parse(terminal: Terminal) -> Construction?
}

extension TerminalRule {
    @inlinable public static func parse<Source>(
        _ input: inout ParsingInput<some ParsingDiagnostics<Source>>
    ) throws(PatternMatchingError) -> Construction
        where Source: Collection<Terminal>, Source.Index == Location {
        guard let terminal: Terminal = input.next() else {
            throw .unexpectedEndOfInput
        }
        guard let value: Construction = Self.parse(terminal: terminal) else {
            throw .unexpectedValue
        }

        return value
    }
}
