extension UnicodeDigit where Terminal == Unicode.Scalar {
    /// Matches a decimal digit, `"0" ... "9"`, and returns its numeric value.
    public enum DecimalScalar: DigitRule {
        public typealias Terminal = Unicode.Scalar

        @inlinable public static var radix: Construction { 10 }
        @inlinable public static func parse(terminal: Unicode.Scalar) -> Construction? {
            "0" ... "9" ~= terminal
                ? Construction.init(terminal.value - ("0" as Unicode.Scalar).value)
                : nil
        }
    }
}
