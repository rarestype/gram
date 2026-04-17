extension Pattern {
    /// A rule that unconditionally ignores all remaining input.
    ///
    /// This rule never throws an error.
    public enum Discard<Rule>: ParsingRule
        where Rule: ParsingRule, Rule.Construction == () {
        public typealias Location = Rule.Location
        public typealias Terminal = Rule.Terminal
        @inlinable public static func parse<Source>(
            _ input: inout ParsingInput<some ParsingDiagnostics<Source>>
        ) where Source: Collection<Terminal>, Source.Index == Location {
            input.parse(as: Rule.self, in: Void.self)
        }
    }
}
