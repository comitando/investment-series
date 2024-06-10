import Foundation

public struct Endpoint {
    public let baseURL: String
    public let path: String
    public let method: HTTPMethod
    public let headers: [String: String]?
    public let parameters: [String: Any]?
    public let decoder: JSONDecoder
    
    public init(
        baseURL: String,
        path: String,
        method: HTTPMethod,
        headers: [String: String]? = nil,
        parameters: [String: Any]? = nil,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.headers = headers
        self.parameters = parameters
        self.decoder = decoder
    }
}

extension Endpoint {
    
    public func urlRequest() throws -> URLRequest {
        guard var components = URLComponents(string: baseURL + path) else {
            throw NetworkError.invalidURL
        }
        
        if method == .GET, let parameters = parameters {
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let headers = headers {
            for (headerField, headerValue) in headers {
                request.setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
        
        if method != .GET, let parameters = parameters {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        return request
    }
}
