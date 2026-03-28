import TestableErrors
import Testing

@Suite struct ErrorComparisonTests {
    @Test static func Operator() {
        struct BarbieError: Error, Equatable {}
        let a: any Error = BarbieError.init()
        let b: any Error = BarbieError.init()
        #expect(a ~= b)
    }
}
