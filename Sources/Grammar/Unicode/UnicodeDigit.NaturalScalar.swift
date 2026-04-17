extension UnicodeDigit where Terminal == Unicode.Scalar {
    /// Matches a natural digit, `"1" ... "9"`, and returns its numeric value.
    public enum NaturalScalar: TerminalRule {
        public typealias Terminal = Unicode.Scalar

        @inlinable public static func parse(terminal: Unicode.Scalar) -> Construction? {
            "1" ... "9" ~= terminal
                ? Construction.init(terminal.value - ("0" as Unicode.Scalar).value)
                : nil
        }
    }
}
