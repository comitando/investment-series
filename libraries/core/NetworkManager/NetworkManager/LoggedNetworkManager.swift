import Foundation
import os.log
import NetworkManagerInterface

public final class LoggedNetworkManager {
    private let decoratee: NetworkManagerInterface
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "NetworkManager", category: "Network")
    
    public init(decoratee: NetworkManagerInterface) {
        self.decoratee = decoratee
    }
}

extension LoggedNetworkManager: NetworkManagerInterface {
    
    @discardableResult
    public func fetchData(
        endpoint: Endpoint,
        completion: @escaping (Result<Data, NetworkError>) -> Void
    ) -> URLSessionDataTask? {
        logger.debug("Fetching data from endpoint: \(endpoint.baseURL)\(endpoint.path)")
        return decoratee.fetchData(endpoint: endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                self?.logger.debug("Successfully fetched data of size: \(data.count) bytes")
            case .failure(let error):
                self?.logger.error("Failed to fetch data with error: \(error.localizedDescription)")
            }
            completion(result)
        }
    }
    
    @discardableResult
    public func fetchAndDecodeData<T: Decodable>(
        endpoint: Endpoint,
        responseType: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) -> URLSessionDataTask? {
        logger.log("Fetching and decoding data from endpoint: \(endpoint.baseURL)\(endpoint.path)")
        return decoratee.fetchAndDecodeData(endpoint: endpoint, responseType: responseType) { [weak self] result in
            switch result {
            case .success(let decodedData):
                self?.logger.debug("Successfully decoded data: \(String(describing: decodedData))")
            case .failure(let error):
                self?.logger.error("Failed to decode data with error: \(error.localizedDescription)")
            }
            completion(result)
        }
    }
    
    public func fetchData(endpoint: Endpoint) async throws -> Data {
        logger.log("Fetching data from endpoint: \(endpoint.baseURL)\(endpoint.path)")
        do {
            let data = try await decoratee.fetchData(endpoint: endpoint)
            logger.debug("Successfully fetched data of size: \(data.count) bytes")
            return data
        } catch {
            logger.error("Failed to fetch data with error: \(error.localizedDescription)")
            throw error
        }
    }
    
    public func fetchAndDecodeData<T: Decodable>(endpoint: Endpoint, responseType: T.Type) async throws -> T {
        logger.debug("Fetching and decoding data from endpoint: \(endpoint.baseURL)\(endpoint.path)")
        do {
            let decodedData = try await decoratee.fetchAndDecodeData(endpoint: endpoint, responseType: responseType)
            logger.debug("Successfully decoded data: \(String(describing: decodedData))")
            return decodedData
        } catch {
            logger.error("Failed to decode data with error: \(error.localizedDescription)")
            throw error
        }
    }
}
