extension Error {
    @available(
        *, deprecated,
        message: """
        calling == on (any Error, any Error) can cause infinite recursion on Swift >= 6.3
        """
    ) public static func == (lhs: Self, rhs: any Error) -> Bool {
        lhs ~= rhs
    }
}
extension Error {
    static func bold(_ string: String) -> String {
        "\u{1B}[1m\(string)\u{1B}[0m"
    }
    static func color(_ string: String) -> String {
        let color: (r: UInt8, g: UInt8, b: UInt8) = (r: 255, g: 51, b: 51)
        return "\u{1B}[38;2;\(color.r);\(color.g);\(color.b)m\(string)\u{1B}[39m"
    }

    public func headline(plaintext: Bool = true) -> String {
        if      let self: any NamedError = self as? any NamedError {
            return plaintext ? self.description :
            "\(Self.bold(Self.color("\(self.name):"))) \(self.message)"
        } else if let error: any CustomStringConvertible = self as? any CustomStringConvertible,
           !error.description.isEmpty {
            return plaintext ? "\(Self.self): \(error.description)" :
            "\(Self.bold(Self.color("\(Self.self):"))) \(error.description)"
        } else {
            return plaintext ? "\(Self.self): (no description available)" :
            "\(Self.bold(Self.color("\(Self.self):"))) (no description available)"
        }
    }

    func description(notes: [String], plaintext: Bool = true) -> String {
        var description: String = self.headline(plaintext: plaintext)
        for note: String in notes.reversed() {
            description += "\n\(plaintext ? "Note:" : Self.bold("Note:")) \(note)"
        }
        return description
    }
}
