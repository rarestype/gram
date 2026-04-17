extension Pattern {
    public enum Join<Rule, Separator, Construction>: ParsingRule
        where Rule: ParsingRule,
        Separator: ParsingRule<Rule.Terminal>,
        Separator.Location == Rule.Location,
        Separator.Construction == Void,
        Construction: RangeReplaceableCollection<Rule.Construction> {
        public typealias Terminal = Rule.Terminal
        public typealias Location = Rule.Location

        @inlinable public static func parse<Source>(
            _ input: inout ParsingInput<some ParsingDiagnostics<Source>>
        ) throws(PatternMatchingError) -> Construction
            where Source: Collection<Terminal>, Source.Index == Location {
            var vector: Construction = .init()
            vector.append(try input.parse(as: Rule.self))
            while let (_, next): ((), Rule.Construction) = try? input.parse(
                    as: (Separator, Rule).self
                ) {
                vector.append(next)
            }
            return vector
        }
    }
}
