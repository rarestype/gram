extension UnicodeDigit where Terminal: BinaryInteger {
    /// Matches a binary digit and returns its numeric value.
    public enum Binary: DigitRule {
        @inlinable public static var radix: Construction { 2 }
        @inlinable public static func parse(terminal: Terminal) -> Construction? {
            switch terminal {
            case 0x30: 0
            case 0x31: 1
            default: nil
            }
        }
    }
}
