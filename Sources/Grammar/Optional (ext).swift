// these extensions are mainly useful when defined as part of a tuple rule.
// otherwise, the overloads in the previous section of code should be preferred
extension Optional: ParsingRule where Wrapped: ParsingRule {
    public typealias Location  = Wrapped.Location
    public typealias Terminal  = Wrapped.Terminal

    @inlinable public static func parse<Source>(
        _ input: inout ParsingInput<some ParsingDiagnostics<Source>>
    ) -> Wrapped.Construction?
        where Source: Collection<Terminal>, Source.Index == Location {
        // will choose non-throwing overload, so no infinite recursion will occur
        input.parse(as: Wrapped?.self)
    }
}
