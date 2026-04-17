extension Pattern {
    public typealias UnsignedInteger<Digit> = UnsignedNormalizedInteger<Digit, Digit>
        where Digit: DigitRule, Digit.Construction: FixedWidthInteger
}
