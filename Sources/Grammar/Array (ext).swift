extension Array: ParsingRule where Element: ParsingRule {
    public typealias Location = Element.Location
    public typealias Terminal = Element.Terminal

    @inlinable public static func parse<Source>(
        _ input: inout ParsingInput<some ParsingDiagnostics<Source>>
    ) -> [Element.Construction]
        where Source: Collection<Terminal>, Source.Index == Location {
        input.parse(as: Element.self, in: [Element.Construction].self)
    }
}
