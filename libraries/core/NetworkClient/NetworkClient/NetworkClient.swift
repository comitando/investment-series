import Foundation
import NetworkClientInterface

public final class NetworkClient {
    private let session: URLSession

    public init(session: URLSession) {
        self.session = session
    }
}

extension NetworkClient: NetworkClientInterface {
    public func request(from url: URL, completion: @escaping (NetworkClientResult) -> Void) {
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = response as? HTTPURLResponse {
                completion(.success((data, response)))
            } else {
                completion(.failure(NSError(domain: "unexpected values", code: -1)))
            }
        }.resume()
    }
}
