/// A link in a propogated error.
public protocol TraceableError: CustomStringConvertible, Error {
    var underlying: any Error { get }
    /// Context associated with this error. The *last* note will be printed *first*,
    /// after information related to the ``underlying`` error has been printed.
    var notes: [String] { get }
}

extension TraceableError {
    public var description: String {
        var notes: [String] = []
        var current: any TraceableError = self
        while true {
            notes.append(contentsOf: current.notes)

            switch current.underlying {
            case let next as any TraceableError:
                current = next
            case let last:
                return last.description(notes: notes, plaintext: false)
            }
        }
    }
}
