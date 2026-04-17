extension UnicodeDigit where Terminal: BinaryInteger {
    /// Matches a natural digit, `'1'` through `'9'` ([`0x31 ... 0x39`]()),
    /// and returns its numeric value.
    public enum Natural: TerminalRule where Construction: BinaryInteger {
        @inlinable public static func parse(terminal: Terminal) -> Construction? {
            guard 0x31 ... 0x39 ~= terminal else {
                return nil
            }
            return .init(terminal - 0x30)
        }
    }
}
