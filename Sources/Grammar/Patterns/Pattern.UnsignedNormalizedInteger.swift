extension Pattern {
    public enum UnsignedNormalizedInteger<First, Next>: ParsingRule
        where First: ParsingRule, First.Construction: FixedWidthInteger,
        Next: DigitRule<First.Terminal, First.Construction>,
        Next.Location == First.Location {
        public typealias Location = First.Location
        public typealias Terminal = First.Terminal

        @inlinable public static func parse<Source>(
            _ input: inout ParsingInput<some ParsingDiagnostics<Source>>
        ) throws(PatternMatchingError) -> Next.Construction
            where Source: Collection<Terminal>, Source.Index == Location {
            var value: Next.Construction = try input.parse(as: First.self)
            while let remainder: Next.Construction = input.parse(as: Next?.self) {
                guard   case (let shifted, false) = value.multipliedReportingOverflow(
                    by: Next.radix
                ),
                case (let refined, false) = shifted.addingReportingOverflow(remainder) else {
                    throw .arbitrary(IntegerOverflowError<Next.Construction>.init())
                }
                value = refined
            }
            return value
        }
    }
}
