import Foundation

final class URLProtocolStub: URLProtocol {
    
    private static var stubs = [URLRequest: Stub]()
    
    private struct Stub {
        let data: Data?
        let response: URLResponse?
        let error: Error?
    }
    
    static func stub(url: URLRequest, data: Data?, response: URLResponse?, error: Error?) {
        stubs[url] = Stub(data: data, response: response, error: error)
    }
    
    static func startInterceptingRequests() {
        URLProtocol.registerClass(URLProtocolStub.self)
    }
    
    static func stopInterceptingRequests() {
        URLProtocol.unregisterClass(URLProtocolStub.self)
        stubs = [:]
    }
    
    override class func canInit(with request: URLRequest) -> Bool {
        return URLProtocolStub.stubs[request] != nil
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let stub = URLProtocolStub.stubs[request] else { return }
        
        if let data = stub.data {
            client?.urlProtocol(self, didLoad: data)
        }
        
        if let response = stub.response {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }
        
        if let error = stub.error {
            client?.urlProtocol(self, didFailWithError: error)
        }
        
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}

final class FakeURLSessionDataTask: URLSessionDataTask {
    override func resume() {}
}
