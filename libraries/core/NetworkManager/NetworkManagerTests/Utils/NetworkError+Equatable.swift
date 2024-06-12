import Foundation
import NetworkManagerInterface

extension NetworkError: Equatable {
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL, .invalidURL),
            (.invalidResponse, .invalidResponse):
            return true
        case let (.requestFailed(lhsError), .requestFailed(rhsError)):
            return (lhsError as NSError).domain == (rhsError as NSError).domain &&
            (lhsError as NSError).code == (rhsError as NSError).code
        case let (.decodingError(lhsError), .decodingError(rhsError)):
            return (lhsError as NSError).domain == (rhsError as NSError).domain &&
            (lhsError as NSError).code == (rhsError as NSError).code
        default:
            return false
        }
    }
}
