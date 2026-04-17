extension Pattern {
    public enum Reduce<Rule, Construction>: ParsingRule
        where Rule: ParsingRule, Construction: RangeReplaceableCollection<Rule.Construction> {
        public typealias Location = Rule.Location
        public typealias Terminal = Rule.Terminal

        @inlinable public static func parse<Source>(
            _ input: inout ParsingInput<some ParsingDiagnostics<Source>>
        ) throws(PatternMatchingError) -> Construction
            where Source: Collection<Terminal>, Source.Index == Location {
            var vector: Construction = .init()
            vector.append(try input.parse(as: Rule.self))
            while let next: Rule.Construction = input.parse(as: Rule?.self) {
                vector.append(next)
            }
            return vector
        }
    }
}
