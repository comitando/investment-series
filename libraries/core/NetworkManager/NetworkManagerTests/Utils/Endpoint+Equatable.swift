import Foundation
import NetworkManagerInterface

extension Endpoint: Equatable {
    public static func == (lhs: Endpoint, rhs: Endpoint) -> Bool {
        lhs.baseURL == rhs.baseURL &&
        lhs.path == rhs.path &&
        lhs.method == rhs.method &&
        lhs.headers == rhs.headers &&
        NSDictionary(dictionary: lhs.parameters ?? [:]).isEqual(to: rhs.parameters ?? [:])
    }
}
