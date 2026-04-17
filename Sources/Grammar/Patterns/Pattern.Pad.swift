extension Pattern {
    public enum Pad<Rule, Padding>: ParsingRule
        where Rule: ParsingRule,
        Padding: ParsingRule<Rule.Terminal>,
        Padding.Location == Rule.Location,
        Padding.Construction == Void {
        public typealias Terminal = Rule.Terminal
        public typealias Location = Rule.Location

        @inlinable public static func parse<Source>(
            _ input: inout ParsingInput<some ParsingDiagnostics<Source>>
        ) throws(PatternMatchingError) -> Rule.Construction
            where Source: Collection<Terminal>, Source.Index == Location {
            input.parse(as: Padding.self, in: Void.self)
            let construction: Rule.Construction = try input.parse(as: Rule.self)
            input.parse(as: Padding.self, in: Void.self)
            return construction
        }
    }
}
