extension UnicodeDigit where Terminal == Unicode.Scalar {
    /// Matches a hexdecimal digit, without case-sensitivity, and returns its numeric value.
    public enum HexScalar: DigitRule {
        public typealias Terminal = Unicode.Scalar

        @inlinable public static var radix: Construction { 16 }
        @inlinable public static func parse(terminal: Unicode.Scalar) -> Construction? {
            switch terminal {
            case "0" ... "9":
                return Construction.init(terminal.value      - ("0" as Unicode.Scalar).value)
            case "a" ... "f":
                return Construction.init(terminal.value + 10 - ("a" as Unicode.Scalar).value)
            case "A" ... "F":
                return Construction.init(terminal.value + 10 - ("A" as Unicode.Scalar).value)
            default:
                return nil
            }
        }
    }
}
