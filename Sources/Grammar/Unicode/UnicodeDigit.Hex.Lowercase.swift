extension UnicodeDigit.Hex {
    /// Matches a lowercase hexadecimal digit, and returns its numeric value.
    public enum Lowercase: DigitRule {
        @inlinable public static var radix: Construction { 16 }
        @inlinable public static func parse(terminal: Terminal) -> Construction? {
            switch terminal {
            case 0x30 ... 0x39: Construction.init(terminal - 0x30)
            case 0x61 ... 0x66: Construction.init(terminal + 10 - 0x61)
            default: nil
            }
        }
    }
}
