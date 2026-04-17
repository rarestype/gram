/// A parsing rule that matches terminals against a constant value.
public protocol AtomicRule<Terminal>: TerminalRule
    where Terminal: Equatable, Construction == () {
    static var terminal: Terminal { get }
}

extension AtomicRule {
    @inlinable public static func parse(terminal: Terminal) -> ()? {
        Self.terminal == terminal ? () : nil
    }
}
extension AtomicRule {
    @inlinable public static func parse<Source>(
        _ input: inout ParsingInput<some ParsingDiagnostics<Source>>
    ) throws(PatternMatchingError)
        where Source: Collection<Terminal>, Source.Index == Location {
        switch input.next() {
        case Self.terminal?: break
        case _?: throw .unexpectedValue
        case nil: throw .unexpectedEndOfInput
        }
    }
}
