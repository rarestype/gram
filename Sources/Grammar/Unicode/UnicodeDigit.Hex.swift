extension UnicodeDigit where Terminal: BinaryInteger {
    /// Matches a hexadecimal digit, without case-sensitivity,
    /// and returns its numeric value.
    public enum Hex: DigitRule where Construction: BinaryInteger {
        @inlinable public static var radix: Construction { 16 }
        @inlinable public static func parse(terminal: Terminal) -> Construction? {
            switch terminal {
            case 0x30 ... 0x39: return Construction.init(terminal - 0x30)
            case 0x61 ... 0x66: return Construction.init(terminal +   10 - 0x61)
            case 0x41 ... 0x46: return Construction.init(terminal +   10 - 0x41)
            default:            return nil
            }
        }
    }
}
