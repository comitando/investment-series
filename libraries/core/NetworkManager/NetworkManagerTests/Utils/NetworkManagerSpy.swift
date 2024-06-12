import Foundation
import NetworkManagerInterface

final class NetworkManagerSpy: NetworkManagerInterface {
    
    enum Methods: Equatable {
        case fetchDataCalled(Endpoint)
        case fetchAndDecodeDataCalled(Endpoint)
    }
    
    private(set) var methodsCalled = [Methods]()
    var dataResult: Result<Data, NetworkError>?
    var decodeResult: Result<Decodable, NetworkError>?
    
    @discardableResult
    func fetchData(endpoint: Endpoint, completion: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionDataTask? {
        methodsCalled.append(.fetchDataCalled(endpoint))
        if let result = dataResult {
            completion(result)
        }
        return FakeURLSessionDataTask()
    }
    
    @discardableResult
    func fetchAndDecodeData<T>(endpoint: Endpoint, responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) -> URLSessionDataTask? where T : Decodable {
        methodsCalled.append(.fetchAndDecodeDataCalled(endpoint))
        if let result = decodeResult as? Result<T, NetworkError> {
            completion(result)
        }
        return FakeURLSessionDataTask()
    }
    
    func fetchData(endpoint: Endpoint) async throws -> Data {
        methodsCalled.append(.fetchDataCalled(endpoint))
        switch dataResult {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        case .none:
            throw NetworkError.invalidResponse
        }
    }
    
    func fetchAndDecodeData<T>(endpoint: Endpoint, responseType: T.Type) async throws -> T where T : Decodable {
        methodsCalled.append(.fetchAndDecodeDataCalled(endpoint))
        switch decodeResult {
        case .success(let model):
            if let modelAsT = model as? T {
                return modelAsT
            } else {
                throw NetworkError.invalidResponse
            }
        case .failure(let error):
            throw error
        case .none:
            throw NetworkError.invalidResponse
        }
    }
}
