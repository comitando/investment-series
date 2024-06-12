import XCTest
import NetworkManagerInterface
@testable import NetworkManager

final class NetworkManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        URLProtocolStub.startInterceptingRequests()
    }
    
    override func tearDown() {
        super.tearDown()
        URLProtocolStub.stopInterceptingRequests()
    }
    
    struct TestModel: Codable, Equatable {
        let message: String
    }
    
    func testFetchDataSuccess() throws {
        let sut = makeSUT()
        
        let data = "{\"message\":\"success\"}".data(using: .utf8)
        let endpoint = try makeSuccessStub(data: data)
        
        let expectation = expectation(description: "FetchData")
        let task = sut.fetchData(endpoint: endpoint) { result in
            switch result {
            case .success(let responseData):
                XCTAssertEqual(responseData, data)
                expectation.fulfill()
            case .failure:
                XCTFail("Expected success, got failure")
            }
        }
        
        XCTAssertNotNil(task)
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchDataFailure() throws {
        let sut = makeSUT()
        
        let error = NSError(domain: "test", code: 1, userInfo: nil)
        let endpoint = try makeErrorStub(error: error)
        
        let expectation = expectation(description: "FetchData")
        let task = sut.fetchData(endpoint: endpoint) { result in
            switch result {
            case .success:
                XCTFail("Expected failure, got success")
            case .failure(let responseError):
                XCTAssertEqual(responseError, .requestFailed(error))
                expectation.fulfill()
            }
        }
        
        XCTAssertNotNil(task)
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchDataFailureWithInvalidHTTPURlResponse() throws {
        let sut = makeSUT()
        
        let expetedError = NetworkError.invalidResponse
        let data = "{\"message\":\"success\"}".data(using: .utf8)
        let endpoint = try makeSuccessWithInvalidHTTPURLResponseStub(data: data)
        
        let expectation = expectation(description: "FetchData")
        let task = sut.fetchData(endpoint: endpoint) { result in
            switch result {
            case .success:
                XCTFail("Expected failure, got success")
            case .failure(let responseError):
                XCTAssertEqual(responseError.localizedDescription, expetedError.localizedDescription)
                expectation.fulfill()
            }
        }
        
        XCTAssertNotNil(task)
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchAndDecodeDataSuccess() throws {
        let sut = makeSUT()
        
        let model = TestModel(message: "success")
        let data = try JSONEncoder().encode(model)
        let endpoint = try makeSuccessStub(data: data)
        
        let expectation = expectation(description: "FetchAndDecodeData")
        let task = sut.fetchAndDecodeData(endpoint: endpoint, responseType: TestModel.self) { result in
            switch result {
            case .success(let decodedModel):
                XCTAssertEqual(decodedModel, model)
                expectation.fulfill()
            case .failure:
                XCTFail("Expected success, got failure")
            }
        }
        
        XCTAssertNotNil(task)
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchAndDecodeDataFailure() throws {
        let sut = makeSUT()
        
        let error = NSError(domain: "test", code: 1, userInfo: nil)
        let endpoint = try makeErrorStub(error: error)
        
        let expectation = expectation(description: "FetchAndDecodeData")
        let task = sut.fetchAndDecodeData(endpoint: endpoint, responseType: TestModel.self) { result in
            switch result {
            case .success:
                XCTFail("Expected failure, got success")
            case .failure(let responseError):
                XCTAssertEqual(responseError, .requestFailed(error))
                expectation.fulfill()
            }
        }
        
        XCTAssertNotNil(task)
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchAndDecodeDataFailureDecoded() throws {
        let sut = makeSUT()
        
        let expetedError = NetworkError.decodingError(NSError(domain: "", code: -1))
        let model = TestModel(message: "success")
        let data = try JSONEncoder().encode(model)
        let endpoint = try makeSuccessStub(data: data)
        
        let expectation = expectation(description: "FetchAndDecodeData")
        let task = sut.fetchAndDecodeData(endpoint: endpoint, responseType: String.self) { result in
            switch result {
            case .success:
                XCTFail("Expected failure, got success")
            case .failure(let responseError):
                XCTAssertEqual(responseError.localizedDescription, expetedError.localizedDescription)
                expectation.fulfill()
            }
        }
        
        XCTAssertNotNil(task)
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchDataAsyncSuccess() async throws {
        let sut = makeSUT()
        
        let data = "{\"message\":\"success\"}".data(using: .utf8)
        let endpoint = try makeSuccessStub(data: data)
        
        let responseData = try await sut.fetchData(endpoint: endpoint)
        XCTAssertEqual(responseData, data)
    }
    
    func testFetchDataAsyncFailure() async throws {
        let sut = makeSUT()
        
        let error = NSError(domain: "test", code: 1, userInfo: nil)
        let endpoint = try makeErrorStub(error: error)
        
        do {
            _ = try await sut.fetchData(endpoint: endpoint)
        } catch let decodingError {
            XCTAssertEqual(decodingError.localizedDescription, error.localizedDescription)
        }
    }
    
    func testFetchAndDecodeDataAsyncSuccess() async throws {
        let sut = makeSUT()
        
        let model = TestModel(message: "success")
        let data = try JSONEncoder().encode(model)
        let endpoint = try makeSuccessStub(data: data)
        
        let responseData = try await sut.fetchAndDecodeData(endpoint: endpoint, responseType: TestModel.self)
        XCTAssertEqual(responseData, model)
    }
    
    func testFetchAndDecodeDataAsyncFailure() async throws {
        let sut = makeSUT()
        
        let error = NSError(domain: "test", code: 1, userInfo: nil)
        let endpoint = try makeErrorStub(error: error)
        
        do {
            _ = try await sut.fetchAndDecodeData(endpoint: endpoint, responseType: TestModel.self)
        } catch let decondingError {
            XCTAssertEqual(decondingError.localizedDescription, error.localizedDescription)
        }
    }
}

private extension NetworkManagerTests {
    func makeSUT() -> NetworkManager {
        return NetworkManager(session: URLSession.shared)
    }
    
    func makeSuccessWithInvalidHTTPURLResponseStub(data: Data?) throws -> Endpoint {
        let endpoint = Endpoint(baseURL: "https://comitando.com.br", path: "/test", method: .GET)
        let urlRequest = try XCTUnwrap(endpoint.urlRequest())
        let url = try XCTUnwrap(endpoint.urlRequest().url)
        let httpResponse = URLResponse(url: url, mimeType: nil, expectedContentLength: 0, textEncodingName: nil)
        
        URLProtocolStub.stub(url: urlRequest, data: data, response: httpResponse, error: nil)
        
        return endpoint
    }
    
    func makeSuccessStub(data: Data?) throws -> Endpoint {
        let endpoint = Endpoint(baseURL: "https://comitando.com.br", path: "/test", method: .GET)
        let urlRequest = try XCTUnwrap(endpoint.urlRequest())
        let url = try XCTUnwrap(endpoint.urlRequest().url)
        let httpResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        
        URLProtocolStub.stub(url: urlRequest, data: data, response: httpResponse, error: nil)
        
        return endpoint
    }
    
    func makeErrorStub(error: Error?) throws -> Endpoint {
        let endpoint = Endpoint(baseURL: "https://comitando.com.br", path: "/test", method: .GET)
        let urlRequest = try XCTUnwrap(endpoint.urlRequest())
        
        URLProtocolStub.stub(url: urlRequest, data: nil, response: nil, error: error)
        
        return endpoint
    }
}
