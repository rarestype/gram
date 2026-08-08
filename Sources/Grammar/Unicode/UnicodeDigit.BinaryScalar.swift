extension UnicodeDigit where Terminal == Unicode.Scalar {
    /// Matches a binary digit, `"0" ... "1"`, and returns its numeric value.
    public enum BinaryScalar: DigitRule {
        public typealias Terminal = Unicode.Scalar

        @inlinable public static var radix: Construction { 2 }
        @inlinable public static func parse(terminal: Unicode.Scalar) -> Construction? {
            switch terminal {
            case "0": 0
            case "1": 1
            default: nil
            }
        }
    }
}
