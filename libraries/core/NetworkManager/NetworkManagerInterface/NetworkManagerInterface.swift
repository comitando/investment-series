import Foundation

public protocol NetworkManagerInterface {
    // MARK: Clousure support
    
    @discardableResult
    func fetchData(endpoint: Endpoint, completion: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionDataTask?
    
    @discardableResult
    func fetchAndDecodeData<T: Decodable>(endpoint: Endpoint, responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) -> URLSessionDataTask?
    
    // MARK: Async/wait support
    
    func fetchData(endpoint: Endpoint) async throws -> Data
    
    func fetchAndDecodeData<T: Decodable>(endpoint: Endpoint, responseType: T.Type) async throws -> T
}
