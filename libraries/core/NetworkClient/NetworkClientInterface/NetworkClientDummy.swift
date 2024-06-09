import Foundation

public final class NetworkClientDummy: NetworkClientInterface {
    
    struct Stub {
        let data: Data?
        let response: URLResponse?
        let error: Error?
    }
    
    private var stubs = [URL: Stub]()
    
    public init() {}
        
    public func stub(url: URL, data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
        stubs[url] = Stub(data: data, response: response, error: error)
    }
    
    public func request(from url: URL, completion: @escaping (NetworkClientResult) -> Void) {
        guard let stub = stubs[url] else {
            let error = NSError(domain: "any error", code: -1)
            completion(.failure(error))
            return
        }
        
        if let responseData = stub.data, let responseHTTP = stub.response as? HTTPURLResponse {
            completion(.success((responseData, responseHTTP)))
        } else if let responseError = stub.error {
            completion(.failure(responseError))
        } else {
            let error = NSError(domain: "any error", code: -1)
            completion(.failure(error))
        }
        
    }

}
