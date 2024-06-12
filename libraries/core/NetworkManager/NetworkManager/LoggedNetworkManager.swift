import Foundation
import os.log
import NetworkManagerInterface

public final class LoggedNetworkManager {
    private let network: NetworkManagerInterface
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "NetworkManager", category: "Network")
    
    public init(network: NetworkManagerInterface) {
        self.network = network
    }
    
    private func logRequest(_ endpoint: Endpoint) {
        let urlRequest = try? endpoint.urlRequest()
        logger.log(level: .info, "Request: \(urlRequest?.cURLRepresentation() ?? "Invalid request")")
    }
    
    private func logDataResponse(result: Result<Data, NetworkError>) {
        switch result {
        case .success(let data):
            logger.info("Response: Successfully fetched data of size: \(data.count) bytes")
            logger.info("Response: Success with data of size \(data.count) bytes")
        case .failure(let error):
            logger.log(level: .error, "Response: Failure with error \(error.localizedDescription)")
        }
    }
    
    private func logDecodableResponse<T: Decodable>(result: Result<T, NetworkError>) {
        switch result {
        case .success(let decodedData):
            logger.info("Response: Successfully decoded data: \(String(describing: decodedData))")
        case .failure(let error):
            logger.error("Response: Failed to decode data with error \(error.localizedDescription)")
        }
    }
}

extension LoggedNetworkManager: NetworkManagerInterface {
    
    @discardableResult
    public func fetchData(
        endpoint: Endpoint,
        completion: @escaping (Result<Data, NetworkError>) -> Void
    ) -> URLSessionDataTask? {
        logRequest(endpoint)
        return network.fetchData(endpoint: endpoint) { [weak self] result in
            self?.logDataResponse(result: result)
            completion(result)
        }
    }
    
    @discardableResult
    public func fetchAndDecodeData<T: Decodable>(
        endpoint: Endpoint,
        responseType: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) -> URLSessionDataTask? {
        logRequest(endpoint)
        return network.fetchAndDecodeData(endpoint: endpoint, responseType: responseType) { [weak self] result in
            self?.logDecodableResponse(result: result)
            completion(result)
        }
    }
    
    public func fetchData(endpoint: Endpoint) async throws -> Data {
        logRequest(endpoint)
        do {
            let data = try await network.fetchData(endpoint: endpoint)
            logDataResponse(result: .success(data))
            return data
        } catch {
            logger.error("Response: Failure with error \(error.localizedDescription)")
            throw error
        }
        
    }
    
    public func fetchAndDecodeData<T: Decodable>(endpoint: Endpoint, responseType: T.Type) async throws -> T {
        logRequest(endpoint)
        do {
            let decodedData = try await network.fetchAndDecodeData(endpoint: endpoint, responseType: responseType)
            logDecodableResponse(result: .success(decodedData))
            return decodedData
        } catch {
            logger.error("Response: Failed to decode data with error \(error.localizedDescription)")
            throw error
        }
    }
}

extension URLRequest {
    func cURLRepresentation() -> String {
        guard let url = url else { return "" }
        var baseCommand = "curl \"\(url.absoluteString)\""
        
        if let method = httpMethod {
            baseCommand += " -X \(method)"
        }
        
        for (header, value) in allHTTPHeaderFields ?? [:] {
            baseCommand += " -H \"\(header): \(value)\""
        }
        
        if let httpBody = httpBody, let bodyString = String(data: httpBody, encoding: .utf8) {
            baseCommand += " -d '\(bodyString)'"
        }
        
        return baseCommand
    }
}
