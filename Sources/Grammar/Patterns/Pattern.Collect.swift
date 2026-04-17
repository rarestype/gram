extension Pattern {
    public enum Collect<Rule, Construction>: ParsingRule
        where Rule: ParsingRule, Construction: RangeReplaceableCollection<Rule.Construction> {
        public typealias Location = Rule.Location
        public typealias Terminal = Rule.Terminal

        @inlinable public static func parse<Source>(
            _ input: inout ParsingInput<some ParsingDiagnostics<Source>>
        ) -> Construction where Source: Collection<Terminal>, Source.Index == Location {
            input.parse(as: Rule.self, in: Construction.self)
        }
    }
}
