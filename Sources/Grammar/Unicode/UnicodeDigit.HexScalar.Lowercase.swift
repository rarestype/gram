extension UnicodeDigit.HexScalar where Terminal == Unicode.Scalar {
    /// Matches a lowercase hexdecimal digit and returns its numeric value.
    public enum Lowercase: DigitRule {
        public typealias Terminal = Unicode.Scalar

        @inlinable public static var radix: Construction { 16 }
        @inlinable public static func parse(terminal: Unicode.Scalar) -> Construction? {
            switch terminal {
            case "0" ... "9":
                Construction.init(terminal.value - ("0" as Unicode.Scalar).value)
            case "a" ... "f":
                Construction.init(terminal.value + 10 - ("a" as Unicode.Scalar).value)
            default:
                nil
            }
        }
    }
}
