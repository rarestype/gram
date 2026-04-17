extension Pattern {
    /// A rule that expects the end of the input.
    ///
    /// >   Throws: ``UnexpectedValueError`` if there is any
    ///     input remaining.
    public enum End<Location, Terminal>: ParsingRule {
        @inlinable public static func parse<Source>(
            _ input: inout ParsingInput<some ParsingDiagnostics<Source>>
        ) throws(PatternMatchingError)
            where Source: Collection<Terminal>, Source.Index == Location {
            if  let _: Terminal = input.next() {
                throw .unexpectedValue
            }
        }
    }
}
