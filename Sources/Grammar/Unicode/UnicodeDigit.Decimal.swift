extension UnicodeDigit where Terminal: BinaryInteger {
    /// Matches a decimal digit, `'0'` through `'9'` (`0x30 ... 0x39`),
    /// and returns its numeric value.
    public enum Decimal: DigitRule where Construction: BinaryInteger {
        @inlinable public static var radix: Construction {
            10
        }
        @inlinable public static func parse(terminal: Terminal) -> Construction? {
            guard 0x30 ... 0x39 ~= terminal else {
                return nil
            }
            return .init(terminal - 0x30)
        }
    }
}
