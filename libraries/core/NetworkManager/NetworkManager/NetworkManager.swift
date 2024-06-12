import Foundation
import NetworkManagerInterface

public final class NetworkManager {
    private let session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
}

extension NetworkManager: NetworkManagerInterface {
    
    // MARK: - Closure-based Methods
    
    @discardableResult
    public func fetchData(
        endpoint: Endpoint,
        completion: @escaping (Result<Data, NetworkError>) -> Void
    ) -> URLSessionDataTask? {
        do {
            let request = try endpoint.urlRequest()
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(.requestFailed(error)))
                    return
                }
                
                guard let data = data,
                      let _ = response as? HTTPURLResponse else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                completion(.success(data))
            }
            
            task.resume()
            
            return task
        } catch {
            completion(.failure(.invalidURL))
            return nil
        }
    }
    
    @discardableResult
    public func fetchAndDecodeData<T: Decodable>(
        endpoint: Endpoint,
        responseType: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) -> URLSessionDataTask? {
        return fetchData(endpoint: endpoint) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try endpoint.decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch let decodingError {
                    completion(.failure(.decodingError(decodingError)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Async/Await Methods
    
    public func fetchData(endpoint: Endpoint) async throws -> Data {
        let request = try endpoint.urlRequest()
        let (data, response) = try await session.data(for: request)
        guard let _ = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        return data
    }
    
    public func fetchAndDecodeData<T: Decodable>(endpoint: Endpoint, responseType: T.Type) async throws -> T {
        let data = try await fetchData(endpoint: endpoint)
        do {
            let decodedData = try endpoint.decoder.decode(T.self, from: data)
            return decodedData
        } catch let decodingError {
            throw NetworkError.decodingError(decodingError)
        }
    }
}
